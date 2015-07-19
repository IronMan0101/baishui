//
//  HubViewCaseVC.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/19.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "HubViewCaseVC.h"
#import "HDMChannelTagManager.h"

@interface HubViewCaseVC ()

@end

@implementation HubViewCaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnLogin:(id)sender
{
    [Toast showWithHub:@"正在登陆..."];
    
    HDMChannelTagManager*  _manager = [[HDMChannelTagManager alloc] initWithParameter:nil];
    _manager.channel =2;
    [_manager enquiryListSuccess:^(NSDictionary *codeMsg) {
        
        NSLog(@"success");
        [Toast hideWithHub];
        //[Toast show:@"登陆成功!"];
        //[Toast showSuccess:@"登陆成功!"];
        [Toast showError:@"网络连接超时!!!"];
        
    } Failure:^(NSDictionary *codeMsg)
     {
        // NSLog(@"获取菜单失败");
         //   [HDMPushData sharedInstance].pushChannelState = PushChannelStateDefault;
     }];
}

@end
