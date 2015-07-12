
#import "HDMDownloadProductManager.h"
#import "HDMProduct.h"
#import "HDMSection.h"
#import "HDMClient.h"
#import "HDMGlobal.h"
#import "HDMDownloadManager.h"
#import "PCCommonDefines.h"
//#import "HDMDatabaseOperation.h"
#import "HDMDownloadProductSectionManager.h"

@implementation HDMDownloadProductManager


+ (instancetype)sharedInstance;{
    
    static HDMDownloadProductManager * instance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        
        instance = [[self alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:instance selector:@selector(np_downloadNextProduct:)
                                                     name:N_HDM_DownloadNextProduct object:nil];
        [instance refreshSuccess:^(NSDictionary *codeMsg) {} Failure:^(NSDictionary *codeMsg) {}];
    });
    
    return instance;
}


- (void)np_downloadNextProduct:(NSNotification *)notification;{
    
    NSLog(@"下载下一部作品");
    
//    for (int i=0; i<[self.contextList count]; i++)
//    {
//        HDMProduct * product = [self.contextList objectAtIndex:i];
////      //  HDMSection * section = [[HDMDatabaseOperation sharedInstance] firstDownloadSectionOfProduct:product];
////        if (section)
////        {
////            [[HDMDownloadManager sharedInstance] downloadProduct:product Section:section];
////            return;
////        }
//    }
//    
//    for (HDMProduct * product in self.contextList)
//    {
////        NSInteger unDownloadSectionNumber = [[HDMDatabaseOperation sharedInstance] unDownloadSectionNumberOfProduct:product];
////        if (unDownloadSectionNumber>0)
////        {
////            return;
////        }
//    }
    
    HDM_Global.isShowDPB = NO;
}


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;{
    
//    [[HDMProduct classDatabaseQueue] inDatabase:^(BCDatabase * db) {
//        
//        BCResultSet * rs = [db executeQuery:@"SELECT * FROM HDMProduct WHERE inDownload = 1 ORDER BY timeDownload*1 DESC"];
//        while ([rs next])
//        {
//            HDMProduct * product = [[HDMProduct alloc] initWithAttributes:[rs resultDictionary]];
//            NSLog(@"Download Product:%@", product);
//            [self.contextList addObject:product];
//        }
//        
//        success(@{@"code": @"0", @"msg": @"获取数据成功"});
//    }];
}


- (void)addDownloadProduct:(HDMProduct *)model;{
    
//    model.inDownload = @"1"; model.timeDownload = [NSDate bc_timeIntervalSince1970IntPartString];
//    [model updateModelForKeys:@[@"inDownload", @"timeDownload"]];
//    
//    self.isChanged = YES;
}


- (void)deleteDownloadProduct:(HDMProduct *)model;{
    
//    model.inDownload = @"0"; model.timeDownload = @"0";
//    [model updateModelForKeys:@[@"inDownload",
//                                @"timeDownload"]];
//    
    self.isChanged = YES;
}


- (void)downloadAllProduct;{
    
    for (HDMProduct * in_product in self.contextList)
    {
        [[HDMDownloadManager sharedInstance] downloadProduct:in_product];
    }
}


- (void)pauseDownloadAllProduct;{
    
    for (HDMProduct * in_product in self.contextList)
    {
        [[HDMDownloadManager sharedInstance] cancelDownloadProduct:in_product];
    }
}
/**
 *下载集数刷新  yes代表还有未完成下载 no 代表全部下载完成
 */
- (BOOL)downCountRefresh
{
    BOOL haveDown = NO;
    if ([self.contextList count] > 0)
    {
        for (HDMProduct * product in self.contextList)
        {
//            NSInteger unDownloadSectionNumber = [[HDMDatabaseOperation sharedInstance] unDownloadSectionNumberOfProduct:product];
//            if (unDownloadSectionNumber>0)
//            {
//                haveDown = YES;
//                break;
//            }
//            else
//            {
//                haveDown = NO;
//            }
        }
    }
    return haveDown;
}
- (void)checkDownloadWhenLaunch;{
    
    static BOOL checkResult = NO;
    if (checkResult)
    {
        return;
    }
    checkResult = YES;
//    
//    if ([[HDM_Client isPromptWhenDownload] boolValue])
//    {
//        [self refreshSuccess:^(NSDictionary *codeMsg) {
//            
//            if ([self.contextList count] > 0)
//            {
//                for (HDMProduct * product in self.contextList)
//                {
////                    NSInteger unDownloadSectionNumber = [[HDMDatabaseOperation sharedInstance] unDownloadSectionNumberOfProduct:product];
////                    if (unDownloadSectionNumber>0)
////                    {
////                        UIAlertView * av = nil;
////                        if ([[BCEngine sharedInstance] networkType]==BCReachableViaWWAN)
////                        {
////                            av = [[UIAlertView alloc] initWithTitle:@"确认"
////                                                            message:@"您正在使用数据流量,确定继续下载上次未完成的下载任务?"
////                                                           delegate:self cancelButtonTitle:@"取消"
////                                                  otherButtonTitles:@"确定", nil];
////                        }
////                        else
////                        {
////                            av = [[UIAlertView alloc] initWithTitle:@"确认"
////                                                            message:@"您有未完成的下载任务,是否继续?"
////                                                           delegate:self cancelButtonTitle:@"取消"
////                                                  otherButtonTitles:@"确定", nil];
////                        }
////                        
////                        [av show];
////                        break;
//                    }
//                }
//            }
//        } Failure:^(NSDictionary *codeMsg) {
//            ;
//        }];
//    }
//    else
//    {
//        [self alertView:nil clickedButtonAtIndex:0];
//    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;{
    
    switch (buttonIndex)
    {
        case 0:
        {
            [self pauseDownloadAllProduct];
        }break;
            
        case 1:
        {
            [self downloadAllProduct];
        }break;
            
        default:
            break;
    }
}



@end
