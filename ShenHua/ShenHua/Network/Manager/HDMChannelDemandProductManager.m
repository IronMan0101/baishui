
#import "HDMChannelDemandProductManager.h"
#import "HDMProduct.h"

@implementation HDMChannelDemandProductManager





- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
    NSString * node_id = nil;
    switch (self.channel)
    {
        case HDMManHuaChannel:
        {
            node_id = @"AND-COMIC-005";
        }break;
            
        case HDMDongHuaChannel:
        {
            node_id = @"AND-CARTOON-004";
        }break;
            
        default:
        {
            node_id = @"000";
        }break;
    }
    
    
    NSLog(@"self.currentPage::%d,self.pageSize::%d",self.currentPage,self.pageSize);
    NSLog(@"1");
    
    [[HDMNetwork sharedInstance] query_recomm_opus_more_list_GET_Chann_id:BCIntegerString(self.channel) Node_id:node_id Cur_page:BCIntegerString(self.currentPage) Page_size:BCIntegerString(self.pageSize) Success:^(NSURLSessionDataTask *task, id responseObject) {
        
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
            
            self.totalItem = [[responseObject objectForKey:@"sum_line"] integerValue];
            self.totalPage = [[responseObject objectForKey:@"sum_page"] integerValue];
            
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
