//
//  SDCache.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/9.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "SDCache.h"
#import <objc/runtime.h>

@implementation SDCache



/**
 *  获取SDWebImage缓存大小
 *
 *  @return 返回缓存大小
 */
- (float)checkImageSize
{
    float totalSize = 0;
    
    NSString *diskCachePath=[self valueForKey:@"diskCachePath"];//利用kvc技术获取私有变量
    DLog(@"diskCachePath:%@",diskCachePath);
    DLog(@"");
    
    
    
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:diskCachePath];
    
    for (NSString *fileName in fileEnumerator)
    {
        NSString *filePath = [diskCachePath stringByAppendingPathComponent:fileName];
        NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        unsigned long long length = [attrs fileSize];
        totalSize += length / 1024.0 / 1024.0;
    }
    return totalSize;
}

@end
