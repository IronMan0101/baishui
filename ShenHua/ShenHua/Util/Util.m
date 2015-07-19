//
//  Util.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/19.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "Util.h"

@implementation Util


/**
 *  打开URL 网页
 */
+(void)openURL:(NSString *)strURL
{
    NSString *preURL=@"http://";
    if (![strURL bc_startsWith:preURL])
    {
        strURL=[NSString stringWithFormat:@"%@%@",preURL,strURL ];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strURL]];
}

/**
 *  拨打电话
 */
+(void)openCALL:(UIView *)view  phoneNumber:(NSString *)phoneNumber
{

    UIWebView *webviewPhone = (UIWebView *)[view viewWithTag:PHONENUMBER_TAG];
    if (webviewPhone == nil)
    {
        webviewPhone = [[UIWebView alloc] initWithFrame:CGRectZero];
        webviewPhone.tag = 999;
        [view addSubview:webviewPhone];
    }
    NSString *realPhoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSURL *urlPhone = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",realPhoneNumber]];
    
    [webviewPhone loadRequest:[NSURLRequest requestWithURL:urlPhone]];
}



@end
