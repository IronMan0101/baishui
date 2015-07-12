//
//  HDMProductSelManager.m
//  HDMProject
//
//  Created by gyfd on 14-10-31.
//
//

#import "HDMProductSelManager.h"
#import "HDMNetwork.h"
#import "HDMProduct.h"

@implementation HDMProductSelManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
    [[HDMNetwork sharedInstance] query_opus_extend_sel_GET_Chann_id:self.chann_id Opus_id:self.opus_id  Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSDictionary * dictionary = [responseObject objectForKey:@"info"];//修改一处
       
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMProduct * product = [[HDMProduct alloc] initWithAttributes:attributes];//修改二处
                self.product=product;
                
                NSLog(@"favor:%@",self.product.is_favor);
                

            

            
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
