//
//  HDMSearchAboutManager.m
//  HDMCommonNew
//
//  Created by silence on 15/3/11.
//  Copyright (c) 2015年 Sea. All rights reserved.
//

#import "HDMSearchAboutManager.h"
#import "HDMNetwork.h"

@implementation HDMSearchAboutManager
- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure{
    [[HDMNetwork sharedInstance] search_recom_word_list_GET_Key:self.hotkey Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSArray * array = [responseObject objectForKey:@"list"];
            self.contextList = [NSMutableArray arrayWithArray:array];
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    }Failure:^(NSURLSessionDataTask *task, NSError *error) {
       ////failure([BCAlertText networkErrorDictionary:error]);
    }];
}
@end
