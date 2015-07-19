//
//  Toast.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/19.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "Toast.h"

@implementation Toast

#define Hub_Delay 1.2

/**
 *  在window上显示Hub
 */
+ (MBProgressHUD *)showWithHub:(NSString *)message
{
    return [self showWithHub:message view:nil];
}

/**
 *  在window上关闭Hub
 */
+ (void)hideWithHub
{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    [MBProgressHUD hideHUDForView:view animated:YES];
}


/**
 *  在view上显示Hub
 */
+ (MBProgressHUD *)showWithHub:(NSString *)message view:(UIView *)view
{
    
    if (view == nil)
    {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    return hud;
}

/**
 *  在view上关闭Hub
*/
+ (void)hideWithHub:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}


/**
 *  在view上显示Hub
 */
+ (MBProgressHUD *)showWithController:(NSString *)message controller:(UIViewController *)controller
{
    return [self showWithHub:message view:controller.view];
}

/**
 *  在view上关闭Hub
 */
+ (void)hideWithController:(UIViewController *)controller
{
    [MBProgressHUD hideHUDForView:controller.view animated:YES];
}


//=============================自动关闭hub

/**
 *  在window上显示完自动关闭hub
 */

+ (void)show:(NSString *)message
{
    return [self show:message icon:@"" view:nil];
}

/**
 *  在view上显示完自动关闭hub
 */
+ (void)show:(NSString *)message icon:(NSString *)icon view:(UIView *)view delay:(NSTimeInterval)delay
{
    if (view == nil)
    {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 0.9秒之后再消失
    [hud hide:YES afterDelay:delay];
}


/**
 *  在view上显示完自动关闭hub
 */
+ (void)show:(NSString *)message icon:(NSString *)icon view:(UIView *)view
{
    return [self show:message icon:icon view:view delay:Hub_Delay];
}


/**
 *  在view上显示成功提示
 */
+ (void)showSuccess:(NSString *)success view:(UIView *)view
{
    
    [self show:success icon:@"hub_success.png" view:view];
}

+ (void)showSuccess:(NSString *)success view:(UIView *)view delay:(NSTimeInterval)delay
{
    [self show:success icon:@"hub_success.png" view:view delay:delay];
}

/**
 *  在view上显示错误提示
 */
+ (void)showError:(NSString *)error view:(UIView *)view delay:(NSTimeInterval)delay
{
    [self show:error icon:@"hub_error.png" view:view delay:delay];
}
+ (void)showError:(NSString *)error view:(UIView *)view
{
    
    [self show:error icon:@"hub_error.png" view:view];
}

/**
 *  在window上显示成功提示
 */
+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success view:nil];
}

+ (void)showSuccess:(NSString *)success delay:(NSTimeInterval)delay
{
    [self showSuccess:success view:nil delay:delay];
}

/**
 *  在window上显示错误提示
 */

+ (void)showError:(NSString *)error
{
    [self showError:error view:nil];
}

+ (void)showError:(NSString *)error delay:(NSTimeInterval)delay
{
    [self showError:error view:nil delay:delay];
}




@end
