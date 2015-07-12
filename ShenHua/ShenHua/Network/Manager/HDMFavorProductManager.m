//
//  HDMFavorProductManager.m
//  PCCommon
//
//  Created by Sea on 14-7-27.
//
//

#import "HDMFavorProductManager.h"
#import "HDMProduct.h"


@implementation HDMFavorProductManager


- (instancetype)initWithParameter:(NSDictionary *)parameter;{
    
    if (self = [super initWithParameter:parameter])
    {
        self.channel = [parameter objectForKey:@"channel"];
    }
    
    return self;
}

- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;{
    
    [[HDMNetwork sharedInstance] query_favor_opus_list_GET_Chann_id:self.channel Type:@"1" Cur_page:BCIntegerString(self.currentPage) Page_size:BCIntegerString(self.pageSize) Success:^(NSURLSessionDataTask *task, id responseObject) {
        
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

- (void)clearSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;{
    
    NSMutableArray * ids = [NSMutableArray array];
    for (HDMProduct *product in self.contextList) {
        [ids addObject:product.favor_id];
    }
    
    [[HDMNetwork sharedInstance] cancel_favors_POST_Ids:ids Success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
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
