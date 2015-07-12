//
//  HDMClient.h
//  User
//
//  Created by Sea on 14-6-4.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HDMAlertViewCondition) {
    
    HDMAlertViewInLogin,
    HDMAlertViewInCheck,
    HDMAlertViewInChannel,
};

#define HDM_Client [HDMClient client]


typedef enum {
    
    BCMediaQualityNone = 0,//没选择
    
    //BCMediaHighQuality = 1,//高清2
    BCMediaFlowQuality = 2,//流畅0
    BCMediaClearQuality = 1,//清晰1
}BCMediaQuality;

typedef NS_ENUM(NSUInteger, HDMVisibleView)
{
    HDMPlayerViewVisible = 0,
    
    HDMLoginViewVisible,
    HDMRechargeViewVisible,
    
    HDMOtherViewVisible,
};



@interface HDMClient : BCModel
{
    NSString * _update_type;
    NSString * _upd_des;
    
    BOOL _isCheck;
    
    id _cacheObserver;
}

+ (instancetype)client;

/*advertise*/
@property (nonatomic, copy) NSString * time;
@property (nonatomic, copy) NSString * url;

/*bracket_info*/
@property (nonatomic, copy) NSString * load_url;
@property (nonatomic, copy) NSString * upd_des;
@property (nonatomic, copy) NSString * upd_size;
@property (nonatomic, copy) NSString * update_type;
@property (nonatomic, copy) NSString * version;
@property (nonatomic, copy) NSString * version_upgrade;
@property (nonatomic, copy) NSString * alertCount;
@property (nonatomic, copy) NSString * user_time;

@property (nonatomic, assign) HDMVisibleView visibleView;

- (void)clientLoginSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

- (void)showAlertViewInCondition:(HDMAlertViewCondition)condition;
- (NSString *)messageText;


/*!
 * 积分-漫币兑换比例
 */
@property (nonatomic, copy) NSString * ratio;

- (void)updateRatioSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;
- (void)checkClientSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;


/*setting*/

/*!
 *  自动登录开关：默认开启；
 *  开启后登录时按登录流程自动为用户登录；
 *  关闭后需用户手动输入账号密码登录；
 */
@property (nonatomic, copy) NSString * isAutoLogin;

/*!
 *  恢复下载提示：默认开启；
 *  开启后，登录时如有未完成的下载任务，弹框提示用户；
 *  关闭后，则不弹框提示；
 */
@property (nonatomic, copy) NSString * isPromptWhenDownload;

/*!
 *  数据网络下载提示：默认开启；
 *  开启后，用户使用2G/3G网络下载时弹框提示用户，具体见“全局功能-网络提示”；
 *  关闭后，不弹框提示用户；
 */
@property (nonatomic, copy) NSString * isPromptWhenUseWLanNetwork;


/*!
 *  2、画质分为智能、高清、清晰、流畅：
 *  a）默认勾选智能，选中智能则根据网络判断，wifi网络播放或下载优先级为：高清>清晰>流畅，非wifi网络播放或下载优先级为：流畅>清晰>高清 ；
 *  b）勾选了高清，播放或下载优先级为高清>清晰>流畅，勾选了清晰，播放或下载优先级为清晰>流畅>高清，勾选了流畅，播放或下载优先级为流畅>清晰>高清；
 *  c）用户在插件更改了画质后，未退出插件则以插件设置的画质为准。退出插件后仍以管理中的设置为准。
 */
@property (nonatomic, copy) NSString * DHWatchQuality;
@property (nonatomic, copy) NSString * DHDownloadQuality;
/**
 *	@brief	退出时是否自动清除缓存
 */
@property (nonatomic, copy) NSString *  MCQuitClearCache;

@property (nonatomic, copy) NSString * creditText;
@property (nonatomic, copy) NSString * currencyText;

- (void)querySystemVariableSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

- (BCMediaQuality)WatchQuality;
- (BCMediaQuality)WatchQuality:(BCMediaQuality)WatchQuality;

- (BCMediaQuality)DownloadQuality;
- (BCMediaQuality)DownloadQuality:(BCMediaQuality)DownloadQuality;

- (UIImage *)vertificationCodePictureImage;
- (NSString *)vertificationCodeResult;
- (void)vertificationCodePicture:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;



@end
