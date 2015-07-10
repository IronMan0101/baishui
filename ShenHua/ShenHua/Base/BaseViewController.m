//
//  BaseViewController.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/7.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "BaseViewController.h"
#import "Macros.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=BASEVIEWCOLOR;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

////默认竖屏
//#pragma mark - UIViewControllerRotation
//- (BOOL)shouldAutorotate{
//    return NO;
//}
//
//
//- (NSUInteger)supportedInterfaceOrientations{
//    
//    return UIInterfaceOrientationMaskPortrait;
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
//    
//    return UIInterfaceOrientationPortrait;
//}




@end
