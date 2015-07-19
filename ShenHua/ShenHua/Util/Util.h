//
//  Util.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/19.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

/**
 *  打开URL
 */
+(void)openURL:(NSString *)strURL;

/**
 *  拨打电话,可使拨打完,返回应用,而不是电话界面
 */
+(void)openCALL:(UIView *)view  phoneNumber:(NSString *)phoneNumber;

@end
