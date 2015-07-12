
#import "HDMProduct.h"
#import "HDMSection.h"
#import "HDMNetwork.h"
#import "HDMFunction.h"
//#import "HDMDatabaseOperation.h"

@interface HDMProduct ()
{
    NSDictionary * _downloadDictionary;
}

@end

@implementation HDMProduct

@synthesize watchTime = _watchTime;


+ (instancetype)testInstance {
    
    static HDMProduct * instance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{instance = [[self alloc] initWithAttributes:@{@"chann_id": @"2",
                                                                              @"opus_id": @"10294"}];});
    
    return instance;
}


- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    self = [super initWithAttributes:attributes];
    if (self)
    {
        
    }
    
    return self;
}





- (void)eggSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] egg_submit_POST_Chann_id:self.chann_id Opus_id:self.opus_id Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSInteger i_eggs = self.eggs.integerValue;
            self.eggs = BCIntegerString(++i_eggs);
            [self updateCacheEggs:self.eggs];
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}

- (void)flowerSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] flower_submit_POST_Chann_id:self.chann_id Opus_id:self.opus_id Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSInteger i_flowers = self.flowers.integerValue;
            self.flowers = BCIntegerString(++i_flowers);
            [self updateCacheFlowers:self.flowers];
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}

- (void)updateCacheEggs:(NSString *)eggs
{
    NSMutableDictionary *cacheDic = [NSMutableDictionary dictionaryWithDictionary :[self getCache]];
    if(cacheDic == nil)
        return;
    
    const NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithDictionary:[cacheDic objectForKey:@"info"]];
    [infoDic setValue:eggs forKey:@"eggs"];
    [cacheDic setValue:infoDic forKey:@"info"];
    
    [self saveWithData:cacheDic];
}
- (void)updateCacheFlowers:(NSString *)flowers
{
    NSMutableDictionary *cacheDic = [NSMutableDictionary dictionaryWithDictionary :[self getCache]];
    if(cacheDic == nil)
        return;
    
    const NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithDictionary:[cacheDic objectForKey:@"info"]];    [infoDic setValue:flowers forKey:@"flowers"];
    [cacheDic setValue:infoDic forKey:@"info"];
    
    [self saveWithData:cacheDic];
}
- (void)saveWithData:(NSDictionary *)cacheDic
{
    //保存
    NSString *detailKey = [self getCacheFileName];
    NSData *detailData = [NSKeyedArchiver archivedDataWithRootObject:cacheDic];
//    [[CacheManager sharedManager] cachedWithData:detailData theKey:detailKey];
  //  [[CacheManager sharedManager] storeToDisk];
}
- (NSString *)getCacheFileName
{
    //读取缓存数据 由名称_频道ID_作品ID组成
  //  NSString *detailKey = [NSString stringWithFormat:@"%@_%@_%@",[CacheSymbolArray objectAtIndex:Cache_Detail_Tag],self.chann_id,self.opus_id];
    return @"";
  //  return detailKey;
}
- (NSDictionary *)getCache
{
//    NSString *detailKey = [self getCacheFileName];
//    URLCacheElement* element = [[CacheManager sharedManager].urlDictionary objectForKey:detailKey];
//    
//    //data转换为dictionary
//    NSDictionary *detailDataDic = [NSKeyedUnarchiver unarchiveObjectWithData:element.data];
//    
//    //存在缓存数据时候，显示缓存数据
//    if(detailDataDic != nil)
//    {
//        return detailDataDic;
//    }
    return nil;
}
- (NSDictionary *)haveDownload;{
    
    NSString * unit = @"话";
    switch ([self.chann_id integerValue])
    {
        case HDMDongHuaChannel:
        {
            unit = @"集";
        }break;
            
        default:
            break;
    }
    
//    __block NSInteger count = 0;
//    
//    NSInteger downloadType = BCDownload_Wait;
//    [[[HDMProduct class] classDatabaseQueue] inDatabase:^(BCDatabase *db) {
//        
//        BCResultSet * rs = [db executeQueryWithFormat:
//                            @"SELECT count(*) as 'count' FROM HDMSection WHERE opus_id = %@ AND (downloadStatus = %@ OR downloadStatus = %@)", self.opus_id, BCIntegerString(BCDownload_Wait), BCIntegerString(BCDownload_Ing)];
//        while ([rs next])
//        {
//            count = [rs intForColumn:@"count"];
//        }
//    }];
//    
//    if (count==0)
//    {
//        downloadType = BCDownload_Pause;
//        [[[HDMProduct class] classDatabaseQueue] inDatabase:^(BCDatabase *db) {
//            
//            BCResultSet * rs = [db executeQueryWithFormat:
//                                @"SELECT count(*) as 'count' FROM HDMSection WHERE opus_id = %@ AND downloadStatus = %@", self.opus_id, BCIntegerString(downloadType)];
//            while ([rs next])
//            {
//                count = [rs intForColumn:@"count"];
//            }
//        }];
//    }
//    
//    if (count==0)
//    {
//        downloadType = BCDownload_Fail;
//        [[[HDMProduct class] classDatabaseQueue] inDatabase:^(BCDatabase *db) {
//            
//            BCResultSet * rs = [db executeQueryWithFormat:
//                                @"SELECT count(*) as 'count' FROM HDMSection WHERE opus_id = %@ AND downloadStatus = %@", self.opus_id, BCIntegerString(downloadType)];
//            while ([rs next])
//            {
//                count = [rs intForColumn:@"count"];
//            }
//        }];
//    }
//    
//    if (count==0)
//    {
//        downloadType = BCDownload_None;
//    }
//    
//    return @{@"downloadType": [NSNumber numberWithInteger:downloadType],
//             @"count": [NSNumber numberWithInteger:count],
//             @"unit": unit};
    return nil;
}

- (NSDictionary *)hadDownloaded;{
    
//    NSString * unit = @"话";
//    switch ([self.chann_id integerValue])
//    {
//        case HDMDongHuaChannel:
//        {
//            unit = @"集";
//        }break;
//            
//        default:
//            break;
//    }
//    
//    __block NSInteger count = 0;
//    __block long long fileSize = 0;
//    
//    [[[HDMProduct class] classDatabaseQueue] inDatabase:^(BCDatabase *db) {
//        
//        BCResultSet * rs = [db executeQueryWithFormat:
//                            @"SELECT fileSize FROM HDMSection WHERE opus_id = %@ AND downloadStatus = 1", self.opus_id];
//        while ([rs next])
//        {
//            // just print out what we've got in a number of formats.
//            count++;
//            fileSize += [[rs stringForColumn:@"fileSize"] longLongValue];
//        }
//    }];
//    
//    return @{@"unit": unit,
//             @"count": [NSNumber numberWithInteger:count],
//             @"fileSize": [NSString BC_TGMKBSize:fileSize]};
    return  nil;
}


/*!
 * 提交评论
 * 赋值给comment_content
 */
- (void)commentSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] comment_submit_POST_Chann_id:self.chann_id Opus_id:self.opus_id Comment_content:self.comment_content Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            //jf_hint
            NSString * jf_hint = [responseObject objectForKey:@"jf_hint"];
//            if([jf_hint length] >0)
//                [MBProgressHUD showHudForJifenHintWithKeyWindow:jf_hint Message:msg];
//            else
//                [MBProgressHUD showHudMsgWithKeyWindow:msg];
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}


- (void)favorSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] favor_submit_POST_Chann_id:self.chann_id Opus_id:self.opus_id Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSString * jf_hint = [responseObject objectForKey:@"jf_hint"];
        
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg",jf_hint,@"jf_hint", nil];
        
        if (![code boolValue])
        {
            NSInteger i_favor = self.favor.integerValue;
            self.favor = BCIntegerString(++i_favor);
            
            self.is_favor = @"1";
//            // jf_hint
//            NSString * jf_hint = [responseObject objectForKey:@"jf_hint"];
//            if([jf_hint length] >0)
//                [MBProgressHUD showHudForJifenHintWithKeyWindow:jf_hint Message:msg];
//            else
//                [MBProgressHUD showHudMsgWithKeyWindow:msg];
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}

- (void)favorCancelSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] cancel_opus_favor_POST_Chann_id:self.chann_id Opus_id:self.opus_id Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSInteger i_favor = self.favor.integerValue;
            self.favor = BCIntegerString(--i_favor);
            
            self.is_favor = @"0";
            
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}


- (void)detailQuerySuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] query_opus_detail_GET_Chann_id:self.chann_id Opus_id:self.opus_id Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:
                                                [responseObject objectForKey:@"info"]];//修改一处
            //字段赋值---时间点
            [self propertyWithAttributes:attributes];
            
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}


//查询作品额外信息 add  by  suzq  比如 收藏状态  2014.10.31
- (void)detailSelSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] query_opus_extend_sel_GET_Chann_id:self.chann_id Opus_id:self.opus_id Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:
                                                [responseObject objectForKey:@"info"]];//修改一处
            [self propertyWithAttributes:attributes];
            
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}




- (void)spendingTipSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] query_opus_spend_tip_GET_Product_money:self.product_money Is_point:self.isPoint Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            // spending_type
            self.spending_tip = [[responseObject objectForKey:@"info"] objectForKey:@"spending_tip"];
            self.spending_type = [[responseObject objectForKey:@"info"] objectForKey:@"spending_type"];
            
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}




- (void)setOpus_id:(NSString *)opus_id;{
    
    _opus_id = opus_id;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(downloadNotificationOperation:)
                                                 name:[NSString stringWithFormat:@"Product::%@", opus_id] object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sectionChangeNotificationOperation:)
                                                 name:[NSString stringWithFormat:@"Product-%@-Section-Change", opus_id] object:nil];
}

- (void)downloadNotificationOperation:(NSNotification *)notification;{
    
    NSDictionary * userInfo = [notification userInfo];
    
    if ([[userInfo objectForKey:@"opus_id"] isEqualToString:self.opus_id])
    {
        self.downloadProgress = [userInfo objectForKey:@"downloadProgress"];
        //self.isChanged = YES;
    }
}

- (void)sectionChangeNotificationOperation:(NSNotification *)notification;{
    
    self.isChanged = YES;
}

- (NSNumber *)modelTag;{
    
    return [NSNumber numberWithInteger:[self.opus_id integerValue]];
}




- (NSArray *)obtainDownloadSectionList;{
    
    self.m_downloadSectionList = [NSMutableArray array];
    
//    [[HDMSection classDatabaseQueue] inDatabase:^(BCDatabase *db) {
//        
//        BCResultSet * rs = [db executeQueryWithFormat:@"SELECT * FROM HDMSection WHERE downloadStatus > 0 AND opus_id = %@ ORDER BY index_id*1", self.opus_id];
//        while ([rs next])
//        {
//            HDMSection * section = [[HDMSection alloc] initWithAttributes:nil];
//            NSMutableArray * databasePropertyArray = [[NSMutableArray alloc] initWithArray:
//                                                      [[[HDMSection class] databasePropertyMap] allKeys]];//修改一处client
//            
//            [databasePropertyArray addObject:@"modelTag"];
//            for (NSString * key in databasePropertyArray)
//            {
//                @try
//                {
//                    if ([key isEqualToString:@"modelTag"])
//                    {
//                        int intValue = [rs intForColumn:key];
//                        [section setValue:[NSNumber numberWithInt:intValue] forKey:key];
//                    }
//                    else
//                    {
//                        id object = [rs stringForColumn:key];
//                        if (!(object==nil || [object isKindOfClass:[NSNull class]]))
//                        {
//                            [section setValue:object forKey:key];
//                        }
//                    }
//                }
//                @catch (NSException *exception)
//                {
//                    NSLog(@"exception key: %@", key);
//                }
//                @finally
//                {
//                    ;
//                }
//            }
//            
//            [self.m_downloadSectionList addObject:section];
//        }
//    }];
    
    return self.m_downloadSectionList;
}


- (HDMSection *)addDownloadSection:(HDMSection *)section;{
    
    //[self selectModel];//更新数据
    
    if (![self.inDownload boolValue])
    {
        self.inDownload = @"1";
        self.timeDownload = [NSString stringWithFormat:@"%@",
                             [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]]];
        
      //  [self updateModel];//更新数据库
    }
    
    [section changeDownloadStatus:BCDownload_Wait];
    
    HDMSection * downloadSection = nil;
    
    if ([self.m_downloadSectionList count]==0)
    {
        self.m_downloadSectionList = [NSMutableArray array];
        downloadSection = section;
        [self.m_downloadSectionList insertObject:downloadSection atIndex:0];
    }
    else
    {
        for (HDMSection * dSection in self.m_downloadSectionList)
        {
            if ([dSection.content_id isEqualToString:section.content_id])
            {
                dSection.index_id = section.index_id;
                downloadSection = dSection;
                break;
            }
        }
        
        if (!downloadSection)
        {
            for (int i=0; i<[self.m_downloadSectionList count]; i++)
            {
                HDMSection * inSection = [self.m_downloadSectionList objectAtIndex:i];
                if ([inSection.index_id integerValue] > [section.index_id integerValue])
                {
                    downloadSection = section;
                    [self.m_downloadSectionList insertObject:downloadSection atIndex:i]; break;
                }
            }
            
            if (!downloadSection)
            {
                downloadSection = section;
                [self.m_downloadSectionList addObject:downloadSection];
            }
        }
    }
    
    return downloadSection;
}


//- (void)addDownloadSection:(HDMSection *)section;{
//    
//    [self selectModel];//更新数据
//    
//    if (![self.inDownload boolValue])
//    {
//        self.inDownload = @"1";
//        self.timeDownload = [NSString stringWithFormat:@"%@",
//                             [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]]];
//        
//        [self updateModel];//更新数据库
//    }
//    
//    [section changeDownloadStatus:BCDownload_Wait];
//}

/*!
 *  暂停下载话集
 *
 *  @param section <#section description#>
 */
- (void)pauseDownloadSection:(HDMSection *)section;{
    
}

- (NSInteger)downloadSectionNumber;{
    
    __block NSInteger count = 0;
    
//    [[[HDMProduct class] classDatabaseQueue] inDatabase:^(BCDatabase *db) {
//        
//        BCResultSet * rs = [db executeQueryWithFormat:
//                            @"SELECT count(*) as 'count', fileSize FROM HDMSection WHERE opus_id = %@ AND downloadStatus > 0", self.opus_id];
//        while ([rs next])
//        {
//            count = [rs intForColumn:@"count"];
//        }
//    }];
//    
    return count;
}


- (NSArray *)obtainPauseFailDownloadSectionList;{
    
    NSMutableArray * sectionList = [NSMutableArray array];
//    
//    [[HDMSection classDatabaseQueue] inDatabase:^(BCDatabase *db) {
//        
//        BCResultSet * rs = [db executeQueryWithFormat:@"SELECT * FROM HDMSection WHERE downloadStatus = %@ OR downloadStatus = %@  AND opus_id = %@ ORDER BY index_id*1", BCIntegerString(BCDownload_Pause), BCIntegerString(BCDownload_Fail), self.opus_id];
//        while ([rs next]){
//            
//            HDMSection * section = [[HDMSection alloc] initWithAttributes:nil];
//            
//            NSMutableArray * databasePropertyArray = [[NSMutableArray alloc] initWithArray:
//                                                      [[[HDMSection class] databasePropertyMap] allKeys]];//修改一处client
//            
//            [databasePropertyArray addObject:@"modelTag"];
//            for (NSString * key in databasePropertyArray)
//            {
//                @try
//                {
//                    if ([key isEqualToString:@"modelTag"])
//                    {
//                        int intValue = [rs intForColumn:key];
//                        [section setValue:[NSNumber numberWithInt:intValue] forKey:key];
//                    }
//                    else
//                    {
//                        id object = [rs stringForColumn:key];
//                        if (!(object==nil || [object isKindOfClass:[NSNull class]]))
//                        {
//                            [section setValue:object forKey:key];
//                        }
//                    }
//                }
//                @catch (NSException *exception)
//                {
//                    NSLog(@"exception key: %@", key);
//                }
//                @finally
//                {
//                    ;
//                }
//            }
//            
//            [sectionList addObject:section];
//        }
//    }];
    
    return sectionList;
}



- (NSInteger)waitDownloadSectionNumber;{
    
    __block NSInteger count = 0;
    
//    [[[HDMProduct class] classDatabaseQueue] inDatabase:^(BCDatabase *db) {
//        
//        BCResultSet * rs = [db executeQueryWithFormat:
//                            @"SELECT count(*) as 'count', fileSize FROM HDMSection WHERE opus_id = %@ AND downloadStatus = %@", self.opus_id, BCIntegerString(BCDownload_Wait)];
//        while ([rs next])
//        {
//            count = [rs intForColumn:@"count"];
//        }
//    }];
    
    return count;
}

- (NSInteger)unDownloadSectionNumber;{
    
    __block NSInteger count = 0;
    
//    [[[HDMProduct class] classDatabaseQueue] inDatabase:^(BCDatabase *db) {
//        
//        BCResultSet * rs = [db executeQueryWithFormat:
//                            @"SELECT count(*) as 'count', fileSize FROM HDMSection WHERE opus_id = %@ AND downloadStatus > 1", self.opus_id];
//        while ([rs next])
//        {
//            count = [rs intForColumn:@"count"];
//        }
//    }];
    
    return count;
}

- (void)deleteDownloadSection:(HDMSection *)section;{
    
    if ([self downloadSectionNumber]==1)
    {
        self.inDownload = @"";
        self.timeDownload = @"";
        
      //  [self updateModel];//更新数据库
    }
    
    [section changeDownloadStatus:BCDownload_None];
}


+ (NSDictionary *)databasePropertyMap;{
    
    return @{@"chann_id": @"chann_id",
             @"opus_id": @"opus_id",
             @"opus_name": @"opus_name",
             @"opus_url": @"opus_url",
             @"status_value": @"status_value",
             @"sum_count": @"sum_count",
             @"inDownload": @"inDownload",
             @"watchTime": @"watchTime",
             
             //@"chann_id": @"chann_id",
             @"sum_count": @"sum_count",
             @"status_value": @"status_value",
            @"last_content_name": @"last_content_name",//nzbrowser
             @"timeDownload": @"timeDownload"};
}






- (NSString *)percentageDownloadProgress;{
    
    NSString * percentage = @"%";
    
    return [NSString stringWithFormat:@"%2f%@", [self.downloadProgress floatValue]*100, percentage];
}



- (HDMSection *)downloadNextSection;{
    
    __block HDMSection * section = nil;
    
//    [[HDMProduct classDatabaseQueue] inDatabase:^(BCDatabase *db) {
//        
//        BCResultSet * rs = [db executeQueryWithFormat:@"SELECT * FROM HDMSection WHERE downloadStatus = %@ AND opus_id = %@ ORDER BY index_id*1 Limit 1", BCIntegerString(BCDownload_Wait), self.opus_id];
//        while ([rs next])
//        {
//            section = [[HDMSection alloc] initWithAttributes:nil];
//            NSMutableArray * databasePropertyArray = [[NSMutableArray alloc] initWithArray:
//                                                      [[[HDMSection class] databasePropertyMap] allKeys]];//修改一处client
//            
//            [databasePropertyArray addObject:@"modelTag"];
//            for (NSString * key in databasePropertyArray)
//            {
//                @try
//                {
//                    if ([key isEqualToString:@"modelTag"])
//                    {
//                        int intValue = [rs intForColumn:key];
//                        [section setValue:[NSNumber numberWithInt:intValue] forKey:key];
//                    }
//                    else
//                    {
//                        id object = [rs stringForColumn:key];
//                        if (!(object==nil || [object isKindOfClass:[NSNull class]]))
//                        {
//                            [section setValue:object forKey:key];
//                        }
//                    }
//                }
//                @catch (NSException *exception)
//                {
//                    NSLog(@"exception key: %@", key);
//                }
//                @finally
//                {
//                    ;
//                }
//            }
//        }
//    }];
    
    return section;
}



- (NSString *)detailStatusString;{
    
    NSString * string = nil;
    
    NSRange range1=[self.sum_count rangeOfString:@"集"];
    NSRange range2=[self.sum_count rangeOfString:@"话"];
    
    NSLog(@"self.sum_count:%@",self.sum_count);
    NSLog(@"");
    
    if(range1.length>0 || range2.length>0)
    {
        return self.sum_count;
    }
    
    
    if ([self.status_value isEqualToString:@"完结"])
    {
        string = [NSString stringWithFormat:@"%@%@全", self.sum_count, [HDMFunction typeStringOfChannel:[self.chann_id integerValue]]];
    }
    else
    {
        string = [NSString stringWithFormat:@"更新至%@%@", self.sum_count, [HDMFunction typeStringOfChannel:[self.chann_id integerValue]]];
    }
    
    return string;
}


#pragma mark - 数据下载 -

- (void)changeSectionDownloadStatus:(BCDownloadStatus)status;{
    
    _downloadDictionary = nil;
    
    self.isChanged = YES;
  //  [self updateModelAttributeForKeys:@[@"isChanged"]];
}





- (NSString *)watchTime;{
    
    if ([_watchTime length]<1)
    {
        _watchTime = @"0";
    }
    
    return _watchTime;
}




#pragma mark -

- (NSDictionary *)downloadDictionary;{
    
  //  _downloadDictionary = [[HDMDatabaseOperation sharedInstance] obtainDownloadInformationOfProduct:self];
//    if (!_downloadDictionary)
//    {
//        _downloadDictionary = [[HDMDatabaseOperation sharedInstance] obtainDownloadInformationOfProduct:self];
//    }
    
   // return [[NSDictionary alloc] initWithDictionary:_downloadDictionary];
    return nil;
}


@end
