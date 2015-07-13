//
//  MasonryCaseVC.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/13.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "MasonryCaseVC.h"
#import "Macros.h"
//
//

@interface MasonryCaseVC ()

@end

@implementation MasonryCaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.lbl1 =[[UILabel alloc] init];
    self.lbl2 =[[UILabel alloc] init];
    self.lbl3 =[[UILabel alloc] init];
    self.lbl4 =[[UILabel alloc] init];
    self.lbl5 =[[UILabel alloc] init];
    self.lbl6 =[[UILabel alloc] init];
    
    [self.view addSubview:self.lbl1];
    [self.view addSubview:self.lbl2];
    [self.view addSubview:self.lbl3];
    [self.view addSubview:self.lbl4];
    [self.view addSubview:self.lbl5];
    [self.view addSubview:self.lbl6];
    
    
    self.lbl1.backgroundColor=RGB(92,252,168);
    self.lbl2.backgroundColor=RGB(252,178,37);
    self.lbl3.backgroundColor=RGB(252,123,89);
    self.lbl4.backgroundColor=RGB(238,133,252);
    self.lbl5.backgroundColor=RGB(86,174,252);
    self.lbl6.backgroundColor=RGB(252,66,33);

  

    
    self.lbl1.hidden=YES;
    self.lbl2.hidden=YES;
    self.lbl3.hidden=YES;
    self.lbl4.hidden=YES;
    self.lbl5.hidden=YES;
    self.lbl6.hidden=YES;
    
    //[self mas1];//贴近view边缘
    //[self mas2];//居中 大小300,300
    //[self mas3];//居中 两个高度为150的view垂直居中且等宽且等间隔排列 间隔为10(自动计算其宽度)
    [self mas4];//宽度是高度0.8或者一般

   
}

//贴近view边缘
-(void)mas1
{
    self.lbl1.hidden=NO;
    
    [self.lbl1 mas_makeConstraints:^(MASConstraintMaker *make)
    {
//        make.edges.equalTo(self.view);//完全贴近

//        以下三种都行
//        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(20, 20, 20, 20));
        
//        make.left.equalTo(self.view).offset(20);
//        make.right.equalTo(self.view).offset(-20);
//        make.top.equalTo(self.view).offset(20);
//        make.bottom.equalTo(self.view).offset(-20);
        
//        make.left.right.top.bottom.insets(UIEdgeInsetsMake(20, 20, 20, 20));
        

    }];
}

//居中 大小300,300
-(void)mas2
{
    self.lbl1.hidden=NO;

    [self.lbl1 mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.center.equalTo(self.view);
         make.size.mas_equalTo(CGSizeMake(300,300));
     }];
}


//居中 两个高度为150的view垂直居中且等宽且等间隔排列 间隔为10(自动计算其宽度)
-(void)mas3
{
    self.lbl1.hidden=NO;
    self.lbl2.hidden=NO;
    
    [self.lbl1 mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.equalTo(self.view);
         make.height.mas_equalTo(@150);
         
         make.left.equalTo(self.view).offset(10);
         make.right.equalTo(self.lbl2.mas_left).offset(-10);
         
         make.width.equalTo(self.lbl2);

        //
          // make.width.equalTo(@[view2, view3]); 多个view
     }];//
    
    [self.lbl2 mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.equalTo(self.view);
         make.height.mas_equalTo(@150);
         
         make.left.equalTo(self.lbl1.mas_right).offset(10);
         make.right.equalTo(self.view).offset(-10);
         
        make.width.equalTo(self.lbl1);
     }];
    
//    //设置label1的content hugging 为1000  放置内容被压缩
//    [self.lbl2 setContentHuggingPriority:UILayoutPriorityRequired
//                               forAxis:UILayoutConstraintAxisHorizontal];
//    
//    [self.lbl2 setContentCompressionResistancePriority:UILayoutPriorityRequired
//                                             forAxis:UILayoutConstraintAxisHorizontal];
}


//居中 两个高度为150的view垂直居中且等宽且等间隔排列 间隔为10(自动计算其宽度)
-(void)mas4
{
    self.lbl1.hidden=NO;
    self.lbl2.hidden=NO;
    
    [self.lbl1 mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.center.equalTo(self.view);
         make.height.mas_equalTo(@150);
         make.width.equalTo(self.lbl1.mas_height).multipliedBy(0.5);
     }];
}
//






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
