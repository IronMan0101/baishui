
#import <Foundation/Foundation.h>
//#import "BCTabBarController.h"

@class BCNavigationController;

/*!
 *  <#Description#>
 */
@interface BCArchitecture : NSObject <UITabBarControllerDelegate>
{
    BOOL _reClickedTabBarItem;
    NSMutableArray *_realViewControllers;
 //   BCTabBarController * _tabBarController;
}

+ (instancetype)sharedInstance;
+ (instancetype)sharedInstanceNew;

/*!
 *  选项卡控制器
 */
//@property (nonatomic, strong) BCTabBarController * tabBarController;

/*!
 *  选项卡导航控制器
 */
@property (nonatomic, strong) BCNavigationController  *tabBarNavigationController;


/*!
 *  应用窗口导航控制器
 */
@property (nonatomic, strong) BCNavigationController *windowNavigationController;

/*!
 *  <#Description#>
 */
- (void)configureTabBarController;

- (void)tabBarControllerDidSelectViewController:(UIViewController *)viewController;

/*!
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
- (UIViewController *)rootViewController;

/*!
 *  <#Description#>
 *
 *  @param titles          <#titles description#>
 *  @param viewControllers <#viewControllers description#>
 *  @param clickedIndex    <#clickedIndex description#>
 */
- (void)configureTabBarControllerWithTitles:(NSArray *)titles viewControllers:(NSArray *)viewControllers clickedIndex:(NSInteger)clickedIndex;


/**
 *	@brief	设置tabbar选中的index
 *
 *	@param 	selectIndex 选中的index
 *
 *	@return
 *
	@author	silence
 */
- (void)selectedIndex:(NSInteger)selectIndex
;
@end
