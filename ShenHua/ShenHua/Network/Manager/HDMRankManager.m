//
//  HDMRankManager.m
//  HDMProject
//
//  Created by suzq on 14/11/3.
//
//

#import "HDMRankManager.h"
#import "HDMNetwork.h"
#import "HDMProduct.h"

@implementation HDMRankManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
    [[HDMNetwork sharedInstance] query_rank_opus_list_GET_Chann_id:BCIntegerString(self.channel) Rank_id:self.rank_id Order_by:self.order_by Cur_page:BCIntegerString(self.currentPage) Page_size:BCIntegerString(self.pageSize) Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            //填充是否为空的标志位
           // self.is_empty=[[responseObject objectForKey:@"is_empty"] boolValue];
            
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
        
      // //failure([BCAlertText networkErrorDictionary:error]);
    }];
}

@end
