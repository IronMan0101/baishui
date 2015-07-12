//
//  HDMOrder.m
//  PCCommon
//
//  Created by Sea on 14-7-25.
//
//

#import "HDMOrder.h"

#import "HDMGlobal.h"
#import "HDMNetwork.h"
#import "PCCommonDefines.h"

@implementation HDMOrder


- (NSNumber *)modelTag {
    
    return [NSNumber numberWithInt:1];
}



#pragma mark - 异网支付


- (void)beforeSubmitOrderByCTSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
//    [HDM_Global setMail:@"394239613@qq.com"];
    [[HDMNetwork sharedInstance] get_ct_sub_info_GET_Mail:HDM_Global.mail Hw_content_id:self.hw_content_id Hw_price:self.product_price Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        if (![code boolValue])
        {
            self.charge_code = [responseObject valueForKey:@"charge_code"];
            self.access_code = [responseObject valueForKey:@"access_code"];
            
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


- (void)submitOrderByCTSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    static NSTimeInterval timeInterval = 0.0f;
    if (timeInterval==0.0f)
    {
        timeInterval = [[NSDate date] timeIntervalSince1970];
    }
    
    [[HDMNetwork sharedInstance] get_ct_sub_result_GET_Mail:HDM_Global.mail Charge_code:self.charge_code Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        switch (code.integerValue)
        {
            case 0:
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:N_HDM_Purchase_Succeed object:nil];
                timeInterval = 0.0f;
                success(codeMsg);
            }break;
                
            case 2:
            {
                if (([[NSDate date] timeIntervalSince1970] - timeInterval) > 50)
                {
                    timeInterval = 0.0f;
                    failure(codeMsg);
                }
                else
                {
                    [NSThread sleepForTimeInterval:0.5];
                    [self submitOrderByCTSuccess:success Failure:failure];
                }
            }break;
                
            default:
            {
                timeInterval = 0.0f;
                failure(codeMsg);
            }break;
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        timeInterval = 0.0f;
        //failure([BCAlertText networkErrorDictionary:error]);
    }];
}


#pragma mark 异网支付 -


@end
