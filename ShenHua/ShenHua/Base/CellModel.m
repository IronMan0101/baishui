//
//  CellModel.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/10.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel


- (instancetype)init:(NSString*)strImageName  Text:(NSString *)strText  DetailText:(NSString *)detailText
{

    self = [super init];
    
    if (self)
    {
        _imageName=strImageName;    //25x25
        _text=strText;
        _detailText=detailText;
    }
    
    return self;
}


- (instancetype)init:(NSString*)strImageName  Text:(NSString *)strText
{
    
    self = [self init:strImageName Text:strText DetailText:@""];
    
    if (self)
    {

    }
    
    return self;
}

@end
