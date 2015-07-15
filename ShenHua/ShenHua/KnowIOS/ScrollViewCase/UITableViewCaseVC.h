//
//  UITableViewCaseVC.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/15.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCaseVC : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)  UITableView *tableView;
@property(nonatomic,copy)    NSMutableArray  * context;
@end
