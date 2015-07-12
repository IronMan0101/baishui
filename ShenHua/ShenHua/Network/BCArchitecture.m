
#import "BCArchitecture.h"
//#import "BCTabBarController.h"
//#import "BCNavigationController.h"


@implementation BCArchitecture

static BCArchitecture * instance = nil;
+ (instancetype)sharedInstance {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{instance = [[self alloc] init];});
    
    return instance;
}
+ (instancetype)sharedInstanceNew {
    [[NSNotificationCenter defaultCenter] removeObserver:instance];
    instance = [[self alloc] init];
    return instance;
}


- (instancetype)init {
    
    self = [super init];
    if (self)
    {
        [self configureWindowNavigationController];
    }
    
    return self;
}
- (void)configureWindowNavigationController {
    
    UIViewController * rootViewController = [self rootViewController];
    
//    assert(rootViewController);
//    self.windowNavigationController = [[BCNavigationController alloc] initWithRootViewController:rootViewController];
//    [self.windowNavigationController setNavigationBarHidden:YES];
}


- (UIViewController *)rootViewController {
    
    [self configureTabBarController];
    
    return nil;
}


- (void)configureTabBarController {
    
    //[self configureTabBarControllerWithTitles:@[@"推荐", @"频道", @"我的", @"本地"] viewControllers:<#(NSArray *)#> clickedIndex:0];
}


- (void)configureTabBarControllerWithTitles:(NSArray *)titles viewControllers:(NSArray *)viewControllers clickedIndex:(NSInteger)clickedIndex {
    
//    _realViewControllers = [NSMutableArray arrayWithCapacity:[titles count]];
//    for (int i = 0; i < [titles count]; i++)
//    {
//        NSString * title = [titles objectAtIndex:i];
//        
//        NSString * normalimageName = [NSString stringWithFormat:@"TBI0%d_N", i];
//        NSString * selectedImageName = [NSString stringWithFormat:@"TBI0%d_H", i];
//        
//        UIImage * normalImage = [UIImage imageNamed:normalimageName];
//        UIImage * selectedImage = [UIImage imageNamed:selectedImageName];
//        
//        UIViewController * rootViewController = [viewControllers objectAtIndex:i];
//        assert(rootViewController);
//        
//        /*!
//         *  <#Description#>
//         */
//        BCNavigationController * navigationController = [[BCNavigationController alloc] init];
//        navigationController.type = BCNavigationControllerInTabBarController;
//        [navigationController setNavigationBarHidden:YES];
//        [navigationController pushViewController:rootViewController animated:YES];
//        
//        [navigationController setTabBarItem:[[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectedImage]];
//        [_realViewControllers addObject:navigationController];
//    }
//    
//    // Change the tabbar's background and selection image through the appearance proxy
//    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"TB_SI"]];
//    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"TB_BG"]];
//    [[UITabBar appearance] setTintColor:[UIColor orangeColor]];//设置选择颜色
//    
//    _tabBarController = [[BCTabBarController alloc] init];
//    [_tabBarController setViewControllers:_realViewControllers];
//    _tabBarController.delegate = self;
//    
//    self.tabBarController = _tabBarController;
//    
//    /*!
//     *  <#Description#>
//     */
//    [_tabBarController setSelectedIndex:clickedIndex];
//    self.tabBarNavigationController = [_realViewControllers objectAtIndex:clickedIndex];
//    [self tabBarController:_tabBarController didSelectViewController:[_realViewControllers objectAtIndex:clickedIndex]];
}
- (void)selectedIndex:(NSInteger)selectIndex
{
//    if([_realViewControllers count] > 0)
//        self.tabBarNavigationController = [_realViewControllers objectAtIndex:selectIndex];
//    if(_tabBarController != nil)
//        [_tabBarController setSelectedIndex:selectIndex];
}
#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    [self tabBarControllerDidSelectViewController:viewController];
}


- (void)tabBarControllerDidSelectViewController:(UIViewController *)viewController;{
//    
//    if ([self.tabBarNavigationController isEqual:viewController])
//    {
//        _reClickedTabBarItem = YES;
//    }
//    else
//    {
//        _reClickedTabBarItem = NO;
//    }
//    
//    self.tabBarNavigationController = (UINavigationController *)viewController;
}


@end
