//
//  NSString+BCCategory.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BCCategory)








/**  Return the char value at the specified index. */


/**
 * Compares two strings lexicographically.
 * the value 0 if the argument string is equal to this string;
 * a value less than 0 if this string is lexicographically less than the string argument;
 * and a value greater than 0 if this string is lexicographically greater than the string argument.
 */
- (int) compareTo:(NSString*) anotherString;

- (int) compareToIgnoreCase:(NSString*) str;

- (BOOL) contains:(NSString*) str;



- (BOOL) equals:(NSString*) anotherString;

- (BOOL) equalsIgnoreCase:(NSString*) anotherString;

- (int) indexOfChar:(unichar)ch;

- (int) indexOfChar:(unichar)ch fromIndex:(int)index;

- (int) indexOfString:(NSString*)str;

- (int) indexOfString:(NSString*)str fromIndex:(int)index;

- (int) lastIndexOfChar:(unichar)ch;

- (int) lastIndexOfChar:(unichar)ch fromIndex:(int)index;

- (int) lastIndexOfString:(NSString*)str;

- (int) lastIndexOfString:(NSString*)str fromIndex:(int)index;

- (NSString *) substringFromIndex:(int)beginIndex toIndex:(int)endIndex;

- (unichar)    charAt:(NSInteger)index;                                    //获取指定单个字符
- (BOOL)       startsWith:(NSString*)prefix;                               //是某个字符串为开始
- (BOOL)       endsWith:(NSString*)suffix;                                 //是某个字符串为结束
- (NSString *) toLowerCase;                                                //转化小写字母
- (NSString *) toUpperCase;                                                //转化大写字母
- (NSString *) trim;                                                       //去掉两端空格
- (NSString *) replaceAll:(NSString*)origin with:(NSString*)replacement;   //替换字符串
- (NSArray *)  split:(NSString*) separator;                                //拆分为数组


@end
