//
//  FiveVC.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/7.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "FiveVC.h"
#import "CellModel.h"

@interface FiveVC ()

@end

@implementation FiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
    UITableView * tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
  //  tableView.style=UITableViewStyleGrouped;
    tableView.delegate=self;
    tableView.dataSource=self;
    //tableView.tableHeaderView
    
    UIView *headerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, tableView.frame.size.width, 5)];
    tableView.tableHeaderView = headerView;
    
   // tableView.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:tableView];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  [self.context count];
}
#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [[self.context objectAtIndex:section] count];
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor=[UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    NSArray* arrayModel = [self.context objectAtIndex:[indexPath section]];
    CellModel *cellModel =[arrayModel objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:cellModel.imageName];
    cell.imageView.frame=CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y, 25, 25);
    cell.textLabel.text=cellModel.text;

    return cell;
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




@end
