
#import "HDMChannelClassProductManager.h"
#import "HDMProduct.h"

@implementation HDMChannelClassProductManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
    [[HDMNetwork sharedInstance] query_class_opus_list_GET_Chann_id:BCIntString(self.channel) Class_ids:self.classDictionary Cur_page:BCIntegerString(self.currentPage) Page_size:BCIntegerString(self.pageSize) Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSArray * array = [responseObject objectForKey:@"list"];//修改一处
            NSLog(@"enquiryListSuccess :%@",array);
            for (NSDictionary * dictionary in array)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改二处
                [self.contextList addObject:model];
            }
            
            self.totalItem = [[responseObject objectForKey:@"sum_line"] integerValue];
            self.totalPage = [[responseObject objectForKey:@"sum_page"] integerValue];
            
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
