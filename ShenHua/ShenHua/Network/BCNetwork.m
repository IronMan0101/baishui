//
//  BCNetwork.m
//  
//
//  Created by Sea on 14-5-23.
//
//

#import "BCNetwork.h"
//#import "BCCommon.h"
#import "BCConfigure.h"
#import "BCEncryption.h"
#import "NSData+BCCategory.h"
#import "NSDate+BCCategory.h"
//#import "NSData+AFGodzippa.h"
#import "AFSecurityPolicy.h"


static NSString *CurrentClientID = nil;
static NSString *CurrentUserID = nil;
static NSString *ServerTime = nil;
static NSString *RandomKey = nil;
static NSNumber *JetLag = nil;
static NSNumber *Flag = nil;


@implementation BCNetwork


#pragma mark - Server Veriable

+ (void)setCurrentUserID:(NSString *)currentUserID {
    
//    if (!currentUserID)
//    {
//        currentUserID = CurrentClientID;
//    }
//    else
//    {
//        CurrentUserID = currentUserID;
//    }
    CurrentUserID = currentUserID;
    
    NSLog(@"CurrentUserID: %@", CurrentUserID);
}

+ (NSString *)currentUserID;{
    
    return CurrentUserID;
}

+ (void)setRandomKey:(NSString *)randomKey {
    
    RandomKey = randomKey;
    NSLog(@"RandomKey: %@", RandomKey);
}


+ (NSString *)ServerTime;{
    
    return ServerTime;
}

+ (void)setServerTime:(NSString *)serverTime;{
    
    ServerTime = serverTime;
}

+ (void)setJetLag:(NSNumber *)jetLag {
    
    JetLag = jetLag;
    NSLog(@"JetLag: %@", JetLag);
}

+ (void)setFlag:(NSNumber *)flag;{
    
    Flag = flag;
    NSLog(@"Flag: %@", Flag);
}


#pragma mark - Server Init


- (instancetype)init {
    
    self = [super initWithBaseURL:[NSURL URLWithString:[BCConfigure kBaseURLString]]];
    if (self)
    {
        self.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    }
    
    return self;
}

- (BOOL)setUserTime:(NSString *)userTime {
    
    if ([userTime length]==0)
    {
        return NO;
    }
    
    NSData * bytesData = [NSData bc_bytesDataFromHexString:userTime];
    NSData * decryptData = [bytesData BC_AES128Decrypt:YES withPassword:[@"ABCDEFGHIJKLMNOP" UTF8String]];
    
    userTime = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    
    NSArray * array = [userTime componentsSeparatedByString:@"##"];
    
    if (array.count==3)
    {
        [BCNetwork setFlag:[NSNumber numberWithBool:YES]];
        
        [BCNetwork setCurrentUserID:[array objectAtIndex:1]];
        CurrentClientID = [array objectAtIndex:1];
        
        NSString * localtime = [[NSDate date] bc_microsecondTimeIntervalSince1970];
        NSString * serverTime = [array objectAtIndex:0];
        [BCNetwork setServerTime:serverTime];
        
        NSNumber *jetLag = [NSNumber numberWithLongLong:(serverTime.longLongValue-localtime.longLongValue)];
        [BCNetwork setJetLag:jetLag];
        
        [BCNetwork setRandomKey:[array objectAtIndex:2]];
    }
    else {
        return NO;
    }
    
    return YES;
}

- (void)setClientInitParameter:(NSDictionary *)parameter {
    
    
}

- (void)InitAPIServerSuccess:(NetworkSuccessBlock)Success Failure:(NetworkFailureBlock)Failure {
    
    NSString * baseURL = [NSString stringWithFormat:@"%@%@", @"query_anonymous_id", [BCConfigure kHTTPURLSuffix]];
    
    [self POST:baseURL header:[self networkHTTPHeader] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString * code = [responseObject valueForKey:@"code"];
        if (code.integerValue==0)
        {
            NSString * user_time = [[responseObject valueForKeyPath:@"user_info"] objectForKey:@"user_time"];
            if ([self setUserTime:user_time])
            {
                Success(task, responseObject);
            }
            else
            {
                Failure(task, nil);
            }
            
            [self setClientInitParameter:responseObject];
        }
        else {
            Failure(task, nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        Failure(task, error);
    }];
}


#pragma mark - Server Method

- (void)APIName_Method:(BCHTTPMethod)Method APIParameters:(NSArray *)APIParameters {
    
    BOOL condition = [CurrentUserID length] && [RandomKey length] && (JetLag!=nil);
    if (!condition) {
        
        [self InitAPIServerSuccess:^(NSURLSessionDataTask *task, id responseObject) {
            
            if ([[APIParameters firstObject] isEqualToString:@"query_anonymous_id"])
            {
                NetworkSuccessBlock successBlock = [APIParameters objectAtIndex:([APIParameters count]-2)];
                successBlock(task, responseObject);
            }
            else
            {
                [self APIName_Method:Method APIParameters:APIParameters];
            }
        } Failure:^(NSURLSessionDataTask *task, NSError *error) {
            NetworkFailureBlock failureBlock = [APIParameters lastObject];
            failureBlock(task, error);
        }];
    }
    else
    {
        int i = 0;
        
        NSString * baseURL = [NSString stringWithFormat:@"%@%@", [APIParameters objectAtIndex:i], [BCConfigure kHTTPURLSuffix]]; i++;
        
        NSDictionary * parameters = [APIParameters objectAtIndex:i];
        i++;
        
        switch ([APIParameters count])
        {
            case 3://parameters
            {
                parameters = nil;i--;
            }break;
                
            case 4://normal
            {
                
            }break;
                
            default:
                break;
        }
        
        switch (Method)
        {
            case BCGET:
            {
                [self GET:baseURL header:[self networkHTTPHeader] parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                    NetworkSuccessBlock successBlock = [APIParameters objectAtIndex:i];
                    NSString * code = [responseObject objectForKey:@"code"];
                    NSString * msg = [responseObject objectForKey:@"msg"];
                    NSLog(@"code:%@, msg:%@", code, msg);
                    
//                    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//                    NSData *data=[responseObject dataUsingEncoding:-2147482063];
//                    NSString *retStr = [[NSString alloc] initWithData:data encoding:enc];
//                    NSLog(@"success:%@",retStr);
//                    NSLog(@"");
                    
                    successBlock(task, responseObject);
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    NetworkFailureBlock failureBlock = [APIParameters lastObject];
                    failureBlock(task, error);
                }];
            }break;
                
            case BCPOST:
            {
                [self POST:baseURL header:[self networkHTTPHeader] parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                    NetworkSuccessBlock successBlock = [APIParameters objectAtIndex:i];
                    successBlock(task, responseObject);
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    NetworkFailureBlock failureBlock = [APIParameters lastObject];
                    failureBlock(task, error);
                }];
            }break;
                
            case BCSpecialPost:
            {
                long long localTime = [[parameters objectForKey:@"localTime"] longLongValue];
                
                [self POST:baseURL header:[self networkHTTPHeaderWithServerTime:localTime] parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                    NetworkSuccessBlock successBlock = [APIParameters objectAtIndex:i];
                    successBlock(task, responseObject);
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    NetworkFailureBlock failureBlock = [APIParameters lastObject];
                    failureBlock(task, error);
                }];
            }break;
                
            case BCSpecialPost01:
            {
                [self SpecialPOST01:baseURL header:[self networkHTTPHeader] parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                    
                    NetworkSuccessBlock successBlock = [APIParameters objectAtIndex:i];
                    successBlock(task, responseObject);
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    
                    NetworkFailureBlock failureBlock = [APIParameters lastObject];
                    failureBlock(task, error);
                }];
            }break;
                
            default:
                break;
        }
    }
}

- (void)APIName_MethodGET_APIParameters:(NSArray *)APIParameters {
    
    [self APIName_Method:BCGET APIParameters:APIParameters];
}


- (void)APIName_MethodPOST_APIParameters:(NSArray *)APIParameters {
    
    [self APIName_Method:BCPOST APIParameters:APIParameters];
}

- (void)APIName_MethodSpeicalPOST_APIParameters:(NSArray *)APIParameters;{
    
    [self APIName_Method:BCSpecialPost APIParameters:APIParameters];
}

- (void)APIName_MethodSpeicalPOST01_APIParameters:(NSArray *)APIParameters;{
    
    [self APIName_Method:BCSpecialPost01 APIParameters:APIParameters];
}


#pragma mark - NetworkHTTPHeader

- (NSDictionary *)networkHTTPHeader {
    
    return [self networkHTTPHeaderWithServerTime:0];
}

- (NSDictionary *)networkHTTPHeaderWithServerTime:(long long)serverTime;{
    
    NSString * isAnonymous = @"true";
    NSString * msg = @"";
    
    if (![Flag boolValue])
    {
        isAnonymous = @"false";
    }
    
    if ([CurrentUserID length]>0)
    {
        msg = [self networkHTTPHeaderMsgParameterWithServerTime:serverTime];
    }
    //唯一标识 silence(20150303)
    NSString * UUIDString = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    UUIDString = [UUIDString stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSDictionary *header = @{@"ter_group_id": [BCConfigure kDeviceChannelType],
                             @"platForm": [BCConfigure kHTTPPlatform],
                             @"channel": [BCConfigure kHTTPChannel],
                             @"msg": msg,
                             @"isAnonymous": isAnonymous,
                             @"version": [BCConfigure kHTTPVersion],
                             @"deviceid":[BCEncryption hisunAES128EncryptString:UUIDString]};
    
    return header;
}

/*!
 * msg:40位随机数+_+随机数的索引+_+随机数索引位置的值+“##”+对称加密（客户端时间戳+22位字符串,私钥即为40位随机数）
 * 22位字符串=N位随机数+user_id+userid的位数（比如user_id=1即为01，user_id=11即为02，user_id=111即为03）
 */
- (NSString *)networkHTTPHeaderMsgParameter {
    
    return [self networkHTTPHeaderMsgParameterWithServerTime:0];
}

- (NSString *)networkHTTPHeaderMsgParameterWithServerTime:(long long)serverTime;{
    
    long long localTime = [[NSDate date] bc_microsecondTimeIntervalSince1970].longLongValue;
    if (serverTime==0)
    {
        serverTime = localTime + JetLag.longLongValue;//计算服务端时间
    }
    
    NSString * currentUserID_len = [NSString stringWithFormat:@"%lu", (unsigned long)[CurrentUserID length]];
    if ([currentUserID_len length]==1)
    {
        currentUserID_len = [NSString stringWithFormat:@"0%@", currentUserID_len];
    }
    
    NSString * currentUserID_group = [NSString stringWithFormat:@"%@%@", CurrentUserID, currentUserID_len];
    
    int random_len = 22 - (int)[currentUserID_group length];
    NSString * random_str = @"1";
    for (int i=1; i<random_len; i++)
    {
        random_str = [NSString stringWithFormat:@"0%@", random_str];
    }
    
    //（服务端时间戳+22位字符串,私钥即为40位随机数）
    NSString * encryptString = [NSString stringWithFormat:@"%@%@%@", [NSString stringWithFormat:@"%lld", serverTime], random_str, currentUserID_group];
    NSString * encryptedString = [BCEncryption hisunAES128EncryptString:encryptString withAESPassword:RandomKey];// AES加密操作
    
    NSString * msg = [NSString stringWithFormat:@"%@_0_%@##%@", RandomKey, [RandomKey substringToIndex:1], encryptedString];// 合并返回字符串
    
    assert([msg length]>0);
    
    return msg;
}

#pragma mark - AFHTTPSessionManager

- (NSURLSessionDownloadTask *)DOWNLOAD:(NSString *)URLString fileName:(NSString *)fileName progress:(NSProgress *)progress;{
    
    NSString *documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    __block NSString *directoryPath = [documentsDirectoryPath stringByAppendingPathComponent:[BCConfigure kFileDownloadPath]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    __block NSURL *destination = nil;
    NSData *resumeData = nil;
    
    if (fileName)
    {
        destination = [NSURL fileURLWithPath:[directoryPath stringByAppendingPathComponent:fileName]];
        //destination = [[NSURL URLWithString:directoryPath] URLByAppendingPathComponent:fileName];
        resumeData = [NSData dataWithContentsOfFile:[destination absoluteString]];
    }
    
    __block NSURLSessionDownloadTask *task;
    if ([resumeData length]<1)
    {
        task = [self downloadTaskWithRequest:request  progress:&progress destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
            
            return [NSURL fileURLWithPath:[directoryPath stringByAppendingPathComponent:response.suggestedFilename]];
        } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error){
            
            NSLog(@"File downloaded to: %@", filePath);
        }];
    }
    else
    {
        task = [self downloadTaskWithResumeData:resumeData progress:&progress destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
            
            return destination;
        } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
            
            NSLog(@"File downloaded to: %@", filePath);
        }];
    }
    
    [task resume];
    
    return task;
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString header:(NSDictionary *)header parameters:(NSDictionary *)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:nil];
    [request setTimeoutInterval:30.0f];
    
    if (header!=nil) {
        for (NSString *key in [header allKeys]) {
            [request setValue:[header valueForKey:key] forHTTPHeaderField:key];
        }
    }
    
    NSLog(@"request:%@\n allHTTPHeaderFields:%@\n parameters:%@", request, request.allHTTPHeaderFields, parameters);
    __block NSURLSessionDataTask *task = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
        if (error)
        {
            if (failure)
            {
                NSLog(@"failure:%@", error);
                failure(task, error);
                
//                NSDictionary *failureResponseObject = [NSDictionary dictionaryWithObjectsAndKeys:@"2",@"code",
//                                                       [NSString stringWithFormat:@"%@", [NSNumber numberWithInteger:[error code]]],@"msg", nil];
//                success(task, failureResponseObject);
            }
        }
        else
        {
            if (success)
            {
                NSLog(@"success:%@", responseObject);
                success(task, responseObject);
            }
        }
    }];
    
    [task resume];
    
    return task;
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString header:(NSDictionary *)header parameters:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"POST" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:nil];
    
    [request setTimeoutInterval:30.0f];
    
    if (header!=nil) {
        for (NSString *key in [header allKeys]) {
            [request setValue:[header valueForKey:key] forHTTPHeaderField:key];
        }
    }
    
    NSLog(@"request:%@\n allHTTPHeaderFields:%@\n parameters:%@", request, request.allHTTPHeaderFields, parameters);
    __block NSURLSessionDataTask *task = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
        if (error) {
            if (failure) {
                NSLog(@"failure:%@", error);
                failure(task, error);
            }
        }
        else
        {
            if (success)
            {
                NSLog(@"success:%@", responseObject);
                success(task, responseObject);
            }
        }
    }];
    
    [task resume];
    
    return task;
}


- (NSURLSessionDataTask *)SpecialPOST01:(NSString *)URLString header:(NSDictionary *)header parameters:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"POST" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:nil];
    [request setTimeoutInterval:60.0f];
    
    [request setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    
    if (header!=nil)
    {
        for (NSString *key in [header allKeys])
        {
            [request setValue:[header valueForKey:key] forHTTPHeaderField:key];
        }
    }
    
    NSLog(@"request:%@\n allHTTPHeaderFields:%@\n parameters:%@", request, request.allHTTPHeaderFields, parameters);
    __block NSURLSessionDataTask *task = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
        if (error)
        {
            if (failure)
            {
                NSLog(@"failure:%@", error);
                failure(task, error);
                //没网络连接-1004
                //网络已超时-1001
//                NSDictionary *failureResponseObject = [NSDictionary dictionaryWithObjectsAndKeys:@"2",@"code",
//                                                       [NSString stringWithFormat:@"%@", [NSNumber numberWithInteger:[error code]]],@"msg", nil];
//                success(task, failureResponseObject);
            }
        }
        else {
            if (success) {
                NSLog(@"success:%@", responseObject);
                success(task, responseObject);
            }
        }
    }];
    
    [task resume];
    
    return task;
}


@end
