//
//  HDMClient.m
//  User
//
//  Created by Sea on 14-6-4.
//
//

#import <CoreText/CoreText.h>
#import "HDMNetwork.h"
#import "HDMClient.h"

//#import "HDMFunction.h"
#import "PCCommonDefines.h"
//#import "HDMDownloadProductManager.h"







@interface HDMClient ()<UIAlertViewDelegate>
{
    UIImage * _VCPImage;
    NSString * _VCPResult;
}

@end

@implementation HDMClient

@synthesize isAutoLogin = _isAutoLogin;
@synthesize update_type = _update_type;
@synthesize upd_des = _upd_des;


+ (instancetype)testInstance;{
    
    static HDMClient * instance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        
        instance = [[self alloc] initWithAttributes:@{@"isAutoLogin": @"1",
                                                      @"DHWatchQuality": @"2",
                                                      @"DHDownloadQuality": @"1",
                                                      @"isPromptWhenDownload": @"0",
                                                      @"isPromptWhenUseWLanNetwork": @"1",
                                                      @"MCQuitClearCache": @"0"}];
    });
    
    return instance;
}


+ (instancetype)client;{
    
    static HDMClient * client = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        
        
        client = [[self alloc] initWithAttributes:@{@"isAutoLogin": @"1",
                                                    @"isPromptWhenDownload": @"1",
                                                    @"isPromptWhenUseWLanNetwork": @"1",
                                                    @"MCQuitClearCache": @"0"}];
        
      //  [client selectModel];
    });
    
    return client;
}


- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    if (self = [super initWithAttributes:attributes])
    {
        _cacheObserver = [[NSNotificationCenter defaultCenter] addObserverForName:N_DeleteCacheSuccess object:nil queue:nil usingBlock:^(NSNotification *note) {
            
            self.reloadRequest = YES;
        }];
    }
    
    return self;
}


- (void)dealloc;{
    
    [[NSNotificationCenter defaultCenter] removeObserver:_cacheObserver];
}


- (void)vertificationCodePicture:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
    
    [[HDMNetwork sharedInstance] get_picture_vertification_code_GET_Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSData * imageData = [[NSData alloc] initWithBase64EncodedString:[responseObject objectForKey:@"vimg"] options:0];
            _VCPImage = [UIImage imageWithData:imageData];
            _VCPResult = [responseObject objectForKey:@"vcode"];
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}

- (void)updateRatioSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] query_jifen_exchange_strategy_GET_Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            self.ratio = [responseObject objectForKey:@"rate"];
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}

- (void)querySystemVariableSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] query_system_remark_GET_Type:@"1" Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg0 = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        if (![code boolValue])
        {
            self.creditText = [[responseObject objectForKey:@"info"] objectForKey:@"value"];
            //[self bc_save];
            [[HDMNetwork sharedInstance] query_system_remark_GET_Type:@"2" Success:^(NSURLSessionDataTask *task, id responseObject) {
                NSString * msg = [responseObject objectForKey:@"msg"];
                NSString * code = [responseObject objectForKey:@"code"];
                NSDictionary * codeMsg1 = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
                if (![code boolValue])
                {
                    self.currencyText = [[responseObject objectForKey:@"info"] objectForKey:@"value"];
                    //[self bc_save];
                    success(codeMsg1);
                }
                else
                {
                    failure(codeMsg1);
                }
            } Failure:^(NSURLSessionDataTask *task, NSError *error) {
                
                //failure([BCAlertText networkErrorDictionary:error]);
            }];
        }
        else
        {
            failure(codeMsg0);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}



- (void)clientLoginSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] query_anonymous_id_POST_Anonymous_id:@"" Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}





- (void)checkClientSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    static BOOL result = NO;
    if (!result)
    {
        result = YES;
        
        [[HDMNetwork sharedInstance] query_client_GET_Success:^(NSURLSessionDataTask *task, id responseObject) {
            
            result = NO;
            NSString * msg = [responseObject objectForKey:@"msg"];
            NSString * code = [responseObject objectForKey:@"code"];
            NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
            
            if (![code boolValue])
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:
                                                    [responseObject objectForKey:@"bracket_info"]];//修改一处
                [self propertyWithAttributes:attributes];
                _isCheck = YES;
                [self showAlertViewInCondition:HDMAlertViewInCheck];
                success(codeMsg);
            }
            else
            {
                failure(codeMsg);
            }
        } Failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            result = NO;
            //failure([BCAlertText networkErrorDictionary:error]);
        }];
    }
}


#pragma mark - Setter/Getter

- (NSNumber *)modelTag {
    
    return [NSNumber numberWithInteger:1];
}

-(NSString *)isAutoLogin {
    
    return _isAutoLogin;
}

- (void)setIsAutoLogin:(NSString *)isAutoLogin {
    
    _isAutoLogin = isAutoLogin;
    //[self save];
}



- (BCMediaQuality)WatchQuality;{
    
    int WatchQuality = [self.DHWatchQuality intValue];
    
    switch (WatchQuality)
    {
        case BCMediaClearQuality:
        {
            return 1;
        }break;
            
        case BCMediaFlowQuality:
        {
            return 0;
        }break;
            
        default:
        {
//            if ([[BCEngine sharedInstance] networkType]==BCReachableViaWWAN && [[HDM_Client isPromptWhenUseWLanNetwork] boolValue])
//            {
//                return 0;
//            }
            
            return 1;
        }break;
    }
    return WatchQuality;
}
- (BCMediaQuality)WatchQuality:(BCMediaQuality)WatchQuality;{
    
    return WatchQuality;
}


- (BCMediaQuality)DownloadQuality;{
    
    int DownloadQuality = [self.DHDownloadQuality intValue];
    
    switch (DownloadQuality)
    {
        case BCMediaClearQuality:
        {
            return 1;
        }break;
            
        case BCMediaFlowQuality:
        {
            return 0;
        }break;
            
        default:
        {
//            if ([[BCEngine sharedInstance] networkType]==BCReachableViaWWAN && [[HDM_Client isPromptWhenUseWLanNetwork] boolValue])
//            {
//                return 0;
//            }
            
            return 1;
        }break;
    }
    return DownloadQuality;
    
    return 1;
}
- (BCMediaQuality)DownloadQuality:(BCMediaQuality)DownloadQuality;{
    
    return DownloadQuality;
}


- (UIImage *)vertificationCodePictureImage;{
    
    return _VCPImage;
}

- (NSString *)vertificationCodeResult;{
    
    return _VCPResult;
}


//#pragma mark - update -
//
//- (void)showAlertViewInCondition:(HDMAlertViewCondition)condition;{
//    
//    BOOL prompted = [[[NSUserDefaults standardUserDefaults] valueForKey:@"HDMNotPrompt"] boolValue];
//    if (!_isCheck && prompted && ([self.update_type integerValue]!=2))
//    {
//        return;
//    }
//    _isCheck = NO;
//    if (condition!=HDMAlertViewInCheck && [self.alertCount integerValue]!=0)
//    {
//        return;
//    }
//    
//    switch ([self.update_type integerValue])
//    {
//        case 0://最新版本
//        {
////            if (condition==HDMAlertViewInCheck)
////            {
////                //20150128
//////                [BCProgressHUD showImage:nil status:@"已经是最新版本"];
////                [MBProgressHUD showHudMsg:@"已经是最新版本"];
////            }
////            else
////            {
////                [[HDMDownloadProductManager sharedInstance] checkDownloadWhenLaunch];
////                _isCheck = YES;
////                return;
////            }
////        }break;
////            
////        case 1://非强制升级
////        {
////            if (condition==HDMAlertViewInCheck)
////            {
////                BCAlertView * av = [[BCAlertView alloc] initWithNibName:@"HDMAlertView02"];
////                av.messageTextView.text = [self messageText];
////                [av.leftButton setTitle:@"忽略" forState:UIControlStateNormal];
////                [av.leftButton setTitle:@"忽略" forState:UIControlStateHighlighted];
////                av.delegate = self;
////                [av show];
////            }
////            else
////            {
////                BCAlertView * av = [[BCAlertView alloc] initWithNibName:@"HDMAlertView"];
////                av.messageTextView.text = [self messageText];
////                av.delegate = self;
////                [av show];
////            }
////        }break;
////            
////        case 2:
////        {
////            BCAlertView * av = [[BCAlertView alloc] initWithNibName:@"HDMAlertView02"];
////            av.messageTextView.text = [self messageText];
////            av.delegate = self;
////            [av show];
////        }break;
//            
//        default:
//            break;
//    }
//    
//    self.alertCount = @"1";
//}

//- (void)setUpdate_type:(NSString *)update_type{
//    
//  //  _update_type = update_type;
//}

//- (NSString *)messageText;{
//    
////    NSMutableString * messageText = [NSMutableString stringWithFormat:@"最新版本：和动漫%@\n", self.version];
////    [messageText appendFormat:@"大小：%@\n", self.upd_size];
////    [messageText appendFormat:@"更新说明：\n%@", self.upd_des];
////    
////    [messageText replaceOccurrencesOfString:@"<p>" withString:@""
////                                    options:NSCaseInsensitiveSearch range:NSMakeRange(0, [messageText length])];
////    
////    [messageText replaceOccurrencesOfString:@"</p>" withString:@"\n"
////                                    options:NSCaseInsensitiveSearch range:NSMakeRange(0, [messageText length])];
////    
////    return messageText;
//    return @"";
//}


//- (void)customIOS7dialogButtonTouchUpInside: (BCCustomIOS7AlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
//{
//    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
//    [alertView close];
//}


//- (UIView *)createDemoView
//{
//    UIWebView *demoView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 290, 200)];
//    [demoView loadHTMLString:self.upd_des baseURL:nil];
//    
//    return demoView;
//}


//- (void)setUpd_des:(NSString *)upd_des;{
//    
//    NSMutableString * string = [NSMutableString stringWithFormat:@"%@",upd_des];
//
//    [string replaceOccurrencesOfString:@"<p>" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [string length])];
//
//    [string replaceOccurrencesOfString:@"</p>" withString:@"\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [string length])];
//    
////    NSMutableAttributedString * attriString = [[NSMutableAttributedString alloc] initWithString:string];
////    [attriString addAttribute:(NSString *)kCTForegroundColorAttributeName
////                        value:(id)[UIColor redColor].CGColor
////                        range:NSMakeRange(0, 4)];
//    
//    _upd_des = string;
//}
//
////- (void)willPresentAlertView:(UIAlertView *)alertView{
////    NSLog(@"alertView.subviews::%@", alertView.subviews);
////    UIView * view = [alertView.subviews objectAtIndex:0];
////    if([view isKindOfClass:[UILabel class]]){
////        UILabel* label = (UILabel*) view;
////        [label setUserInteractionEnabled:YES];
////        label.textAlignment = NSTextAlignmentLeft;
////    }
////}
//
//- (NSString *)upd_des;{
//    
//    return _upd_des;
//}
//
//- (void)checkDownloadWhenLaunch {
//    
//    [[HDMDownloadProductManager sharedInstance] checkDownloadWhenLaunch];
//}

//- (void)setUserTime:(NSString *)userTime {
//    
//    if ([userTime length]==0)
//    {
//        return;
//    }
//    
//    NSData * bytesData = [NSData bc_bytesDataFromHexString:userTime];
//    NSData * decryptData = [bytesData BC_AES128Decrypt:YES withPassword:[@"ABCDEFGHIJKLMNOP" UTF8String]];
//    
//    userTime = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
//    
//    NSArray * array = [userTime componentsSeparatedByString:@"##"];
//    
//    if (array.count==3)
//    {
//        [HDMFunction logNeedInfomation:@{@"type": @"0",
//                                         @"value": [array objectAtIndex:1]}];
//    }
//}


//- (void)bc_alertView:(BCAlertView *)alertView clickedButtonAtIndex:(BCButtonIndex)buttonIndex;{
//    
//    switch (buttonIndex) {
//        case BCRightButton://升级
//        {
//            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:self.load_url]])
//            {
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.load_url]];
//            }
//            
//            exit(0);
//        }break;
//            
//        case BCMiddleButton:
//        {
//            [NSUserDefaults bc_setObject:[NSNumber numberWithBool:YES] forKey:@"HDMNotPrompt"];
//            
//            [self performSelector:@selector(checkDownloadWhenLaunch) withObject:self afterDelay:0.6f];
//        }break;
//            
//        case BCLeftButton:
//        {
//            if ([self.update_type integerValue]==2)
//            {
//                exit(0);
//            }
//            else
//            {
//                [self performSelector:@selector(checkDownloadWhenLaunch) withObject:self afterDelay:0.8f];
//            }
//        }break;
//            
//        default:
//            break;
//    }
//}


//+ (NSDictionary *)databasePropertyMap;{
//    
////    //return @{@"url": [NSNumber numberWithUnsignedInteger:BCData_NSString],
////             @"time": [NSNumber numberWithUnsignedInteger:BCData_NSString],
////             @"isAutoLogin": [NSNumber numberWithUnsignedInteger:BCData_NSString],
////             @"isPromptWhenDownload": [NSNumber numberWithUnsignedInteger:BCData_NSString],
////             @"isPromptWhenUseWLanNetwork": [NSNumber numberWithUnsignedInteger:BCData_NSString],
////             @"DHWatchQuality": [NSNumber numberWithUnsignedInteger:BCData_NSString],
////             @"DHDownloadQuality": [NSNumber numberWithUnsignedInteger:BCData_NSString],
////             @"MCQuitClearCache": [NSNumber numberWithUnsignedInteger:BCData_NSString]};
//    return nil;
//}



@end

