//
//  HDMChannelCurrencyManager.m
//  User
//
//  Created by Sea on 14-6-4.
//
//

#import "HDMChannelCurrencyManager.h"
#import "HDMNetwork.h"
#import "HDMCurrency.h"

@implementation HDMChannelCurrencyManager


-(void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
    [[HDMNetwork sharedInstance] query_mb_price_list_GET_Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSArray * array = [responseObject objectForKey:@"list"];//修改一处
            for (NSDictionary * dictionary in array)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMCurrency * model = [[HDMCurrency alloc] initWithAttributes:attributes];//修改二处
                [self.contextList addObject:model];
            }
            
            self.hint = [responseObject objectForKey:@"hint"];
            
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
      // //failure([BCAlertText networkErrorDictionary:error]);
    }];
}

@end
