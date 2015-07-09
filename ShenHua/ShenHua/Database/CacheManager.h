//
//  CacheManager.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/9.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject


/**
 *  获取单例
 */
+ (CacheManager *)sharedManager;


/**
 *  获取SDWebImage缓存大小
 */
- (float)computeSDImageCacheSize;


/**
 *  格式化缓存大小
 */
-(NSString *)formatCacheSize;

/**
 *  清除缓存
 */
-(void)clearSDImageCache;

@end
