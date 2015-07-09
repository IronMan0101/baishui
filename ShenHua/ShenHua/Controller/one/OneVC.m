//
//  OneVC.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/7.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "OneVC.h"
#import "CacheManager.h"

@interface OneVC ()

@end

@implementation OneVC



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITableView * tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.delegate=self;
    tableView.dataSource=self;
    
    tableView.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:tableView];
    _list=[[NSMutableArray alloc]initWithCapacity:100];
    
    [self.list addObject:@"支付宝"];
    
    for (NSInteger i=0; i<100; i++)
    {
         [self.list addObject:@"支付宝"];
    }
    
    
    NSString *str= [[CacheManager sharedManager] formatCacheSize];
    DLog(@"%@",str);
    DLog(@"");
    //
    //    UITableView * tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, UI_NAVBAR_HEIGHT, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT-UI_TABBAR_HEIGHT-UI_NAVBAR_HEIGHT)];
    
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


#pragma mark - 数据源方法
//#pragma mark 返回分组数
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    NSLog(@"计算分组数");
//    return self.list.count;
//}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return  self.list.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
//    NSLog(@"生成单元格(组：%i,行%i)",indexPath.section,indexPath.row);
//    KCContactGroup *group=_contacts[indexPath.section];
//    KCContact *contact=group.contacts[indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor=[UIColor greenColor];
    cell.textLabel.text=[self.list objectAtIndex:indexPath.row];
  //  cell.detailTextLabel.text=contact.phoneNumber;
    return cell;
}



@end
