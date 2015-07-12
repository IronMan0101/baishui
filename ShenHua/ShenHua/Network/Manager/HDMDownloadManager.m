
#import "HDMDownloadManager.h"

#import "HDMUser.h"
#import "HDMClient.h"
#import "HDMGlobal.h"
#import "HDMProduct.h"
#import "HDMSection.h"
//#import "HDMLAPFunction.h"
#import "PCCommonDefines.h"
//#import "HDMDatabaseOperation.h"
#import "HDMDownloadProductManager.h"


@implementation HDMDownloadManager


#pragma mark - Method -

/*!
 *  单例
 *
 *  @return 下载管理器
 */
+ (instancetype)sharedInstance;{
    
    static HDMDownloadManager * instance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{instance = [[self alloc] init];});
    
    return instance;
}


- (instancetype)init;{
    
    if (self = [super init])
    {
//        self.KVOController = [BCKVOController controllerWithObserver:self];
//        [self.KVOController observe:HDM_Global keyPath:@"userStatus" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
//            
//            if (self.section.downloadStatus.integerValue==BCDownload_Wait)
//            {
//                NSLog(@"%d",HDM_Global.userStatus);
//                switch (HDM_Global.userStatus)
//                {
//                    case BCUserOnline:
//                    case BCUserDown:
//                    {
//                        [self download];
//                    }
//                        break;
//                    case BCUserPlay:
//                    case BCUserStartPlay:
//                    case BCUserStartDown:
//                    case BCUserEndPlay:
//                        break;
//                    default:
//                    {
//                        [self.product changeSectionDownloadStatus:BCDownload_Fail];
//                        [self.section changeDownloadStatus:BCDownload_Fail];
//                        [self downloadNext];
//                    }break;
//                }
//            }
//            else
//            {
//                [self downloadNext];
//            }
//        }];
//        
//        [self.KVOController observe:HDM_Global keyPath:@"purchaseStatus" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
//            
//            if (self.section.downloadStatus.integerValue==BCDownload_Wait)
//            {
//                switch (HDM_Global.purchaseStatus)
//                {
//                    case BCPurchaseed_Down:
//                    {
//                        [self download];
//                    }break;
//                    case BCPurchaseed_Play:
//                    case BCPurchaseed_StartPlay:
//                    case BCPurchaseed_StartDown:
//                    case BCPurchaseed_EndPlay:
//                        break;
//                        
//                    default:
//                    {
//                        [self.product changeSectionDownloadStatus:BCDownload_Fail];
//                        [self.section changeDownloadStatus:BCDownload_Fail];
//                        [self downloadNext];
//                    }break;
//                }
//            }
//            else
//            {
//                [self downloadNext];
//            }
//        }];
    }
    
    return self;
}


#pragma mark - 作品详情界面 -

- (void)downloadProduct:(HDMProduct *)product SectionList:(NSArray *)sectionList;{
    
    if (![product.inDownload boolValue])
    {
        product.inDownload = @"1";
        product.timeDownload = [NSString stringWithFormat:@"%@",
                                [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]]];
        
   //     [product updateModelForKeys:@[@"inDownload", @"timeDownload",@"last_content_name"]];//nzbrowser
    }
    
    for (HDMSection * section in sectionList)
    {
        [section changeDownloadStatus:BCDownload_Wait];
        [product changeSectionDownloadStatus:BCDownload_Wait];
    }
    
    if (!self.section)
    {
        self.section = [sectionList firstObject];
        self.product = product;
        [self download];
    }
}


#pragma mark - 本地下载界面 -

/*!
 *  本地下载界面--作品下载
 *
 *  @param product <#product description#>
 */
- (void)downloadProduct:(HDMProduct *)product;{
    
//    NSArray * sectionList = [[HDMDatabaseOperation sharedInstance]
//                             obtainUnFinishDownloadSectionListOfProduct:product];
//    
//    [self downloadProduct:product SectionList:sectionList];
}


- (void)cancelDownloadProduct:(HDMProduct *)product;{
//    if(self.section)
//    {
//        [self cancelDownloadProduct:product Section:self.section];
//    }
//    NSArray * sectionList = [[HDMDatabaseOperation sharedInstance] obtainWaitDownloadSectionListOfProduct:product];
//    if ([self.section.opus_id isEqualToString:product.opus_id])
//    {
//        for (HDMSection * section in sectionList)
//        {
//            [section changeDownloadStatus:BCDownload_Pause];
//            if ([self.section.content_id isEqualToString:section.content_id])
//            {
//                [[[BCHTTPRequestOperationDownloadManager sharedInstance] downloadOperation] cancel];
//            }
//        }
//    }
//    else
//    {
//        for (HDMSection * section in sectionList)
//        {
//            [section changeDownloadStatus:BCDownload_Pause];
//        }
//    }
//    
//    [product changeSectionDownloadStatus:BCDownload_Pause];
}


- (void)deleteDownloadProductList:(NSArray *)productList;{
    
//    BOOL productInList = NO;
//    
//    for (HDMProduct * product in productList)
//    {
//        if ([self.section.opus_id isEqualToString:product.opus_id])
//        {
//            productInList = YES;
//        }
//        NSArray * sectionList = [[HDMDatabaseOperation sharedInstance] obtainDownloadSectionListOfProduct:product];
//        for (HDMSection * section in sectionList)
//        {
//            [section changeDownloadStatus:BCDownload_None];
//        }
//        
//        product.inDownload = @"0";
//        product.timeDownload = @"0";
//        [product updateModelForKeys:@[@"inDownload", @"timeDownload"]];
//    }
//    
//    if (productInList)
//    {
//        [[[BCHTTPRequestOperationDownloadManager sharedInstance] downloadOperation] pause];
//    }
}


#pragma mark - 下载章节管理 -

/*!
 *  开始下载
 *
 *  @param section <#section description#>
 */
- (void)downloadProduct:(HDMProduct *)product Section:(HDMSection *)section;{
    
    [product changeSectionDownloadStatus:BCDownload_Wait];
    [section changeDownloadStatus:BCDownload_Wait];
    
    if (!self.section)
    {
        self.product = product;
        self.section = section;
        [self download];
    }
}


/*!
 *  取消下载
 *
 *  @param section <#section description#>
 */
- (void)cancelDownloadProduct:(HDMProduct *)product Section:(HDMSection *)section;{
    
    [product changeSectionDownloadStatus:BCDownload_Pause];
    [section changeDownloadStatus:BCDownload_Pause];
    
    if (self.section)
    {
        if ([self.section.content_id isEqualToString:section.content_id])
        {
          //  [[[BCHTTPRequestOperationDownloadManager sharedInstance] downloadOperation] cancel];
        }
    }
}


/*!
 *  删除下载
 *
 *  @param product <#product description#>
 *  @param section <#section description#>
 */

- (void)deleteDownloadProduct:(HDMProduct *)product sectionList:(NSArray *)sectionList{
    
    //silence 20150415
//    BOOL sectionInList = NO;
    
    if ([self.section.opus_id isEqualToString:product.opus_id])
    {
        for (HDMSection * section in sectionList)
        {
//            if ([self.section.content_id isEqualToString:section.content_id])
//            {
//                sectionInList = YES;
//            }
            
            [section changeDownloadStatus:BCDownload_None];
        }
    }
    else
    {
        for (HDMSection * section in sectionList)
        {
            [section changeDownloadStatus:BCDownload_None];
        }
    }
    
    if (sectionList)
    {
     //   [[[BCHTTPRequestOperationDownloadManager sharedInstance] downloadOperation] cancel];
    }
    
    [product changeSectionDownloadStatus:BCDownload_None];
}


#pragma mark - Download Method -

- (void)download;{
    
//    HDM_Global.isShowDPB = YES;
//    
//    self.section.quality = BCIntegerString([HDM_Client DownloadQuality]);
//    self.section.downloadQuality = self.section.quality;
//    
//    self.section.watchType = [self.section watchTypeInDownload:YES];
//    HDM_Global.loginStatus = BCUserStartDown;
////    [HDMLAPFunction sharedInstance].loginFromStatusType = BCLoginFromStatusType_Down;
////    [[HDMLAPFunction sharedInstance] authorizeSection:self.section Success:^(NSDictionary *codeMsg) {
////        
//        NSLog(@"开始下载");
//        if (self.section.downloadStatus.integerValue==BCDownload_Wait)
//        {
//            self.section.downloadProgress = 0;
//            [self.section changeDownloadStatus:BCDownload_Ing];
//            [self.product changeSectionDownloadStatus:BCDownload_Ing];
//        }
//        else
//        {
//            [self downloadNext];
//        }
//        
//        __block HDMDownloadManager * blockSelf = self;
//        
//        self.section.fileName = self.section.content_id;
//        _operation = [[BCHTTPRequestOperationDownloadManager sharedInstance] DOWNLOAD:self.section.url fileName:self.section.content_id success:^(BCHTTPRequestOperation *task) {
//            
//            if (blockSelf.section)
//            {
//                blockSelf.section.fileName = [NSString stringWithFormat:@"%@%@", self.section.content_id, task.response.suggestedFilename];
//                [blockSelf.section updateModelForKeys:@[@"fileName", @"downloadQuality"]];
//                [blockSelf.section changeDownloadStatus:BCDownload_Finish];
//                [blockSelf.product changeSectionDownloadStatus:BCDownload_Finish];
//                [blockSelf downloadNext];
//                //20150128
////                [BCProgressHUD showImage:nil status:@"下载完成"];
//                [MBProgressHUD showHudMsgWithKeyWindow:@"下载完成"];
//            }
//        } failure:^(BCHTTPRequestOperation *task, NSError *error) {
//            
//            NSLog(@"开始失败或暂停取消");
//            
//            if (blockSelf.section.downloadStatus.integerValue==BCDownload_Ing)
//            {
//                [blockSelf.section changeDownloadStatus:BCDownload_Fail];
//                [blockSelf.product changeSectionDownloadStatus:BCDownload_Fail];
//            }
//            
//            [blockSelf downloadNext];
//        }];
//        
//        
//        
//        
//        NSString *path = [BCConfigure kFileDownloadPath];
//        NSString *fullPath = [path stringByAppendingPathComponent:self.section.content_id];
//        
//        // 检查文件是否已经下载了一部分
//        unsigned long long downloadedBytes = 0;
//        if ([[NSFileManager defaultManager] fileExistsAtPath:fullPath])
//        {
//            // 获取已下载的文件长度
//            downloadedBytes = [NSFileManager bc_fileSizeForPath:fullPath];
//        }
//        
//        // 下载进度
//        [_operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
//            
//            if (blockSelf.section)
//            {
//                if ([blockSelf.section.fileSize length] < 1)
//                {
//                    blockSelf.section.fileSize = [NSString stringWithFormat:@"%@",
//                                                  [NSNumber numberWithLongLong:(totalBytesExpectedToRead+downloadedBytes)]];
//                }
//                
//                float progress = ((float)totalBytesRead+downloadedBytes) / (totalBytesExpectedToRead+downloadedBytes);
//                float sectionProgress = [blockSelf.section.downloadProgress floatValue];
//                if (progress>=(sectionProgress+0.1) || sectionProgress==0 || progress==1.0f)
//                {
//                    NSLog(@"正在下载");
//                    
//                    blockSelf.progress = [NSString stringWithFormat:@"%@",
//                                          [NSNumber numberWithFloat:progress]];;
//                    blockSelf.product.downloadProgress = blockSelf.progress;
//                    blockSelf.section.downloadProgress = blockSelf.progress;
//                    NSLog(@"%@", blockSelf.progress);
//                    
//                    NSLog(@"http download fileSize::%lld", downloadedBytes);
//                    NSLog(@"http download progress::%@", blockSelf.progress);
//                    
//                    [blockSelf.section updateModelForKeys:@[@"fileSize", @"downloadProgress"]];
//                    [blockSelf.product updateModelAttributeForKeys:@[@"downloadProgress"]];
//                }
//            }
//        }];
//        
//    } Failure:^(NSDictionary *codeMsg) {
//        
//        [self.product changeSectionDownloadStatus:BCDownload_Fail];
//        [self.section changeDownloadStatus:BCDownload_Fail];
//        
//        // 鉴权失败，播放下一话
//        [self downloadNext];
//    }];
}


- (void)downloadNext;{
    
    self.section = nil;
//    
//    HDMSection * sectionModel = [[HDMDatabaseOperation sharedInstance] firstDownloadSectionOfProduct:self.product];
//    if (sectionModel)
//    {
//        self.section = sectionModel;
//        [self download];
//        return;
//    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:N_HDM_DownloadNextProduct object:self];
}


@end