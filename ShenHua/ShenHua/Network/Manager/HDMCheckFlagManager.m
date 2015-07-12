//
//  HDMCheckFlagManager.m
//  HDMCommon
//
//  Created by silence on 15/5/28.
//  Copyright (c) 2015年 Sea. All rights reserved.
//

#import "HDMCheckFlagManager.h"

@implementation HDMCheckFlagManager
+ (instancetype)sharedInstance;{
    
    static HDMCheckFlagManager * instance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{instance = [[self alloc] init];});
    
    return instance;
}
- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure{
    [[HDMNetwork sharedInstance] query_flag_GET_Success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString * code = [responseObject objectForKey:@"code"];
        
        if (![code boolValue])
        {
            /*
             * 0：无免费标签
             * 1：有免费标签
            */
            NSString * flag = [responseObject objectForKey:@"flag"];//修改一处
      //      HDM_Global.isOpenFlag = [flag boolValue];
//            HDM_Global.isOpenFlag = YES;
//            success(codeMsg);
        }
        else
        {
//    /        failure(codeMsg);
         //   HDM_Global.isOpenFlag = NO;
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
//       //failure([BCAlertText networkErrorDictionary:error]);
      //  HDM_Global.isOpenFlag = NO;
    }];

}
@end
