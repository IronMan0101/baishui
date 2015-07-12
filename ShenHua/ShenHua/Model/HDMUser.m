//
//  HDMUser.m
//  User
//
//  Created by Sea on 14-6-4.
//
//
#import "HDMUser.h"
#import "HDMClient.h"
//#import "HDMNetwork.h"
//#import "PCCommonDefines.h"
//#import "HDMFunction.h"


@interface HDMUser ()
{
    NSString * _CAPTCHA;
    
    NSString * _oldPassword;
    NSString * _newPassword;
}

@end

@implementation HDMUser

@synthesize user_time = _user_time;

//
//+ (instancetype)testInstance;{
//    
//    static HDMUser * instance = nil;
//    
//    static dispatch_once_t predicate;
//    dispatch_once(&predicate, ^{
//        
//        // 18250892641 55552222
//        instance = [[self alloc] initWithAttributes:@{@"account": @"13599501804", @"password": @"111000"}];
//    });
//    
//    return instance;
//}
//+ (void)clearUser
//{
//    NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"",@"binding_mobile",nil];
//    
//    [HDM_Current_User propertyWithAttributes:attributes];
//    [HDM_Current_User deleteModel];}
//
//+ (instancetype)user;{
//    
//    static HDMUser * user = nil;
//    
//    static dispatch_once_t predicate;
//    dispatch_once(&predicate, ^{
//        
//        user = [[self alloc] initWithAttributes:nil];
//        [user selectModel];
//        user.statusString = BCIntString(BCUserNone);
//    });
//    
//    return user;
//}
//
//- (void)launchImgGet_Success:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure
//{
//    [[HDMNetwork sharedInstance] query_picture_show_time_GET_Success:^(NSURLSessionDataTask *task, id responseObject){
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSString * url = [responseObject objectForKey:@"url"];
//        if(url.length>0)
//            HDM_Client.url = url;
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
//
//- (void)sendVCOfType:(NSString *)type Success:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [[HDMNetwork sharedInstance] new_send_message_to_get_vertification_code_GET_Mobile_num:[self encryptMobileNumber] Type:type Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
//
//- (void)sendForgetVCSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [self sendVCOfType:@"3" Success:success Failure:failure];
//}
//
//- (void)sendRegisterVCSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [self sendVCOfType:@"2" Success:success Failure:failure];
//}
//
//- (void)sendRechargeVCSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [self sendVCOfType:@"4" Success:success Failure:failure];
//}
//
//
//
//- (NSNumber *)modelTag {
//    
//    return [NSNumber numberWithInteger:1];
//}
//
//+ (NSDictionary *)databasePropertyMap;{
//    
//    return @{@"account": [NSNumber numberWithUnsignedInteger:BCData_NSString],
//             @"password": [NSNumber numberWithUnsignedInteger:BCData_NSString]};
//}
//
//
//
//
//- (NSString *)personaltureString;{
//    
//    NSString * personalture = self.signature;
//    if ([self.signature length]<1)
//    {
//        personalture = kDefaultPersonaltureText;
//    }
//    
//    return personalture;
//}
//
//- (void)setPersonaltureString:(NSString *)personaltureString {
//    
//    self.signature = personaltureString;
//}
//
//
//
//- (void)setCAPTCHAString:(NSString *)CAPTCHAString;{
//    
//    _CAPTCHA = CAPTCHAString;
//}
//
//
//
//- (NSString *)description;{
//    
//    NSMutableString * description = [NSMutableString string];
//    
//    [description appendFormat:@"%@: %@\n", @"account", self.account];
//    [description appendFormat:@"%@: %@\n", @"password", self.password];
//    [description appendFormat:@"%@: %@\n", @"status", [self UStatusString]];
//    return description;
//}
//
//- (NSString *)encryptCAPTCHA;{
//    
//    return [BCEncryption hisunAES128EncryptString:_CAPTCHA];
//}
//
//- (NSString *)encryptMobileNumber {
//    
//    if ((![self.mobile_num specialPureDigitalWithCapacity:10]) && [self.binding_mobile specialPureDigitalWithCapacity:10])
//    {
//        return [BCEncryption hisunAES128EncryptString:self.binding_mobile];
//    }
//    
//    return [BCEncryption hisunAES128EncryptString:self.mobile_num];
//}
//
//- (NSString *)encryptAccount;{
//    
//    return [BCEncryption hisunAES128EncryptString:self.account];
//}
//
//- (NSString *)encryptEmail;{
//    
//    return [BCEncryption hisunAES128EncryptString:self.email];
//}
//
//
//- (NSString *)encryptPassword {
//    
//    return [BCEncryption hisunAES128EncryptString:self.password];
//}
//
//
//
//- (void)setUser_time:(NSString *)user_time {
//    
//    _user_time = user_time;
//    
//    NSData * bytesData = [NSData bc_bytesDataFromHexString:user_time];
//    NSData * decryptData = [bytesData BC_AES128Decrypt:YES withPassword:[@"ABCDEFGHIJKLMNOP" UTF8String]];
//    
//    NSArray * array = [[[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding] componentsSeparatedByString:@"##"];
//    if (array.count==3) {
//        
//        NSString *serverTime = [array objectAtIndex:0];
//        NSString *localtime = [[NSDate date] bc_microsecondTimeIntervalSince1970];
//        NSNumber *jetLag = [NSNumber numberWithLongLong:(serverTime.longLongValue-localtime.longLongValue)];
//        
//        [BCNetwork setCurrentUserID:[array objectAtIndex:1]];
//        [BCNetwork setRandomKey:[array objectAtIndex:2]];
//        [BCNetwork setJetLag:jetLag];
//        [BCNetwork setFlag:[NSNumber numberWithBool:NO]];
//        
//        [HDMFunction logNeedInfomation:@{@"type": @"1",
//                                         @"value": self.mobile_num}];
//    }
//}
//
//
//#pragma mark - Method -
//
///*!
// *  用户登录
// *
// *  @param success <#success description#>
// *  @param failure <#failure description#>
// */
//- (void)loginSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
//    
//    self.statusString = BCIntString(BCUserWait);
//    [[HDMNetwork sharedInstance] user_login_from_huawei_POST_Mobile_num:[self encryptAccount] Password:[self encryptPassword] Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSString * jf_hint = [responseObject objectForKey:@"jf_hint"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg",jf_hint,@"jf_hint", nil];
//        
//        if (![code boolValue])
//        {
//            NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:
//                                                [responseObject objectForKey:@"user_info"]];//修改一处
//            [self propertyWithAttributes:attributes];
//            self.statusString = BCIntString(BCUserOnline);
//            [self updateModel];
//            
//            NSMutableDictionary * client_attributes = [NSMutableDictionary dictionaryWithDictionary:
//                                                       [responseObject objectForKey:@"bracket_info"]];//修改一处
//            [HDM_Client propertyWithAttributes:client_attributes];
//            [HDM_Client setAlertCount:@"0"];
//            [HDM_Client updateModel];
//            
//            success(codeMsg);
//            if(self.fromStatusType != BCLoginFromStatusType_UserZone)
//            {
//                if([jf_hint length] >0)
//                    [MBProgressHUD showHudForJifenHint:jf_hint Message:msg];
//                else
//                    [MBProgressHUD showHudMsgWithKeyWindow:msg];
//            }
//            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_LOGIN_SUCCESS object:self];
//        }
//        else
//        {
//            BOOL need_activation = [[responseObject objectForKey:@"need_activation"] boolValue];
//            if (need_activation)
//            {
//                NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:
//                                          [NSNumber numberWithUnsignedInteger:BCCode_Activate],@"code", msg,@"msg", nil];
//                failure(codeMsg);
//            }
//            else
//            {
//                failure(codeMsg);
//            }
//            
//            self.statusString = BCIntString(BCUserNone);
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"BCUserLoginFail" object:self];
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//        
//        self.statusString = BCIntString(BCUserNone);
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"BCUserLoginFail" object:self];
//    }];
//}
//
//
//- (void)syncLoginSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//    
//    [HDMNetwork sharedInstance].completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    [self loginSuccess:^(NSDictionary *codeMsg) {
//        
//        NSLog(@"ing");
//        success(codeMsg);
//        dispatch_semaphore_signal(semaphore);
//    } Failure:^(NSDictionary *codeMsg) {
//        
//        NSLog(@"ing");
//        failure(codeMsg);
//        dispatch_semaphore_signal(semaphore);
//    }];
//    
//    NSLog(@"before");
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//    NSLog(@"after");
//    [HDMNetwork sharedInstance].completionQueue = NULL;
//}
//
///*!
// *  用户注销
// *
// *  @param success <#success description#>
// *  @param failure <#failure description#>
// */
//- (void)logoutSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    self.binding_mobile = nil;
//    
//    [self deleteModel];
//    [self propertyWithAttributes:nil];
//    
//    self.statusString = BCIntString(BCUserOffline);
//    success(nil);
//    
//    [BCNetwork setCurrentUserID:nil];
//    [BCNetwork setRandomKey:nil];
//    [BCNetwork setJetLag:nil];
//    [BCNetwork setFlag:nil];
//}
//
//
///*!
// *  找回密码（邮箱方式）
// *
// *  @param success <#success description#>
// *  @param failure <#failure description#>
// */
//- (void)forgetEmailSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [[HDMNetwork sharedInstance] mail_forget_password_POST_Mobile:[self encryptEmail] Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
///*!
// *  发送邮件
// *
// *  @param success <#success description#>
// *  @param failure <#failure description#>
// */
//- (void)sendEmailSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [[HDMNetwork sharedInstance] send_activation_email_POST_Email:[self UEmail] AndType:@"1" Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
//
///*!
// *  找回密码（移动手机号方式）
// *
// *  @param success <#success description#>
// *  @param failure <#failure description#>
// */
//- (void)forgetPhoneSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [[HDMNetwork sharedInstance] forget_password_POST_Moblie:[self encryptMobileNumber] New_password:[self encryptPassword] Validate_code:[self encryptCAPTCHA] Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
//
//
///*!
// *  用户注册（邮箱方式）
// *
// *  @param success <#success description#>
// *  @param failure <#failure description#>
// */
//- (void)registerEmailSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [[HDMNetwork sharedInstance] register_mail_POST_Mobile:[self encryptEmail] New_password:[self encryptPassword] Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
//
//
///*!
// *  用户注册（移动手机号方式）
// *
// *  @param success <#success description#>
// *  @param failure <#failure description#>
// */
//- (void)registerPhoneSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [[HDMNetwork sharedInstance] register_user_POST_Moblie:[self encryptMobileNumber] New_password:[self encryptPassword] Validate_code:_CAPTCHA Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
//
//
///*!
// *  获取用户信息
// *
// *  @param success <#success description#>
// *  @param failure <#failure description#>
// */
//- (void)detailSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//}
//
//
///*!
// *  更新用户信息
// *
// *  @param success <#success description#>
// *  @param failure <#failure description#>
// */
//- (void)updateSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
//    
//    NSString * nick_name = nil;
//    if ([self.nick_name length]==0)
//    {
//        nick_name = @"";
//    }
//    else
//    {
//        nick_name = self.nick_name;
//    }
//    
//    NSString * signature = nil;
//    if ([self.signature length]==0)
//    {
//        signature = @"";
//    }
//    else
//    {
//        signature = self.signature;
//    }
//    
//    [[HDMNetwork sharedInstance] user_updateInfo_POST_Nick_name:nick_name Sex:self.sex Signature:signature Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
//
//
///*!
// *  更改用户密码
// *
// *  @param success <#success description#>
// *  @param failure <#failure description#>
// */
//- (void)changeSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
//    
//    [[HDMNetwork sharedInstance] change_password_POST_Old_password:
//     [BCEncryption hisunAES128EncryptString:[self UOldPassword]] new_password:
//     [BCEncryption hisunAES128EncryptString:[self UNewPassword]] Success:^(NSURLSessionDataTask *task, id responseObject) {
//         
//         NSString * msg = [responseObject objectForKey:@"msg"];
//         NSString * code = [responseObject objectForKey:@"code"];
//         NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//         
//         if (![code boolValue])
//         {
//             success(codeMsg);
//         }
//         else
//         {
//             failure(codeMsg);
//         }
//     } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//         
//         //failure([BCAlertText networkErrorDictionary:error]);
//     }];
//}
//
//
//- (void)bindPhoneCAPTCHASuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;{
//    
//    [[HDMNetwork sharedInstance] new_send_message_to_get_vertification_code_GET_Mobile_num:[self encryptMobileNumber] Type:@"5" Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
//
//
//- (void)bindPhoneSuccess:(void (^)(NSDictionary *codeMsg))success
//                 Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [[HDMNetwork sharedInstance] binding_mobile_POST_Mobile:[self encryptMobileNumber] Validate_code:_CAPTCHA Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            self.binding_mobile = self.mobile_num;
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
//
//- (void)unbindPhoneSuccess:(void (^)(NSDictionary *codeMsg))success
//                   Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [[HDMNetwork sharedInstance] unbinding_mobile_POST_Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
//
//
//#pragma mark - Setter/Getter Method -
//
//- (NSString *)getMobile
//{
//    NSString *moblie;
//    if ((![self.mobile_num specialPureDigitalWithCapacity:10]) && [self.binding_mobile specialPureDigitalWithCapacity:10])
//    {
//        return self.binding_mobile;
//    }
//    else if([self.mobile_num specialPureDigitalWithCapacity:10])
//    {
//        return self.mobile_num;
//    }
//    return moblie;
//}
//- (NSString *)getEmail
//{
//    NSString *email;
//    if(![self.mobile_num specialPureDigitalWithCapacity:10])
//    {
//        return self.mobile_num;
//    }
//    return email;
//}
//
///*!
// *  用户性别
// *
// *  @return
// */
//- (BCSex)USex;{
//    
//    return [self.sex intValue];
//}
//
//- (BCSex)USex:(BCSex)USex;{
//    
//    self.sex = BCIntString(USex);
//    
//    return USex;
//}
//
//
///*!
// *  用户性别
// *
// *  @return
// */
//- (NSString *)USexString;{
//    
//    NSString * USexString = nil;
//    switch ([self USex]) {
//        case BCSexFemale:
//        {
//            USexString = @"白富美";
//        }break;
//            
//        case BCSexMale:
//        {
//            USexString = @"高富帅";
//        }break;
//            
//        default:
//        {
//            USexString = @"不明生物";
//        }break;
//    }
//    return USexString;
//}
//
//- (NSString *)USexString:(NSString *)USexString;{
//    
//    return USexString;
//}
//
//
///*!
// *  用户状态
// *
// *  @return
// */
//- (NSString *)UStatusString;{
//    
//    NSString * UStatusString = nil;
//    
//    switch ([self.statusString intValue]) {
//        case BCUserNone:
//        {
//            UStatusString = @"游客登录";
//        }break;
//            
//        case BCUserOnline:
//        {
//            UStatusString = @"用户在线";
//        }break;
//            
//        case BCUserOffline:
//        {
//            UStatusString = @"用户注销";
//        }break;
//            
//        default:
//            break;
//    }
//    
//    return UStatusString;
//}
//
//- (NSString *)UStatusString:(NSString *)UStatusString;{
//    
//    return UStatusString;
//}
//
//
///*!
// *  用户账号
// *
// *  @return
// */
//- (NSString *)UAccount;{
//    
//    NSString * UAccount = self.account;
//    
//    if ([UAccount specialPureDigitalWithCapacity:10])
//    {
//        self.mobile_num = UAccount;
//    }
//    else if ([UAccount validateEmail])
//    {
//        self.email = UAccount;
//    }
//    
//    return UAccount;
//}
//
//- (NSUInteger)UAccount:(NSString *)UAccount;{
//    
//    self.account = UAccount;
//    
//    if ([UAccount specialPureDigitalWithCapacity:10])
//    {
//        self.mobile_num = UAccount;
//        if ([self.statusString  integerValue]!=BCUserOnline)
//        {
//            self.email = nil;
//        }
//        
//        return BCUserPhoneAccountType;
//    }
//    else if ([UAccount validateEmail])
//    {
//        self.email = UAccount;
//        if ([self.statusString  integerValue]!=BCUserOnline)
//        {
//            self.mobile_num = nil;
//        }
//        
//        return BCUserEmailAccountType;
//    }
//    
//    return BCUserNoneAccountType;
//}
//
//
///*!
// *  用户邮箱
// *
// *  @return
// */
//- (NSString *)UEmail;{
//    
//    return self.email;
//}
//
//- (NSString *)UEmail:(NSString *)UEmail;{
//    
//    self.email = UEmail;
//    return UEmail;
//}
//
//
///*!
// *  用户昵称
// *
// *  @return
// */
//- (NSString *)UNicknameDefault{
//    
//    NSString * UNickname = self.nick_name;
//    if ([self.nick_name length]<1)
//    {
//        UNickname = @"请输入昵称";
//    }
//    return UNickname;
//}
//- (NSString *)UNickname;{
//    
//    NSString * UNickname = self.nick_name;
//    if ([self.nick_name length]<1)
//    {
//        UNickname = @"";
//    }
//    return UNickname;
//}
//
//- (NSString *)UNickname:(NSString *)UNickname;{
//    
//    self.nick_name = UNickname;
//    return UNickname;
//}
//
//
///*!
// *  用户手机号
// *
// *  @return
// */
//- (NSString *)UPhone;{
//    return self.mobile_num;
//}
//
//- (NSString *)UPhone:(NSString *)UPhone;{
//
//    self.mobile_num = UPhone;
//    return UPhone;
//}
//
//
///*!
// *  用户使用旧密码
// *
// *  @return
// */
//- (NSString *)UOldPassword;{
//    
//    return _oldPassword;
//}
//
//- (NSString *)UOldPassword:(NSString *)UOldPassword;{
//    
//    _oldPassword = UOldPassword;
//    
//    return _oldPassword;
//}
//
//
///*!
// *  用户使用新密码
// *
// *  @return
// */
//- (NSString *)UNewPassword;{
//    
//    return _newPassword;
//}
//
//- (NSString *)UNewPassword:(NSString *)UNewPassword;{
//    _newPassword = UNewPassword;
//    
//    return _newPassword;
//}


@end
