
#import <Foundation/Foundation.h>

#define HDM_Global [HDMGlobal sharedInstance]

@interface HDMGlobal : NSObject
{
    
}

+ (instancetype)sharedInstance;

/*!
 *  下载章节管理
 */
@property (nonatomic, assign) BOOL isFromDSM;

/*!
 *  是否显示（全部开始/全部暂停）按钮
 */
@property (nonatomic, assign) BOOL isShowDPB;

/*!
 *  当前用户状态, 在离开登录模块时赋值
 */
@property (nonatomic, assign) BCUserStatus userStatus;
@property (nonatomic, assign) BCUserStatus loginStatus;

/*!
 *  当前订购状态，在离开订购模块时赋值
 */
@property (nonatomic, assign) BCPurchaseStatus purchaseStatus;
///*!
// *  当前登录状态
// */
//@property (nonatomic, assign) BCLoginStatus loginStatus;
/*!
// *  登录来自于，只有播放中的时候，才为10
// */
//@property (nonatomic, assign) int loginFromStatus;

/*!
 *  用户邮箱，用于异网订购。
 */
@property (nonatomic, copy) NSString * mail;

/*!
 *  选集信息是否需要刷新标识 false 需要 true不需要
 */
@property (nonatomic, assign) BOOL productRefreshFlag;

/*!
 *  播放状态 用于确定窗口等级
 */
@property (nonatomic, assign) BCPlayStatus playStatus;

@property (nonatomic, assign) BOOL historyHidden;
@property (nonatomic, assign) BOOL isOpenFlag; // 是否开放标识  yes 有免费标签 no 无免费标签


@end
