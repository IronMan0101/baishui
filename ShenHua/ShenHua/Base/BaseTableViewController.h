//
//  BaseTableViewController.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/18.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)  UITableView *tableView;    //列表
@property(nonatomic,copy)    NSMutableArray  * context; //记录集


/**
 *  初始化tableview
 */
-(void)initTableView:(UITableViewStyle)style;

/**
 *  设置tableview 第一个cell 便宜顶部的距离
 */
-(void)setTableViewOffsetTop:(GLfloat)offset;


@end
