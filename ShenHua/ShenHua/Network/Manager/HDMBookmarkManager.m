//
//  HDMBookmarkManager.m
//  PCCommon
//
//  Created by Sea on 14-7-27.
//
//

#import "HDMBookmarkManager.h"
#import "HDMProduct.h"
#import "HDMSection.h"

@implementation HDMBookmarkManager

- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;{
    
    [[HDMNetwork sharedInstance] query_my_mark_GET_Chann_id:BCIntString(self.channel) Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSArray * array = [responseObject objectForKey:@"list"];//修改一处
//            for (NSDictionary * dictionary in array)
//            {
//                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
//                NSArray * array01 = [attributes objectForKey:@"list"];//修改一处
//                for (NSDictionary * dictionary01 in array01)
//                {
//                    NSMutableDictionary * attributes01 = [NSMutableDictionary dictionaryWithDictionary:dictionary01];
//                    
//                    HDMSection * model = [[HDMSection alloc] initWithAttributes:attributes01];//修改二处
//                    //待处理
//                }
//                [attributes removeObjectForKey:@"list"];
//                
//                HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改二处
//                model.chann_id = BCIntString(self.channel);
//                [self.contextList addObject:model];
//            }
            
            [self.contextList addObjectsFromArray:array];
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
    for (NSDictionary *dictionary in self.contextList) {
        
        for (NSDictionary *product in [dictionary objectForKey:@"list"]) {
            [ids addObject:[product objectForKey:@"bookmark_id"]];
        }
        
    }
    
    [[HDMNetwork sharedInstance] cancel_marks_POST_Ids:ids Success:^(NSURLSessionDataTask *task, id responseObject) {
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


- (void)deleteBookmarkList:(NSArray *)bookmarkList Success:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;{
    
    NSMutableArray * ids = [NSMutableArray array];
    for (NSDictionary *bookmark in bookmarkList)
    {
        [ids addObject:[bookmark objectForKey:@"bookmark_id"]];
    }
    
    [[HDMNetwork sharedInstance] cancel_marks_POST_Ids:ids  Success:^(NSURLSessionDataTask *task, id responseObject) {
        
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
        
        failure(@{@"code": @"2", @"msg": error});
    }];
}

@end
