
#import <Foundation/Foundation.h>

@class HDMProduct;
@class HDMSection;

@interface HDMDownloadProductManager : BCManager <UIAlertViewDelegate>
{
    
}

+ (instancetype)sharedInstance;



@property (nonatomic, assign) BOOL isChanged;

- (void)addDownloadProduct:(HDMProduct *)model;
- (void)deleteDownloadProduct:(HDMProduct *)model;
/*!
 *  全部开始
 */
- (void)downloadAllProduct;

/*!
 *  全部暂停
 */
- (void)pauseDownloadAllProduct;

/*!
 *  应用启动时检测是否有未完成下载的任务
 */
- (void)checkDownloadWhenLaunch;
- (BOOL)downCountRefresh;
@end
