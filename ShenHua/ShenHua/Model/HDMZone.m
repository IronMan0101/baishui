//
//  HDMZone.m
//  User
//
//  Created by Sea on 14-6-4.
//
//

#import "HDMZone.h"
//#import "HDMNetwork.h"

@implementation HDMZone


//+ (instancetype)testCurrencyZone;{
//    
//    static HDMZone * instance = nil;
//    
//    static dispatch_once_t predicate;
//    dispatch_once(&predicate, ^{
//        instance = [[self alloc] initWithAttributes:@{@"num": @"2.0", @"name": @"我的漫币"}];
//    });
//    
//    return instance;
//}
//
//
//+ (instancetype)testCreditZone;{
//    
//    static HDMZone * instance = nil;
//    
//    static dispatch_once_t predicate;
//    dispatch_once(&predicate, ^{
//        instance = [[self alloc] initWithAttributes:@{@"num": @"1765.0", @"name": @"我的积分"}];
//    });
//    
//    return instance;
//}
//
//
//- (void)exchangeSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
//    
//    [[HDMNetwork sharedInstance] jifen_submit_POST_Mb:self.exchangeNumber Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * mb = [responseObject objectForKey:@"mb"];
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = @{@"mb": mb, @"msg": msg, @"": code};
//        
//        if (![code boolValue])
//        {
//            success(codeMsg);
//            self.num = BCIntegerString([self.num integerValue] - ([self.exchangeNumber integerValue] * 100));
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}
//
//
//- (NSNumber *)modelTag {
//    
//    return [NSNumber numberWithInteger:[self.type integerValue]];
//}
//
//
//+ (NSDictionary *)databasePropertyMap;{
//    
//    return @{@"name": [NSNumber numberWithUnsignedInteger:BCData_NSString],
//             @"type": [NSNumber numberWithUnsignedInteger:BCData_NSString],
//             @"num": [NSNumber numberWithUnsignedInteger:BCData_NSString]};
//}

@end
