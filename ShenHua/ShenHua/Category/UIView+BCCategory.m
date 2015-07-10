//
//  UIView+BCCategory.m
//  ShenHua
//
//  Created by suzhiqiu on 15/7/5.
//  Copyright (c) 2015年 suzhiqiu. All rights reserved.
//

#import "UIView+BCCategory.h"

@implementation UIView (BCCategory)


///**
// *  获取x
// */
//- (CGFloat)bc_x
//{
//    return self.frame.origin.x;
//}
//
///**
// *  获取y
// */
//- (CGFloat)bc_y
//{
//    return self.frame.origin.y;
//}
///**
// *  获取width
// */
//- (CGFloat)bc_width
//{
//    return self.frame.size.width;
//}
//
///**
// *  获取height
// */
//- (CGFloat)bc_height
//{
//    return self.frame.size.height;
//}
///**
// *  获取size
// */
//- (CGSize)bc_size
//{
//    return self.frame.size;
//}



/**
 *  设置x坐标
 */
- (void)bc_setX:(CGFloat)originX
{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

/**
 *  设置y坐标
 */
- (void)bc_setY:(CGFloat)originY
{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

/**
 *  设置with宽度
 */
- (void)bc_setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
/**
 *  设置height宽度
 */
- (void)bc_setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

/**
 *  设置size大小
 */
- (void)bc_setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}



/**
 *   移除此view上的所有子视图
 */
- (void)bc_removeAllSubviews
{
    for (UIView *view in self.subviews)
    {
        [view removeFromSuperview];
    }
}

/**
 *   打印大小
 */
-(void)bc_log:(NSString *)tip
{
    NSLog(@"%@ -- %@",tip,NSStringFromCGRect(self.frame));
}


@end
