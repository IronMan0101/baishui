
#import <Foundation/Foundation.h>

@class HDMProduct;//作品
@class HDMSection;//话集

@interface HDMDownloadManager : NSObject <UIAlertViewDelegate>
{
    AFHTTPRequestOperation * _operation;//下载队列
}

@property (nonatomic, copy) NSString * progress;

@property (nonatomic, strong) HDMProduct * product;
@property (nonatomic, strong) HDMSection * section;

#pragma mark - Method -

/*!
 *  单例
 *
 *  @return 下载管理器
 */
+ (instancetype)sharedInstance;


#pragma mark - 作品详情界面 -

- (void)downloadProduct:(HDMProduct *)product SectionList:(NSArray *)sectionList;


#pragma mark - 本地下载界面 -

/*!
 *  本地下载界面--作品下载(全部开始)
 *
 *  @param product <#product description#>
 */
- (void)downloadProduct:(HDMProduct *)product;

/*!
 *  本地下载界面--作品暂停(全部暂停)
 *
 *  @param product <#product description#>
 */
- (void)cancelDownloadProduct:(HDMProduct *)product;

- (void)deleteDownloadProductList:(NSArray *)productList;

#pragma mark - 下载章节管理 -

/*!
 *  开始下载或者新增下载--章节管理点击下载和作品详情选集添加下载
 *
 *  @param section <#section description#>
 */
- (void)downloadProduct:(HDMProduct *)product Section:(HDMSection *)section;

/*!
 *  取消下载--章节管理点击暂停
 *
 *  @param section <#section description#>
 */
- (void)cancelDownloadProduct:(HDMProduct *)product Section:(HDMSection *)section;

- (void)deleteDownloadProduct:(HDMProduct *)product sectionList:(NSArray *)sectionList;

@end
