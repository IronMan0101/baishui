//
//  SDCache.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/9.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//


#import "SDImageCache.h"


@interface SDCache:SDImageCache

/**
 *  获取SDWebImage缓存大小
 *
 *  @return 返回缓存大小
 */
- (float)checkImageSize;


@end