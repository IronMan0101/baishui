//
//  BaseTableViewController.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/18.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *  初始化tableview
 */
-(void)initTableView:(UITableViewStyle)style
{
    self.tableView=[[UITableView alloc] initWithFrame:CGRectZero style:style];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    
    //默认全屏宽高
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.edges.equalTo(self.view);
    }];
    
    //打印大小
    //[self.view bc_log:@"self.view"];
    //[self.tableView bc_log:@"self.tableview"];
    
    //设置记录集
    self.context = [[NSMutableArray alloc] init];
}
/**
 *  设置tableview 第一个cell 便宜顶部的距离
 */
-(void)setTableViewOffsetTop:(GLfloat)offset
{
    //设置与顶部距离
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, offset)];
    self.tableView.tableHeaderView=headerView;
}



//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    // Return the number of rows in the section.
//    return 0;
//}
//
//
// - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
// UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
// 
// // Configure the cell...
// 
// return cell;
// }

@end
