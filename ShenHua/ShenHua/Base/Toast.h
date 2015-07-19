//
//  Toast.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/19.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface Toast : NSObject


//=============================这些是需要手动关闭hub


/**
 *  在window上显示Hub
 */
+ (MBProgressHUD *)showWithHub:(NSString *)message;
/**
 *  在window上关闭Hub
 */
+ (void)hideWithHub;


/**
 *  在view上显示Hub
 */
+ (MBProgressHUD *)showWithHub:(NSString *)message view:(UIView *)view;
/**
 *  在view上关闭Hub
 */
+ (void)hideWithHub:(UIView *)view;



/**
 *  在controller上显示Hub
 */
+ (MBProgressHUD *)showWithController:(NSString *)message controller:(UIViewController *)controller;

/**
 *  在controller上关闭Hub
 */
+ (void)hideWithController:(UIViewController *)controller;



//=============================自动关闭hub

/**
 *  在window上显示完自动关闭hub
 */

+ (void)show:(NSString *)message;

/**
 *  在view上显示完自动关闭hub
 */
+ (void)show:(NSString *)message icon:(NSString *)icon view:(UIView *)view;
+ (void)show:(NSString *)message icon:(NSString *)icon view:(UIView *)view delay:(NSTimeInterval)delay;

/**
 *  在view上显示成功提示
 */

+ (void)showSuccess:(NSString *)success view:(UIView *)view;
+ (void)showSuccess:(NSString *)success view:(UIView *)view delay:(NSTimeInterval)delay;
/**
 *  在view上显示错误提示
 */

+ (void)showError:(NSString *)error view:(UIView *)view;
+ (void)showError:(NSString *)error view:(UIView *)view delay:(NSTimeInterval)delay;

/**
 *  在window上显示成功提示
 */
+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success delay:(NSTimeInterval)delay;
/**
 *  在window上显示错误提示
 */
+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error delay:(NSTimeInterval)delay;




@end
