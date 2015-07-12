//
//  HDMSection.m
//  User
//
//  Created by Sea on 14-6-4.
//
//

//#import "HDMLocalDownloadManager.h"
#import "HDMSection.h"
#import "HDMProduct.h"
#import "HDMNetwork.h"
#import "HDMOrder.h"


@implementation HDMSection

@synthesize quality = _quality;
@synthesize fileSize = _fileSize;
@synthesize sectionTag = _sectionTag;
@synthesize downloadBytes = _downloadBytes;
@synthesize downloadStatus = _downloadStatus;
@synthesize downloadProgress = _downloadProgress;
@synthesize typeString = _typeString;


+ (instancetype)testInstance;{
    
    static HDMSection * instance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] initWithAttributes:@{@"chann_id": @"2",
                                                      @"opus_id": @"390",
                                                      @"content_id": @"1033053",
                                                      @"quality": @"1",
                                                      @"watchType": @"0"}];
    });
    
    return instance;
}



- (NSString *)superKey;{
    
    return self.opus_id;
}


- (void)downloadNotificationOperation:(NSNotification *)notification;{
    
    NSDictionary * userInfo = [notification userInfo];
    
    //self.isChanged = [NSNumber numberWithBool:YES];
    self.downloadProgress = [userInfo objectForKey:@"downloadProgress"];
}

/*!
 * 添加书签
 */
- (void)bookmarkAddSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    if (self.mark_value.integerValue>1008611)
    {
        failure(@{@"code":@"1", @"msg":@"添加书签失败"});
        return;
    }
    [[HDMNetwork sharedInstance] add_mark_POST_Chann_id:self.chann_id Opus_id:self.opus_id Content_id:self.content_id Page:self.mark_value Quality:self.quality Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
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

- (void)changeWatchState:(HDMWatchState)watchState;{
    
}

- (NSString *)watch_type;{
    
    NSString * watch_type = nil;
    switch (self.watchType)
    {
        case comicOnlinePlay:
        {
            watch_type = @"comicOnlinePlay";
        }break;
            
        case comicDownload:
        {
            watch_type = @"comicDownload";
        }break;
            
        case videoOnlinePlay:
        {
            watch_type = @"videoOnlinePlay";
        }break;
            
        case videoDownload:
        {
            watch_type = @"videoDownload";
        }break;
            
        case themeDownload:
        {
            watch_type = @"themeDownload";
        }break;
            
        case qxsOnlinePlay:
        {
            watch_type = @"qxsOnlinePlay";
        }break;
            
        case qxsDownload:
        {
            watch_type = @"qxsDownload";
        }break;
            
        default:
        {
            watch_type = @"comicOnlinePlay";
        }break;
    }
    return watch_type;
}

- (HDMWatchType)watchTypeInDownload:(BOOL)yesOrNo;{
    
    if (yesOrNo)
    {
        switch ([self.chann_id integerValue])
        {
            case HDMManHuaChannel:
            {
                return comicDownload;
            }break;
                
            case HDMDongHuaChannel:
            {
                return videoDownload;
            }break;
                
            default:
                break;
        }
    }
    else
    {
        switch ([self.chann_id integerValue])
        {
            case HDMManHuaChannel:
            {
                return comicOnlinePlay;
            }break;
                
            case HDMDongHuaChannel:
            {
                return videoOnlinePlay;
            }break;
                
            default:
                break;
        }
    }
    
    return comicOnlinePlay;
}

- (void)changeOrderStatus:(BCOrderStatus)status
{
    self.orderStatus = BCIntegerString(status);
   // [self updateModelForKeys:@[@"orderStatus"]];
}



- (void)changeDownloadStatus:(BCDownloadStatus)status;{
    
    self.downloadStatus = BCIntegerString(status);
    
    switch (status)
    {
        case BCDownload_None:
        {
            NSString * path = [BCConfigure kFileDownloadPath];
            
            NSLog(@"self.fileName::%@", self.fileName);
            if ([self.fileName length]>0)
            {
                NSError * error = NULL;
                NSString * fullPath = [path stringByAppendingPathComponent:self.fileName];
                
                BOOL result = [[NSFileManager defaultManager] removeItemAtPath:fullPath error:&error];
                if (!result)
                {
                    NSLog(@"Error: %@", error);
                }
                else
                {
                    self.fileName = @"";
                    self.fileSize = @"";
                    self.downloadProgress = @"0";
              //      [self updateModelForKeys:@[@"fileName", @"fileSize", @"downloadProgress"]];
                }
            }
            
        }break;
            
        case BCDownload_Ing:
        {
            
        }break;
        case BCDownload_Fail:
        {
           // [MBProgressHUD showHudMsgWithKeyWindow:@">_<下载失败鸟"];
        }
            break;
        case BCDownload_Finish:
        {
            self.downloadProgress = @"1";
          //  [self updateModelForKeys:@[@"downloadProgress"]];
        }break;
            
        default:
            break;
    }
    
   // [self updateModelForKeys:@[@"downloadStatus"]];
}


- (HDMWatchState)obtainWatchState;{
    
    return HDMWatchState_None;
}


- (void)syncAuthSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [HDMNetwork sharedInstance].completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [self authSubmitSuccess:^(NSDictionary *codeMsg) {
        
        NSLog(@"ing");
        success(codeMsg);
        dispatch_semaphore_signal(semaphore);
    } Failure:^(NSDictionary *codeMsg) {
        
        NSLog(@"ing");
        failure(codeMsg);
        dispatch_semaphore_signal(semaphore);
    }];
    
    NSLog(@"before");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"after");
    [HDMNetwork sharedInstance].completionQueue = NULL;
}


- (void)authSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] new_auth_order_relation_POST_Chann_id:self.chann_id Opus_id:self.opus_id Content_id:self.content_id Quality:self.quality Watch_type:[self watch_type] Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSMutableArray * contextList = [NSMutableArray array];
            NSArray * array = [responseObject objectForKey:@"list"];//修改一处
            for (NSDictionary * dictionary in array)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMOrder * model = [[HDMOrder alloc] initWithAttributes:attributes];//修改二处
                model.chann_id = self.chann_id;
                model.opus_id = self.opus_id;
                model.content_id = self.content_id;
                
                [contextList addObject:model];
            }
            _orderList = [NSArray arrayWithArray:contextList];
            
            NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:responseObject];//修改一处
            [attributes removeObjectForKey:@"list"];
            [attributes removeObjectForKey:@"code"];
            [attributes removeObjectForKey:@"msg"];
            
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





- (void)isOrderQuerySuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] query_content_id_isorder_POST_Chann_id:self.chann_id Opus_id:self.opus_id Content_id:self.content_id Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            self.isorder = [[responseObject objectForKey:@"info"] objectForKey:@"isorder"];
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


- (NSArray *)orderList;{
    
    return _orderList;
}


- (long long)downloadBytes;{
    
    _downloadBytes = 0;
    
    NSString *documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path = [documentsDirectoryPath stringByAppendingPathComponent:[BCConfigure kFileDownloadPath]];
    
    NSString *fullPath = [path stringByAppendingPathComponent:self.content_id];
    
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:fullPath])
    {
        // 获取已下载的文件长度
     //   _downloadBytes = [NSFileManager bc_fileSizeForPath:fullPath];
        //add by silence 20150625
       // [DBTool addSkipBackupAttributeToItemAtPath:fullPath];
        
    }
    
    return _downloadBytes;
}

- (void)bugOrder:(NSDictionary *)order Success:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
    
    NSString * product_id = [order objectForKey:@"product_id"];
    NSString * spending_type = [order objectForKey:@"spending_type"];
    NSString * product_type = [order objectForKey:@"product_type"];
    
    NSString * content_id = @"-1";
    NSString * opus_id = @"-1";
    NSString * chann_id = @"-1";
    switch ([product_type integerValue])
    {
        case 0:
        {
            content_id = self.content_id;
            opus_id = self.opus_id;
            chann_id = self.chann_id;
        }break;
            
        case 1:
        {
            opus_id = self.opus_id;
            chann_id = self.chann_id;
        }break;
            
        default:
        {
            
        }break;
    }
    
    [[HDMNetwork sharedInstance] subscribe_product_POST_Product_ids:@[product_id] Opertion_type:BCIntString(self.watchType) Product_type:product_type Content_id:content_id Opus_id:opus_id Chann_id:chann_id Spending_type:spending_type Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        if([error isKindOfClass:[NSDictionary class]])
        {
            //修改code 为了后面的处理好判断条件
//            NSMutableDictionary *tempDic = [[NSMutableDictionary alloc] initWithDictionary:(NSDictionary *)error];
//            [tempDic setValue:@"3" forKey:@"code"];
            failure((NSDictionary *)error);
        }
        else
        {
            
        }
            //failure([BCAlertText networkErrorDictionary:error]);
    }];
}



- (BOOL)checkEnable;{
    
    if ([self.downloadStatus boolValue])
    {
        return NO;
    }
    
    return YES;
}


- (NSString *)sectionTag;{
    
    if ([self.downloadStatus integerValue]==BCDownload_Finish)
    {
        _sectionTag = BCIntegerString(HDMSectionTag_Downloaded);
    }
    else if (self.isorder)
    {
        _sectionTag = BCIntegerString(HDMSectionTag_Purchased);
    }
    else if (![self.is_free boolValue])
    {
        _sectionTag = BCIntegerString(HDMSectionTag_Free);
    }
    else if ([self.downloadStatus integerValue]!=0)
    {
        _sectionTag = BCIntegerString(HDMSectionTag_Download);
    }
    else
    {
        _sectionTag = BCIntegerString(HDMSectionTag_None);
    }
    
    return _sectionTag;
}

- (NSNumber *)modelTag;{
    
    return [NSNumber numberWithInteger:[self.content_id integerValue]];
}

/*- (void)setContent_id:(NSString *)content_id;{
    
    _content_id = content_id;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(downloadNotificationOperation:)
                                                 name:[NSString stringWithFormat:@"Section::%@", content_id] object:nil];
}*/

/*- (void)setDownloadProgress:(NSString *)downloadProgress;{
    
    _downloadProgress = downloadProgress;
}


- (NSString *)downloadProgress;{
    
    if ([_downloadProgress length]<1)
    {
        long long fileSize = [self.fileSize longLongValue];
        if (fileSize==0)
        {
            //self.downloadStatus = BCIntegerString(BCDownload_FileMissed);
            _downloadProgress = @"0";
        }
        else
        {
            CGFloat progress = self.downloadBytes/(fileSize*1.00);
            _downloadProgress = [NSString stringWithFormat:@"%@", [NSNumber numberWithFloat:progress]];
        }
    }
    
    if ([self.downloadStatus integerValue]==BCDownload_Finish)
    {
        _downloadProgress = @"1";
    }
    
    return _downloadProgress;
}*/

- (BOOL)judgeSectionIsFree;{
    
    BOOL result = [self.is_free boolValue];
    
    if (result) //免费
    {
        
    }
    else //判断用户是否登录
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"HDM-User-Login-Judge" object:nil];
    }
    
    return result;
}




+ (NSDictionary *)databasePropertyMap;{
    
    return @{@"chann_id": @"chann_id",
             @"opus_id": @"opus_id",
             @"content_id": @"content_id",
             @"content_name": @"content_name",
             @"index_id": @"index_id",
             @"fileSize": @"fileSize",
             @"downloadProgress": @"downloadProgress",
             @"mark_value": @"mark_value",              //添加保存书签页码数  add by suzq  2015.3.18
             @"fileName": @"fileName",
             @"opus_name": @"opus_name",
             @"watchTime": @"watchTime",
             @"next_content_id": @"next_content_id",
             @"orderStatus":@"orderStatus",
             @"downloadStatus": @"downloadStatus",
             @"last_content_name": @"last_content_name",//nzbrowser
             @"downloadQuality": @"downloadQuality"};
}



#pragma mark - Download -


- (NSString *)quality;{
    
    if (!_quality)
    {
        _quality = @"0";
    }
    
    return _quality;
}

- (void)setQuality:(NSString *)quality;{
    
    _quality = quality;
}

- (void)authorizeQua;{
    
}



- (void)setTypeString:(NSString *)typeString;{
    
    _typeString = typeString;
}


- (NSString *)typeString;{
    
    if ([_typeString length] < 1)
    {
        switch (self.chann_id.integerValue)
        {
            case HDMManHuaChannel:
            {
                _typeString = @"话";
            }break;
                
            case HDMDongHuaChannel:
            {
                _typeString = @"集";
            }break;
                
            default:
            {
                _typeString = @"话";
            }break;
        }
    }
    
    return _typeString;
}


#pragma mark - setter/getter method -


@end
