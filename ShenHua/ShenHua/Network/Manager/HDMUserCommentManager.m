
#import "HDMUserCommentManager.h"
#import "HDMNetwork.h"
#import "HDMProduct.h"
#import "HDMComment.h"

@implementation HDMUserCommentManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
    [[HDMNetwork sharedInstance] user_queryComment_GET_Cur_page:BCIntegerString(self.currentPage) Page_size:BCIntegerString(self.pageSize) Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSArray * array = [responseObject objectForKey:@"list"];//修改一处
            for (NSDictionary * dictionary in array)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMProduct * product = [[HDMProduct alloc] initWithAttributes:attributes];//修改二处
                
                HDMComment * comment = [[HDMComment alloc] initWithAttributes:attributes];
                comment.product = product;
                
                [self.contextList addObject:comment];
            }
            
            self.totalItem = [[responseObject objectForKey:@"sum_line"] integerValue];
            self.totalPage = [[responseObject objectForKey:@"sum_page"] integerValue];
            
            success(codeMsg);
            NSLog(@"comment codeMsg success:%@",codeMsg);
        }
        else
        {
            failure(codeMsg);
            NSLog(@"comment codeMsg failure1:%@",codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        //NSLog(@"comment codeMsg failure2:%@",[BCAlertText networkErrorDictionary:error]);
       //failure([BCAlertText networkErrorDictionary:error]);
    }];
}

@end
