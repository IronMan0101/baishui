//
//  UIView+BCCategory.h
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BCCategory)


/**
 *  获取x
 */
- (CGFloat)bc_x;
/**
 *  获取y
 */
- (CGFloat)bc_y;
/**
 *  获取width
 */
- (CGFloat)bc_width;
/**
 *  获取height
 */
- (CGFloat)bc_height;
/**
 *  获取size
 */
- (CGSize)bc_size;


/**
 *  设置x坐标
 */
- (void)bc_setX:(CGFloat)originX;
/**
 *  设置y坐标
 */
- (void)bc_setY:(CGFloat)originY;
/**
 *  设置with宽度
 */
- (void)bc_setWidth:(CGFloat)width;
/**
 *  设置height宽度
 */
- (void)bc_setHeight:(CGFloat)height;
/**
 *  设置size大小
 */
- (void)bc_setSize:(CGSize)size;


/**
 *   移除此view上的所有子视图
 */
- (void)bc_removeAllSubviews;

@end
