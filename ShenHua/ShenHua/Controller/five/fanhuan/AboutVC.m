//
//  AboutVC.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/18.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "AboutVC.h"
#import "Macros.h"

@interface AboutVC ()

@end

@implementation AboutVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initTableView:UITableViewStylePlain];
    
    //[self setTableViewOffsetTop:100];
    //
    
    [self initialTableHeaderView];
    [self initialTableFooterView];
    
   // [self.tableView reloadData];
    
}


- (void)initialTableHeaderView
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 230)];
    
   
    UILabel *lblAppInfo = [[UILabel alloc] init];
    lblAppInfo.font = [UIFont systemFontOfSize:15];
    lblAppInfo.backgroundColor = [UIColor clearColor];
    lblAppInfo.textColor = [UIColor lightGrayColor];
    lblAppInfo.textAlignment = NSTextAlignmentCenter;
    lblAppInfo.text = @"返还 V3.1.0";
    
    UIImageView *imgvLogo = [[UIImageView alloc] init];
    imgvLogo.image = [UIImage imageNamed:@"MoreGame"];
  
    [headerView addSubview:imgvLogo];
    [headerView addSubview:lblAppInfo];
    
    self.tableView.tableHeaderView = headerView;
 

    
    
    [imgvLogo mas_makeConstraints:^(MASConstraintMaker *make)
     {
         
         make.top.equalTo(headerView).offset(55);
         make.height.mas_equalTo(90);
         make.width.mas_equalTo(90);
         make.centerX.equalTo(headerView.mas_centerX);
     }];
    
    
    [lblAppInfo mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(headerView).offset(160);
         make.height.mas_equalTo(UI_LABEL_HEIGHT);
         make.width.mas_equalTo(headerView.mas_width);
     }];
    
}


- (void)initialTableFooterView
{
    UIView *footerView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)];
    UILabel *lblCopyRight = [[UILabel alloc] init];

    lblCopyRight.font = [UIFont systemFontOfSize:11];
    lblCopyRight.backgroundColor = [UIColor clearColor];
    lblCopyRight.textColor = [UIColor lightGrayColor];
    lblCopyRight.numberOfLines = 2;
    lblCopyRight.textAlignment = NSTextAlignmentCenter;
    
 
    lblCopyRight.text = @"Copyright © 2015 灵感方舟\r\n All rights reserved.";
    
    [footerView addSubview:lblCopyRight];
    self.tableView.tableFooterView = footerView;


    [lblCopyRight mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(footerView).offset(10);
         make.height.mas_equalTo(UI_LABEL_HEIGHT*2);
         make.width.mas_equalTo(footerView.mas_width);
     }];
}







- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        return 55;
    }
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = UIColorFromRGB(0x555555);
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        
        cell.detailTextLabel.textColor = UIColorFromRGB(0x555555);
        cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    }else {
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"常见问题";
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
            break;
        case 1:
        {
            cell.textLabel.text = @"特别申明";
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
            break;
        case 2:
        {
            cell.textLabel.text = @"客服热线";
            cell.accessoryType = UITableViewCellAccessoryNone;
            if (!self.phomeLabel) {
                self.phomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 150, 19, 120, 17)];
                self.phomeLabel.font = [UIFont systemFontOfSize:17];
                self.phomeLabel.backgroundColor = [UIColor clearColor];
                self.phomeLabel.textColor = UIColorFromRGB(0x1e9bfe);
                self.phomeLabel.tag = 200;
                self.phomeLabel.textAlignment = NSTextAlignmentRight;
                [cell.contentView addSubview:self.phomeLabel];
            }
            self.phomeLabel.text = @"400-0053-000";
            
            cell.detailTextLabel.text = @"周一至周五 8:30-18:00";
            
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

//cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消选中色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
