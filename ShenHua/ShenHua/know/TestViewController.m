//
//  TestViewController.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/8.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//  http://segmentfault.com/a/1190000002473595

//技术测试类

//博客
//土哥哥的博客
//http://tutuge.me/
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



//2.xcode6 新特性
//删除里面的 Launch screen interface file base name以及 Main Main storyboard file base name
//删除Main.storyboard以及LaunchScreen.xib  ios8 主要使用LauchScreen更加灵活



/**
 *  3.屏幕适配
 */
//xcode4时代,autoresizeing
//xcode5时代,autolayout
//xcode6时代,sizeclass


/**
 *  4.kvc
 */
//获取私有变量 
//SDCache  checkImageSize实现


/**
 *  5.gcd实现单例
 */
//CacheManager实现
//主要通过dispatch_once


/**
 *  6.上传appstore注意点
 */
//6.1edit secme 改为release版本


/**
 *  7.NSLog Release关掉
 */
//7.1 添加pch DLog代替 xcode6去掉了



/**
 *  8.安装appledoc
 */


/**
 *  9. 改变cell高度
     不能修改,属性是readonly   cell默认高度44
 */

//cell.imageView.image = [UIImage imageNamed:cellModel.imageName];
//cell.imageView.frame=CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y, 25, 25);
//只能对图片进行缩放


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 44;
//}


/**
 *  10.self.view.frame不能再用了
 *  采用sizeclass大小一直都是600x600
 */

//self.tableView =[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
//self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT-49)  style:UITableViewStyleGrouped] ;
//


/**
 *  11.uinavgationcontroller层级关系
 *    navigationItem 是nsobject,bar视图的全部元素（如title,tileview,backBarButtonItem等
 *    每一个加到navigationController的viewController都会有一个对应的navigationItem，该对象由viewController以懒加载的方式创建
 *    self.navigationController.navigationItem 是应该被忽视的属性，navigationcontroller继承与view controller，所以会有这个属性，但没有任何作用
 */

//    self.navigationItem.title=@"发现";
//    self.navigationController.title=@"发现";
//    self.navigationController.navigationItem.title=@"发现";
//    self.title=@"发现";


/**
 *  
 */


@end