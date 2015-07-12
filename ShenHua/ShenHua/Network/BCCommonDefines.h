
#import <Foundation/Foundation.h>

#define N_BCViewController_ViewDidAppear @"N-BCViewController-ViewDidAppear"
#define N_BCViewController_ViewWillAppear @"N-BCViewController-ViewWillAppear"
#define N_BCViewController_ViewDidLoad @"N-BCViewController-ViewDidLoad"
#define N_BCViewController_ViewWillDisAppear @"N-BCViewController-ViewWillDisAppear"


/*!
 *  RGB颜色实例
 *
 *  @param RValue <#RValue description#>
 *  @param GValue <#GValue description#>
 *  @param BValue <#BValue description#>
 *
 *  @return <#return value description#>
 */
#define BCColorWithRGBValue(RValue, GValue, BValue) [UIColor colorWithRed:RValue green:GValue blue:BValue alpha:1.0f]

#define statusBarH 20
#define tabBarH 49
#define navigationH 44
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define kRequestStatusViewTag 10086

#define kDefaultPersonaltureText @"这家伙很懒，什么都没有留下！"

#pragma mark - 宏方法大写首字母

#define BCIntString(intValue) [NSString stringWithFormat:@"%@", [NSNumber numberWithInt:intValue]]
#define BCIntegerString(integerValue) [NSString stringWithFormat:@"%@", [NSNumber numberWithInteger:integerValue]]


