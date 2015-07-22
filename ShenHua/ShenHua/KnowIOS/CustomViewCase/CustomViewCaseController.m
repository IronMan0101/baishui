//
//  CustomViewCaseController.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/12.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "CustomViewCaseController.h"
#import "CutomViewCase1.h"

@interface CustomViewCaseController ()

@end

@implementation CustomViewCaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CutomViewCase1 *cutomViewCase1=[UIView bc_loadNib:@"CutomViewCase1"];
//    [self.view addSubview:cutomViewCase1];
//    cutomViewCase1.caseText1.text=@"你妹啊";

//    [self.view addSubview:self.caseView2];
//    self.caseText2.text=@"我爱你";

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

@end
