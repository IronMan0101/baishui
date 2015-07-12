//
//  HDMCurrency.m
//  User
//
//  Created by Sea on 14-6-4.
//
//

#import "HDMCurrency.h"
//#import "HDMNetwork.h"



@implementation HDMCurrency


//- (void)rechargeSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
//    
//    [[HDMNetwork sharedInstance] mb_recharge_POST_Mb_num:self.mb_num Price:self.price Success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        NSString * msg = [responseObject objectForKey:@"msg"];
//        NSString * code = [responseObject objectForKey:@"code"];
//        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
//        
//        if (![code boolValue])
//        {
//            //jf_hint
//            NSString * jf_hint = [responseObject objectForKey:@"jf_hint"];
//            if([jf_hint length] >0)
//                [MBProgressHUD showHudForJifenHintWithKeyWindow:jf_hint Message:msg];
//            else
//                [MBProgressHUD showHudMsgWithKeyWindow:msg];
//            success(codeMsg);
//        }
//        else
//        {
//            failure(codeMsg);
//        }
//    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //failure([BCAlertText networkErrorDictionary:error]);
//    }];
//}


@end
