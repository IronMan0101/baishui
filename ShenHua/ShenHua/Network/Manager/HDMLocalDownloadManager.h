
#import <Foundation/Foundation.h>

@class HDMSection;
@class HDMProduct;

/*!
 *  <#Description#>
 */
@interface HDMLocalDownloadManager : BCManager
{
    
}

+ (instancetype)sharedInstance;

@property (nonatomic, strong) HDMSection * downloadSection;
@property (nonatomic, strong) HDMProduct * downloadProduct;

- (void)addDownloadSection:(HDMSection *)section;
- (void)removeDownloadSection:(HDMSection *)section;

/*!
 *  作品详情--添加下载
 *
 *  @param section <#section description#>
 *  @param product <#product description#>
 */
- (void)addDownloadSection:(HDMSection *)section ofProduct:(HDMProduct *)product;

@end
