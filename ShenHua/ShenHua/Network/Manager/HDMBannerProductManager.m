//
//  HDMBannerProductManager.m
//  Collection
//
//  Created by Sea on 14-6-14.
//
//

#import "HDMBannerProductManager.h"
#import "HDMProduct.h"
#import "HDMNetwork.h"


@implementation HDMBannerProductManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] query_subscribe_banner_list_GET_Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSArray * array = [responseObject objectForKey:@"list"];//修改一处
            for (NSDictionary * dictionary in array)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改二处
                [self.contextList addObject:model];
            }
            
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
