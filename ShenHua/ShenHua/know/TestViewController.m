//
//  TestViewController.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/8.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

//技术测试类

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/**
 *  深拷贝与浅拷贝
 */
-(void)DeepCopySimpleCopy
{
    //@interface NSString : NSObject <NSCopying, NSMutableCopying, NSSecureCoding>
    //@interface NSArray : NSObject <NSCopying, NSMutableCopying, NSSecureCoding, NSFastEnumeration>
    NSString *strCopy = @"testCopy";

    NSMutableString *deepCopy = [strCopy mutableCopy];    //内容拷贝  如果有传值用这个
    NSString *simpleCopy = [strCopy copy];                //指针拷贝
    
    
    [deepCopy appendString:@"Deep"];
    NSLog(@"strCopy:%@,deepCopy:%@",strCopy,deepCopy);
    simpleCopy=@"SimpleCopy";
    NSLog(@"strCopy:%@,deepCopy:%@",strCopy,deepCopy);
    
}


@end
