//
//  HDMHotkeyProductManager.m
//  User
//
//  Created by Sea on 14-6-4.
//
//

#import "HDMHotkeyProductManager.h"
#import "HDMNetwork.h"
#import "HDMHotkey.h"
#import "HDMProduct.h"

@implementation HDMHotkeyProductManager

- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    //20150528 silence
    
    [[HDMNetwork sharedInstance] content_search_GET_Chann_id:self.hotkey.chann_id key:self.hotkey.key Cur_page:BCIntegerString(self.currentPage) Page_size:BCIntegerString(self.pageSize) Success:^(NSURLSessionDataTask *task, id responseObject) {
        [self success:success Failure:failure ResponseObject:responseObject];
    }Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
      // //failure([BCAlertText networkErrorDictionary:error]);
    }];
    /*
    if(!HDM_Global.isOpenFlag)
    {
        [[HDMNetwork sharedInstance] content_search_GET_Chann_id:self.hotkey.chann_id key:self.hotkey.key Cur_page:BCIntegerString(self.currentPage) Page_size:BCIntegerString(self.pageSize) Success:^(NSURLSessionDataTask *task, id responseObject) {
            [self success:success Failure:failure ResponseObject:responseObject];
        }Failure:^(NSURLSessionDataTask *task, NSError *error) {
            
           //failure([BCAlertText networkErrorDictionary:error]);
        }];
    }
    else
    {
        [[HDMNetwork sharedInstance] content_search_new_GET_Chann_id:self.hotkey.chann_id key:self.hotkey.key Cur_page:BCIntegerString(self.currentPage) Page_size:BCIntegerString(self.pageSize) Success:^(NSURLSessionDataTask *task, id responseObject) {
            [self success:success Failure:failure ResponseObject:responseObject];
            
        }Failure:^(NSURLSessionDataTask *task, NSError *error) {
            
           //failure([BCAlertText networkErrorDictionary:error]);
        }];
    }
     */
//    //20150309 silence
//    [[HDMNetwork sharedInstance] content_search_new_GET_Chann_id:self.hotkey.chann_id key:self.hotkey.key Cur_page:BCIntegerString(self.currentPage) Page_size:BCIntegerString(self.pageSize) Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//       //failure([BCAlertText networkErrorDictionary:error]);
//    }];
}

- (void)success:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure ResponseObject:(id)responseObject
{
    NSString * msg = [responseObject objectForKey:@"msg"];
    NSString * code = [responseObject objectForKey:@"code"];
    NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
    
    if (![code boolValue])
    {
        //填充是否为空的标志位
        self.is_empty=[[responseObject objectForKey:@"is_empty"] boolValue];
        
        NSArray * array = [responseObject objectForKey:@"list"];//修改一处
        for (NSDictionary * dictionary in array)
        {
            NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
            
            HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改二处
            [self.contextList addObject:model];
        }
        
        self.totalItem = [[responseObject objectForKey:@"sum_line"] integerValue];
        self.totalPage = [[responseObject objectForKey:@"sum_page"] integerValue];
        self.spell_check = [responseObject objectForKey:@"spell_check"];
        success(codeMsg);
    }
    else
    {
        failure(codeMsg);
    }
}
@end
