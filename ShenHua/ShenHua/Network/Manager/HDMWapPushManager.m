//
//  WapPushManager.m
//  HDMProject
//
//  Created by suzhiqiu on 15/3/5.
//
//

#import "HDMWapPushManager.h"

@implementation HDMWapPushManager

- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
    [[HDMNetwork sharedInstance] query_opus_detail_for_wappush_GET_Hw_content_id:self.hwcontent_id
                                                                          Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
           self.dicContent=[[NSMutableDictionary alloc]initWithCapacity:5];
            
           [self.dicContent setValue:[responseObject objectForKey:@"chann_id"] forKey:@"chann_id"];
           [self.dicContent setValue:[responseObject objectForKey:@"opus_id"] forKey:@"opus_id"];
           [self.dicContent setValue:[responseObject objectForKey:@"opus_name"] forKey:@"opus_name"];
           [self.dicContent setValue:[responseObject objectForKey:@"content_id"] forKey:@"content_id"];
           [self.dicContent setValue:[responseObject objectForKey:@"is_free"] forKey:@"is_free"];
            
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

@end
