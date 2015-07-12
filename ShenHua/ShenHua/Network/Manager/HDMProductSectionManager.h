
#import <Foundation/Foundation.h>

@class HDMProduct;

/*!
 * 和动漫--作品--话/集管理器
 */
@interface HDMProductSectionManager : BCManager
{
    
}

@property (nonatomic, strong) HDMProduct * product;

-(void)clear;

@end
