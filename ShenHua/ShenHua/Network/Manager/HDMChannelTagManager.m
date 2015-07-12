
#import "HDMChannelTagManager.h"
#import "HDMNetwork.h"
#import "HDMNetwork.h"
#import "HDMClass.h"

@implementation HDMChannelTagManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] query_chann_tag_list_GET_Chann_id:BCIntString(self.channel) Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSArray * array = [responseObject objectForKey:@"tag_list"];//修改一处
            for (NSDictionary * dictionary in array)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMClass * model = [[HDMClass alloc] initWithAttributes:attributes];//修改二处
                [self.contextList addObject:model];
            }
            
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
       ////failure([BCAlertText networkErrorDictionary:error]);
    }];
}


@end
