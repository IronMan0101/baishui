//
//  AppDelegate.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/3.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"
#import "OneVC.h"
#import "TwoVC.h"
#import "ThreeVC.h"
#import "FourVC.h"
#import "FiveVC.h"
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"
#import "BCCategory.h"
#import "Macros.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    // self.window.rootViewController = [self creatTestController];
    self.window.rootViewController = [self creatMainController:4];
    
    

    [self.window makeKeyAndVisible];
    return YES;
}

/**
 *  测试控制器
 *
 *  @return <#return value description#>
 */
- (UIViewController *)creatTestController
{
    TestViewController * testVC=[[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
    return  testVC;
}

/**
 *  获取主控制器
 *
 *  @return <#return value description#>
 */

- (UIViewController *)creatMainController:(NSInteger)tabClickIndex
{
    OneVC   * oneVc= [[OneVC alloc]initWithNibName:@"OneVC" bundle:nil];
    TwoVC   * twoVc= [[TwoVC alloc]initWithNibName:@"TwoVC" bundle:nil];
    ThreeVC * threeVc= [[ThreeVC alloc]initWithNibName:@"ThreeVC" bundle:nil];
    FourVC  * fourVc= [[FourVC alloc]initWithNibName:@"FourVC" bundle:nil];
    FiveVC  * fiveVc= [[FiveVC alloc]initWithNibName:@"FiveVC" bundle:nil];
    
    NSArray *  viewControllers=[NSArray arrayWithObjects:oneVc, twoVc,threeVc,fourVc,fiveVc,nil];
    

    NSArray *  tabItemTitle=[NSArray arrayWithObjects:@"团购", @"上门",@"商家",@"我的",@"更多",nil];   //标题
    NSArray *  tabItemNormalBg=   [NSArray arrayWithObjects:@"tabbar_homepage_n", @"tabbar_merchant_n",@"tabbar_onsite_n",
                                                            @"tabbar_mine_n",@"tabbar_more_n",nil];//普通背景
    NSArray *  tabItemHighlightBg=[NSArray arrayWithObjects:@"tabbar_homepage_h", @"tabbar_merchant_h",@"tabbar_onsite_h",
                                                            @"tabbar_mine_h",@"tabbar_more_h",nil];//高亮背景
    UIColor * tabItemFontColor=RGB(54, 185,175);                                                   //字体颜色
    NSString *tabBg=@"tabbar_bg";                                                                  //tabar背景
    //NSInteger tabClickIndex=4;                                                                     //默认选中
    

    
    NSMutableArray *mutableNavController=[[NSMutableArray alloc]initWithCapacity:5];
    
    //设置各个uinavgationcontroller
    for (NSInteger i=0; i< [viewControllers count]; i++)
    {
        //初始化tabbaritem标题、背景图
        NSString * title = [tabItemTitle objectAtIndex:i];
        NSString *normalImageName=[tabItemNormalBg objectAtIndex:i];
        NSString *highLightImageName=[tabItemHighlightBg objectAtIndex:i];
        
        //UIImageRenderingModeAlwaysOriginal  不使用系统默认渲染颜色.否则看不到图片一些具体细节 图片有白色$
        UIImage *normalImage=[[UIImage imageNamed:normalImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *highLightImage=[[UIImage imageNamed:highLightImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UITabBarItem *tabbarItem =[[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:highLightImage];
        
        BaseNavigationController *navController=[[BaseNavigationController alloc]initWithRootViewController:[viewControllers objectAtIndex:i]];
        [navController setTabBarItem:tabbarItem];
        [mutableNavController addObject:navController];
       
    }
   
    [[UITabBar appearance] setTintColor:tabItemFontColor];//设置字体颜色

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6)
    {
        [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    }
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:tabBg]];
    

    BaseTabBarController  *mainVC=[[BaseTabBarController alloc] init];
    [mainVC setViewControllers:[mutableNavController copy]];
    [mainVC setSelectedIndex:tabClickIndex];
    
    return  mainVC;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
