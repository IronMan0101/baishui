
#import <Foundation/Foundation.h>

/*!
 *  需要父类来操作的块
 *
 *  @param operationType 操作类型
 */
typedef void (^BCSuperOperationBlock) (NSInteger operationType);



typedef void (^BCFinishBlock) (NSMutableDictionary *map);
typedef void (^BCResponderBlock) (NSMutableDictionary *map);

typedef void (^BCSucceedBlock) (NSMutableDictionary *map);
typedef void (^BCFailureBlock) (NSMutableDictionary *map);

typedef void (^NetworkSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^NetworkFailureBlock)(NSURLSessionDataTask *task, NSError *error);

typedef void (^BCNetworkSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^BCNetworkFailureBlock)(NSURLSessionDataTask *task, NSError *error);

typedef NS_ENUM(NSUInteger, BCDeviceResolution){
    
    BCDevice_Unknown                = 0,
    // iPhone 1,3,3GS 标准分辨率(320x480px)
    BCDevice_iPhoneStandardRes      = 1,
    // iPhone 4,4S 高清分辨率(640x960px)
    BCDevice_iPhoneHiRes            = 2,
    // iPhone 5 高清分辨率(640x1136px)
    BCDevice_iPhoneTallerHiRes      = 3,
    // iPad 1,2 标准分辨率(1024x768px)
    BCDevice_iPadStandardRes        = 4,
    // iPad 3 High Resolution(2048x1536px)
    BCDevice_iPadHiRes              = 5
};

/*!
 *  请求状态
 */
typedef NS_ENUM(NSUInteger, BCRequestStatus){
    
    BCRequestDidFinishLoad = 0,//请求结束（成功）
    BCRequestDidFailLoad = 1,
    BCRequestDidFailLoadWithError = 2,//请求结束（失败）
    BCRequestOrigin,
    
    BCRequestDidRefreshLoad,//列表刷新
    BCRequestDidMoreLoad,//列表更多
    
    
    BCRequestDidStartLoad,//开始请求
    
    BCRequestNoResult,//请求结束（无结果）
};


typedef NS_ENUM(NSUInteger, BCDataType){
    
    BCData_DBKey,
    BCData_NSString,
    BCData_NSInteger,
};


/*!
 *  <#Description#>
 */
typedef NS_ENUM(NSUInteger, BCSex){
    
    BCSexNone = 0,
    BCSexMale,
    BCSexFemale,
};

/*!
 *  用户状态
 *  BCUserOnline
 */
typedef NS_ENUM(NSUInteger, BCUserStatus){
    
    BCUserNone,
    BCUserAway,
    BCUserWait,
    BCUserOnline,
    BCUserOffline,
    BCUserStartPlay,//播放登录开始
    BCUserStartDown,//下载登录开始
    BCUserPlay,//播放登录完成
    BCUserDown,//下载登录完成
    BCUserEndPlay,
    BCUserEndDown,

    BCUserInLogin,
};

/*!
 *  购买状态
 */
typedef NS_ENUM(NSUInteger, BCPurchaseStatus){
    /*!
     *  <#Description#>
     */
    BCPurchaseNone,
    BCPurchaseed_StartPlay,//播放订购开始
    BCPurchaseed_StartDown,//下载订购开始
    BCPurchaseed_Play,//播放订购完成
    BCPurchaseed_Down,//下载订购完成
    BCPurchaseed_EndPlay,
    BCPurchaseed_EndDown,
    BCPurchaseing, //订购界面中
    
    BCPurchasePayment,
};
///*!
// *  登录状态
// */
//typedef NS_ENUM(NSUInteger, BCLoginStatus){
//    /*!
//     *  <#Description#>
//     */
//    BCLoginStatusNone,
//    BCLoginStatus_StartPlay,//播放登录开始
//    BCLoginStatus_StartDown,//下载登录开始
//    BCLoginStatus_Play,//播放登录完成
//    BCLoginStatus_Down,//下载登录完成
//    BCLoginStatus_EndPlay,
//    BCLoginStatus_EndDown,
//    BCLogining //登录界面中
//};


typedef NS_ENUM(NSInteger, BCNetworkStatus){
    
    BCNetwork_TRTO = -1001,//(The request timed out.)
    BCNetwork_CNCTTS = -1004,//(Could not connect to the server.)
    BCNetwork_TICATBO = -1009,//(The Internet connection appears to be offline.)
};


typedef enum {
    BCItemRecord,
    BCItemSearch,
    BCItemSetting,
}BCItemType;

typedef NS_ENUM(NSUInteger, BCCodeType) {
    
    BCCode_Success = 0,
    BCCode_Fail = 1,
    BCCode_Error = 2,
    
    BCCode_Activate = 100,
};

/*!
 *  文件下载状态
 */
typedef NS_ENUM(NSUInteger, BCDownloadStatus) {
    
    BCDownload_None = 0,//不能改（有>0的判断，是否在下载任务的判断）更新
    
    /*!
     *  下载完成
     */
    BCDownload_Finish = 1,//不能改（有>1的判断，判断未完成下载的任务）更新
    
    /*!
     *  正在下载
     */
    BCDownload_Ing = 3,
    /*!
     *  暂停
     */
    BCDownload_Pause = 7,
    
    /*!
     *  下载失败
     */
    BCDownload_Fail = 4,
    /*!
     *  取消下载
     */
    BCDownload_Cancel = 5,
    /*!
     *  等待
     */
    BCDownload_Wait = 6,
    
    /*!
     *  <#Description#>
     */
    BCDownload_FileMissed,
};
/*
 * 订购状态
 */
typedef NS_ENUM(NSUInteger,BCOrderStatus)
{
    /*!
     *  默认
     */
    BCOrder_Default,
    /*!
     *  订购成功
     */
    BCOrder_Success
};
/*!
 *  观看类型
 */
typedef NS_ENUM(NSUInteger, BCWatchType) {
    
    /*!
     *  未观看
     */
    BCWatch_NO,
    /*!
     *  已观看
     */
    BCWatch_YES,
    /*!
     *  刚观看
     */
    BCWatch_Lastest
};

/*!
 *  播放状态
 */
typedef NS_ENUM(NSUInteger, BCPlayStatus) {
    
    /*!
     *  播放开始加载
     */
    BCPlayStatus_Start = 1,
    /*!
     *  播放中
     */
    BCPlayStatus_Playing,
    /*!
     *  播放结束
     */
    BCPlayStatus_End
};

/*!
 *  相对UIWindowLevelStatusBar- 的层级
 */
typedef NS_ENUM(NSUInteger, BCWindowStatusType) {
    
    /*!
     *  普通
     */
    BCWindowStatusType_Nomal = 100,
    /*!
     *  插件
     */
    BCWindowStatusType_Plug = 90,
    /*!
     *  插件登录
     */
    BCWindowStatusType_Plug_Login = 80,
    /*!
     *  插件订购
     */
    BCWindowStatusType_Plug_Recharge = 79
};


/*!
 *  从哪里跳转订购
 */
typedef NS_ENUM(NSUInteger, BCPurchargeFromStatusType) {
    
    /*!
     *  默认
     */
    BCPurchargeFromStatusType_Default,
    /*!
     *  整本购买
     */
    BCPurchargeFromStatusType_All,
    /*!
     *  下载中
     */
    BCPurchargeFromStatusType_Down,
    /*!
     *  播放中
     */
    BCPurchargeFromStatusType_Play
};

/*!
 *  从哪里跳转登录
 */
typedef NS_ENUM(NSUInteger, BCLoginFromStatusType) {
    
    /*!
     *  默认
     */
    BCLoginFromStatusType_Default,
    /*!
     *  用户中心
     */
    BCLoginFromStatusType_UserZone,
    /*!
     *  下载中
     */
    BCLoginFromStatusType_Down,
    /*!
     *  播放中
     */
    BCLoginFromStatusType_Play,
    /*!
     *  其他
     */
    BCLoginFromStatusType_Other
};
