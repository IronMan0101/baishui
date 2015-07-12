
#import "HDMLocalDownloadManager.h"
//#import "HDMLAPFunction.h"
#import "HDMSection.h"
#import "HDMClient.h"

@interface HDMLocalDownloadManager ()
{
    AFHTTPRequestOperation * _operation;
}

@end


@implementation HDMLocalDownloadManager


+ (instancetype)sharedInstance;{
    
    static dispatch_once_t predicate;
    
    static id instance;
    dispatch_once(&predicate, ^{instance = [[self alloc] init];});
    
    return instance;
}


- (void)addDownloadSection:(HDMSection *)section;{
    
    if (!self.downloadSection)//开始下载
    {
        self.downloadSection = section;
        [self download];
    }
}


- (void)removeDownloadSection:(HDMSection *)section;{
    
    if (self.downloadSection && [self.downloadSection.content_id isEqualToString:section.content_id])//取消下载
    {
        [self cancel];//记得要把downloadSection情况
    }
}


- (void)stop;{
    
}


- (void)pause;{
    
}


- (void)cancel;{
    
}


- (void)delete;{
    
}


- (void)download;{
    
    self.downloadSection.watchType = [self.downloadSection watchTypeInDownload:YES];
    self.downloadSection.downloadQuality = BCIntegerString(HDM_Client.DownloadQuality);
//    HDM_Global.loginStatus = BCUserStartDown;
//    [HDMLAPFunction sharedInstance].loginFromStatusType = BCLoginFromStatusType_Down;
//    [[HDMLAPFunction sharedInstance] authorizeSection:self.downloadSection Success:^(NSDictionary *codeMsg) {
//        
//        [self.downloadSection changeDownloadStatus:BCDownload_Ing];
//        
//        long long downloadedBytes = self.downloadSection.downloadBytes;
//        __block HDMLocalDownloadManager * blockSelf = self;
//        
//        self.downloadSection.fileName = self.downloadSection.content_id;
//        [[BCHTTPRequestOperationDownloadManager sharedInstance] DOWNLOAD:self.downloadSection.url fileName:self.downloadSection.content_id success:^(BCHTTPRequestOperation *task) {
//            
//            if (blockSelf.downloadSection)
//            {
//                blockSelf.downloadSection.fileName = [NSString stringWithFormat:@"%@%@", self.downloadSection.content_id, task.response.suggestedFilename];
//                [blockSelf.downloadSection changeDownloadStatus:BCDownload_Finish];
//                [blockSelf downloadNext];
//                //20150128
////                [BCProgressHUD showImage:nil status:@"下载完成"];
//                [MBProgressHUD showHudMsgWithKeyWindow:@"下载完成"];
//            }
//        } failure:^(BCHTTPRequestOperation *task, NSError *error) {
//            
//            if (blockSelf.downloadSection)
//            {
//                if ([blockSelf.downloadSection.downloadStatus integerValue]==BCDownload_Wait)
//                {
//                    [blockSelf.downloadSection changeDownloadStatus:BCDownload_Fail];
//                }
//                
//                [blockSelf downloadNext];
//            }
//        }];
//        
//        // 下载进度
//        [_operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
//            
//            if (blockSelf.downloadSection)
//            {
//                if ([blockSelf.downloadSection.fileSize length]<1)
//                {
//                    /*[blockSelf.downloadSection downloadFileSize:[NSString stringWithFormat:@"%@",
//                                                                 [NSNumber numberWithLongLong:(totalBytesExpectedToRead+downloadedBytes)]]];
//                    [blockSelf.downloadSection updateModel];*/
//                }
//                
//                float progress = ((float)totalBytesRead+downloadedBytes) / (totalBytesExpectedToRead+downloadedBytes);
//                float sectionProgress = [blockSelf.downloadSection.downloadProgress floatValue];
//                if (progress>=(sectionProgress+0.2) || sectionProgress==0 || progress==1.0f)
//                {
//                    //hdm_gv_downloadProgress = [NSString stringWithFormat:@"%@", [NSNumber numberWithFloat:progress]];
//                    //blockSelf.downloadSection.downloadProgress = hdm_gv_downloadProgress;
//                }
//            }
//        }];
//        
//    } Failure:^(NSDictionary *codeMsg) {
//        
//        [self.downloadSection changeDownloadStatus:BCDownload_Fail];
//        [self downloadNext];//鉴权失败，播放下一话
//    }];
}


- (void)downloadNext;{
    
    if (YES)
    {
        
    }
    else
    {
        
    }
}



- (void)addDownloadSection:(HDMSection *)section ofProduct:(HDMProduct *)product;{
    
}


@end
