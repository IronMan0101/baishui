//
//  NSString+BCCategory.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BCCategory)



- (unichar)    bc_charAt:(NSInteger)index;                                    //获取指定单个字符
- (BOOL)       bc_startsWith:(NSString*)prefix;                               //是某个字符串为开始
- (BOOL)       bc_endsWith:(NSString*)suffix;                                 //是某个字符串为结束
- (BOOL)       bc_equals:(NSString*) anotherString;                           //字符串是否相等
- (BOOL)       bc_equalsIgnoreCase:(NSString*) anotherString;                 //字符串是否相等忽略大小写
- (BOOL)       bc_contains:(NSString*) str;                                   //是否包含某一个字符串
- (NSString *) bc_toLowerCase;                                                //转化小写字母
- (NSString *) bc_toUpperCase;                                                //转化大写字母
- (NSString *) bc_trim;                                                       //去掉两端空格
- (NSString *) bc_replaceAll:(NSString*)origin with:(NSString*)replacement;   //替换字符串
- (NSArray *)  bc_split:(NSString*) separator;                                //拆分为数组
- (NSString *) bc_substringFromIndex:(NSInteger)begin toIndex:(NSInteger)end; //截取字符串
+ (BOOL)       bc_isEmpty:(NSString *)string;                                 //判断字符串是否为空
+ (NSString *) bc_removeNil:(NSString*)content;                               //把nil转成“”
- (NSString *) bc_leftPad:(NSInteger)sum withString:(NSString *)withString;   //左边补什么
- (NSString *) bc_leftPadWithEmtpy:(NSInteger)sum;                            //左边用空格补齐
- (NSString *) bc_leftPadWithZero:(NSInteger)sum;                             //左边用0补齐

@end
