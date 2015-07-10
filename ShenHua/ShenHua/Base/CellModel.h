//
//  CellModel.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/10.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property(nonatomic,copy) NSString *imageName;   //图标名
@property(nonatomic,copy) NSString *text;        //文本
@property(nonatomic,copy) NSString *detailText;  //详细文本

- (instancetype)init:(NSString*)strImageName  Text:(NSString *)strText  DetailText:(NSString *)detailText;
- (instancetype)init:(NSString*)strImageName  Text:(NSString *)strText;

@end
