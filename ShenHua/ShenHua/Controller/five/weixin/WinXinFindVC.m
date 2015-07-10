//
//  FiveVC.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/7.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "WinXinFindVC.h"
#import "CellModel.h"
#import "BCCategory.h"
#import "Macros.h"

@interface WinXinFindVC ()

@end

@implementation WinXinFindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title=@"微信-发现";
    
    [self initData];
    [self initTableView];
  
}

-(void)initData
{
    _context=[[NSMutableArray alloc]initWithCapacity:10];
   
    
    CellModel *model11=[[CellModel alloc]init:@"ff_IconShowAlbum" Text:@"朋友圈"];
    
    CellModel *model21=[[CellModel alloc]init:@"ff_IconQRCode" Text:@"扫一扫"];
    CellModel *model22=[[CellModel alloc]init:@"ff_IconShake" Text:@"摇一摇"];
    
    CellModel *model31=[[CellModel alloc]init:@"ff_IconLocationService" Text:@"附近的人"];
    CellModel *model32=[[CellModel alloc]init:@"ff_IconBottle" Text:@"漂流瓶"];
    
    
    CellModel *model41=[[CellModel alloc]init:@"CreditCard_ShoppingBag" Text:@"购物"];
    CellModel *model42=[[CellModel alloc]init:@"MoreGame" Text:@"游戏"];
    
    [self.context addObject:[NSArray arrayWithObjects:model11, nil]];
    [self.context addObject:[NSArray arrayWithObjects:model21,model22, nil]];
    [self.context addObject:[NSArray arrayWithObjects:model31,model32, nil]];
    [self.context addObject:[NSArray arrayWithObjects:model41,model42, nil]];
  
    
}

-(void)initTableView
{
   
   self.tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    //打印大小
    //[self.view bc_log:@"self.view"];
    //[self.tableView bc_log:@"self.tableview"];
    //设置好代理
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    //设置与顶部距离
    UIView *headerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.tableView.frame.size.width, 5)];
    self.tableView.tableHeaderView = headerView;
    //添加
    [self.view addSubview:self.tableView];
}


//设置几个section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return  [self.context count];
}
//设置每个section几个row
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return  [[self.context objectAtIndex:section] count];
}
//设置row高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

//默认间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

//cell显示
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellid = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;  //默认有角标
    }
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;  //默认有角标
    NSArray* arrayModel = [self.context objectAtIndex:[indexPath section]];
    CellModel *cellModel =[arrayModel objectAtIndex:indexPath.row];
    
    UIImage *image=[UIImage imageNamed:cellModel.imageName];
    image= [image bc_scaleToSize:CGSizeMake(25, 25)];
//  cell.imageView.image =image ;  //不能修改
//  cell.imageView.frame=CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y, 25, 25);
    cell.imageView.image=image;
    cell.textLabel.text=cellModel.text;
    
   
    cell.selectionStyle = UITableViewCellSelectionStyleGray;         //选中色灰色
    cell.backgroundColor=[UIColor whiteColor];                       //背景默认白色
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//灰色符号

    return cell;
}


//cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消选中色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
