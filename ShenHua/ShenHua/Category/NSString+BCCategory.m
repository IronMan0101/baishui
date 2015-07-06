//
//  NSString+BCCategory.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "NSString+BCCategory.h"

@implementation NSString (BCCategory)



#define JavaNotFound -1


/**
 * Java-like method. Compares two strings lexicographically.
 * the value 0 if the argument string is equal to this string;
 * a value less than 0 if this string is lexicographically less than the string argument;
 * and a value greater than 0 if this string is lexicographically greater than the string argument.
 */
- (int) compareTo:(NSString*) anotherString
{
    return [self compare:anotherString];
}

/** Java-like method. Compares two strings lexicographically, ignoring case differences. */
- (int) compareToIgnoreCase:(NSString*) str {
    return [self compare:str options:NSCaseInsensitiveSearch];
}

/** Java-like method. Returns true if and only if this string contains the specified sequence of char values. */
- (BOOL) contains:(NSString*) str {
    NSRange range = [self rangeOfString:str];
    return (range.location != NSNotFound);
}



- (BOOL) equals:(NSString*) anotherString {
    return [self isEqualToString:anotherString];
}

- (BOOL) equalsIgnoreCase:(NSString*) anotherString {
    return [[self toLowerCase] equals:[anotherString toLowerCase]];
}

- (int) indexOfChar:(unichar)ch{
    return [self indexOfChar:ch fromIndex:0];
}

- (int) indexOfChar:(unichar)ch fromIndex:(int)index
{
    NSInteger len = self.length;
    for (int i = index; i < len; ++i) {
        if (ch == [self charAt:i]) {
            return i;
        }
    }
    return JavaNotFound;
}

- (int) indexOfString:(NSString*)str {
    NSRange range = [self rangeOfString:str];
    if (range.location == NSNotFound) {
        return JavaNotFound;
    }
    return range.location;
}

- (int) indexOfString:(NSString*)str fromIndex:(int)index {
    NSRange fromRange = NSMakeRange(index, self.length - index);
    NSRange range = [self rangeOfString:str options:NSLiteralSearch range:fromRange];
    if (range.location == NSNotFound) {
        return JavaNotFound;
    }
    return range.location;
}

- (int) lastIndexOfChar:(unichar)ch {
    int len = self.length;
    for (int i = len-1; i >=0; --i) {
        if ([self charAt:i] == ch) {
            return i;
        }
    }
    return JavaNotFound;
}

- (int) lastIndexOfChar:(unichar)ch fromIndex:(int)index
{
    int len = self.length;
    if (index >= len) {
        index = len - 1;
    }
    for (int i = index; i >= 0; --i) {
        if ([self charAt:i] == ch) {
            return index;
        }
    }
    return JavaNotFound;
}

- (int) lastIndexOfString:(NSString*)str {
    NSRange range = [self rangeOfString:str options:NSBackwardsSearch];
    if (range.location == NSNotFound) {
        return JavaNotFound;
    }
    return range.location;
}

- (int) lastIndexOfString:(NSString*)str fromIndex:(int)index {
    NSRange fromRange = NSMakeRange(0, index);
    NSRange range = [self rangeOfString:str options:NSBackwardsSearch range:fromRange];
    if (range.location == NSNotFound) {
        return JavaNotFound;
    }
    return range.location;
}

- (NSString *) substringFromIndex:(int)beginIndex toIndex:(int)endIndex {
    if (endIndex <= beginIndex) {
        return @"";
    }
    NSRange range = NSMakeRange(beginIndex, endIndex - beginIndex);
    return [self substringWithRange:range];
}




//获取指定单个字符
- (unichar) charAt:(NSInteger)index
{
    return [self characterAtIndex:index];
}
//是某个字符串为开始
- (BOOL) startsWith:(NSString*)prefix
{
    return [self hasPrefix:prefix];
}
//是某个字符串为结束
- (BOOL) endsWith:(NSString*)suffix
{
    return [self hasSuffix:suffix];
}
//转化小写字母
- (NSString *) toLowerCase
{
    return [self lowercaseString];
}
//转化大写字母
- (NSString *) toUpperCase
{
    return [self uppercaseString];
}
//去掉两端空格
- (NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
// 替换字符串
- (NSString *) replaceAll:(NSString*)origin with:(NSString*)replacement
{
    return [self stringByReplacingOccurrencesOfString:origin withString:replacement];
}
//拆分为数组
- (NSArray *)split:(NSString*)separator
{
    return [self componentsSeparatedByString:separator];
}


@end
