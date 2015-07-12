
#import <Foundation/Foundation.h>

#define HDM_Current_User [HDMUser user]

typedef NS_ENUM(NSUInteger, BCUserAccountType) {
    
    BCUserNoneAccountType,
    BCUserEmailAccountType,
    BCUserPhoneAccountType,
};

//登录成功采用通知方式：通知名称为：BCUserHasLoginSucceed

/*!
 *  <#Description#>
 */
@interface HDMUser : BCModel
{
    NSString * _user_time;//表明实现了Setter/Getter方法(@property)
}

#pragma mark - HDMUser Property

/*!
 *
 * 跟android平台不一样
 */
@property (nonatomic, copy) NSString * user_time;
@property (nonatomic, assign) BCLoginFromStatusType fromStatusType;
/*!
 * 手机号
 */
@property (nonatomic, copy) NSString * mobile_num;

@property (nonatomic, copy) NSString * account;


/*!
 * 密码
 */
@property (nonatomic, copy) NSString * password;

@property (nonatomic, copy) NSString * newingPassword;//new是关键字（X: newPassword: password上）

@property (nonatomic, copy) NSString * city;
@property (nonatomic, copy) NSString * province_id;
@property (nonatomic, copy) NSString * province_name;

@property (nonatomic, copy) NSString * sex;
@property (nonatomic, copy) NSString * constellation;
@property (nonatomic, copy) NSString * nick_name;

@property (nonatomic, copy) NSString * birthday;
@property (nonatomic, copy) NSString * email;
@property (nonatomic, copy) NSString * signature;

@property (nonatomic, copy) NSString * login_times;
@property (nonatomic, copy) NSString * user_thum_url;

/*!
 *  用户状态(参考BCUserStatus)
 */
@property (nonatomic, copy) NSString * statusString;


@property (nonatomic, copy) NSString * personaltureString;
@property (nonatomic, copy) NSString * login_tag;

@property (nonatomic, copy) NSString * binding_mobile;
@property (nonatomic, copy) NSString * binding_rule;

/*!
 *  操作提示
 */
@property (nonatomic, copy) NSString * tip_operation;
@property (nonatomic, copy) NSAttributedString * tip_Attributoperation;

/*!
 *  <#Description#>
 */
+ (instancetype)user;
+ (void)clearUser;


- (void)sendForgetVCSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;
- (void)sendRegisterVCSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;
- (void)sendRechargeVCSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;
- (void)launchImgGet_Success:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;







- (void)setCAPTCHAString:(NSString *)CAPTCHAString;



#pragma mark - Method -

/*!
 *  用户登录
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)loginSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

- (void)syncLoginSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;
/*!
 *  用户注销
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)logoutSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;


/*!
 *  找回密码（邮箱方式）
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)forgetEmailSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

/*!
 *  发送邮件
 * type 1：激活链接  2：重置密码链接
 *
 */
- (void)sendEmailSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;
/*!
 *  找回密码（移动手机号方式）
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)forgetPhoneSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;


/*!
 *  用户注册（邮箱方式）
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)registerEmailSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;


/*!
 *  用户注册（移动手机号方式）
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)registerPhoneSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;


/*!
 *  获取用户信息
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)detailSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;


/*!
 *  更新用户信息
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)updateSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;


/*!
 *  更改用户密码
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)changeSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;


/*!
 *  邮箱账号绑定手机号码界面--获取验证码
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)bindPhoneCAPTCHASuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;

/*!
 *  邮箱账号绑定手机号码界面--绑定手机号
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)bindPhoneSuccess:(void (^)(NSDictionary *codeMsg))success
                 Failure:(void (^)(NSDictionary *codeMsg))failure;

/*!
 *  邮箱账号绑定手机号码界面--绑定手机号
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)unbindPhoneSuccess:(void (^)(NSDictionary *codeMsg))success
                   Failure:(void (^)(NSDictionary *codeMsg))failure;


#pragma mark - Setter/Getter Method -

/*!
 *  用户性别
 *
 *  @return
 */
- (BCSex)USex;
- (BCSex)USex:(BCSex)USex;

/*!
 *  用户性别
 *
 *  @return
 */
- (NSString *)USexString;
- (NSString *)USexString:(NSString *)USexString;

/*!
 *  用户状态
 *
 *  @return
 */
- (NSString *)UStatusString;
- (NSString *)UStatusString:(NSString *)UStatusString;

/*!
 *  用户账号
 *
 *  @return
 */
- (NSString *)UAccount;
- (NSUInteger)UAccount:(NSString *)UAccount;

/*!
 *  用户邮箱
 *
 *  @return
 */
- (NSString *)UEmail;
- (NSString *)UEmail:(NSString *)UEmail;

/*!
 *  用户昵称
 *
 *  @return
 */
- (NSString *)UNickname;
- (NSString *)UNicknameDefault; //有默认文字
- (NSString *)UNickname:(NSString *)UNickname;

/*!
 *  用户手机号
 *
 *  @return
 */
- (NSString *)UPhone;
- (NSString *)UPhone:(NSString *)UPhone;

/*!
 *  用户使用旧密码
 *
 *  @return
 */
- (NSString *)UOldPassword;
- (NSString *)UOldPassword:(NSString *)UOldPassword;

/*!
 *  用户使用新密码
 *
 *  @return
 */
- (NSString *)UNewPassword;
- (NSString *)UNewPassword:(NSString *)UNewPassword;

- (NSString *)getMobile;
- (NSString *)getEmail;
@end
