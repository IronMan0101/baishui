//
//  HDMProductWithMenuManager.m
//  Project
//
//  Created by suzq on 14-7-16.
//
//

#import "HDMProductWithMenuManager.h"
#import "HDMProduct.h"
@implementation HDMProductWithMenuManager




///*!
// * 2.1 查询动画、漫画详细信息接口（包含目录）
// * query_opus_detail_with_menu
// */
//- (void)query_opus_detail_with_menu_GET_Chann_id:(NSString *)chann_id
//                                         Opus_id:(NSString *)opus_id Order_by:(NSString *)order_by
//                                        Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
//                                         Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
//    
//    [self APIName_MethodGET_APIParameters:@[@"query_opus_detail_with_menu", @{@"chann_id": chann_id,
//                                                                              @"opus_id": opus_id,
//                                                                              @"order_by": order_by,
//                                                                              @"cur_page": cur_page,
//                                                                              @"page_size": page_size}, success, failure]];
//}

- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
   
    [[HDMNetwork sharedInstance]  query_opus_detail_with_menu_GET_Chann_id:BCIntString(self.channel)
      Opus_id:@""
      Order_by:@""
      Cur_page:BCIntegerString(self.currentPage)
      Page_size:BCIntegerString(self.pageSize)
      Success:^(NSURLSessionDataTask *task, id responseObject)
      {
             
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
