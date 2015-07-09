//
//  CacheManager.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/9.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "CacheManager.h"
#import "SDImageCache.h"
#import "SDCache.h"

@implementation CacheManager

/**
 *  获取单例
 *
 *  @return 单例
 */

+ (CacheManager *)sharedManager
{
    
    static CacheManager *sharedManagerInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedManagerInstance = [[CacheManager alloc] init];
        
    });
    
    return sharedManagerInstance;
}


/**
 *  获取SDWebImage缓存大小
 *
 *  @return 返回缓存大小
 */
- (float)computeSDImageCacheSize
{
    SDCache *cache=[[SDCache alloc]init];
    return  [cache checkImageSize];
}


/**
 *  格式化缓存大小
 *
 *  @return 缓存
 */
-(NSString *)formatCacheSize
{
    float tmpSize = [self computeSDImageCacheSize];
    
    NSString *clearCacheName = tmpSize >= 1 ? [NSString stringWithFormat:@"%.2fM",tmpSize] : [NSString stringWithFormat:@"%.2fK",tmpSize * 1024];
    
    return clearCacheName;
}


/**
 *  清除缓存
 */
-(void)clearSDImageCache
{
     [[SDImageCache sharedImageCache] clearDisk];

}






@end
