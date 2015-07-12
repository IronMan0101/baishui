//
//  Tes.m
//  Project
//
//  Created by suzq on 14-7-16.
//
//

#import "HDMProductManager.h"
#import "HDMProduct.h"

@implementation HDMProductManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    //计算代码段所用时间
    NSDate* tmpStartData = [NSDate date];
    /*( 要计算的代码段 )*/
    
    [[HDMNetwork sharedInstance]  query_opus_detail_GET_Chann_id:BCIntString(self.channel)
                                                         Opus_id:self.opusid
     
     
                                                         Success:^(NSURLSessionDataTask *task, id responseObject)
     {
         
         
         NSString * msg = [responseObject objectForKey:@"msg"];
         NSString * code = [responseObject objectForKey:@"code"];
         NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
         
         if (![code boolValue])
         {
             NSDictionary * dictionary = [responseObject objectForKey:@"info"];
       
              NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
             
             //对类别要进行特殊处理
             
             NSArray * array = [responseObject objectForKey:@"class_list"];//修改一处
             NSString *leibie=@"";
             NSString *temp=@"";
             for (NSDictionary * dictionary in array)
             {
                 temp=[dictionary objectForKey:@"class_name"];

                 
                 if ([leibie isEqualToString:@""])
                 {
                     leibie=[NSString stringWithFormat:@"%@",temp];
                     
                 }else
                 {
                     leibie=[NSString stringWithFormat:@"%@  %@",leibie,temp];
                 }
                 
             }

             
                 
             HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改二处
             
             model.class_name=leibie;
             
             NSLog(@"作者::%@",model.author_name);
             
            [self.contextList addObject:model];
             
             
             
             
             self.totalItem = [[responseObject objectForKey:@"sum_line"] integerValue];
             self.totalPage = [[responseObject objectForKey:@"sum_page"] integerValue];
             
             success(codeMsg);
             //计算代码段所用时间
             double deltaTime = [[NSDate date] timeIntervalSinceDate:tmpStartData];
             NSLog(@">>>>>>>>>>near stop cost time 作品详情接口2 = %f ms", deltaTime);
         }
         else
         {
             failure(codeMsg);
         }
     } Failure:^(NSURLSessionDataTask *task, NSError *error) {
         
        //failure([BCAlertText networkErrorDictionary:error]);
         
     }];
    
}


- (void)shareSubmit:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure
{
    
    NSDate* tmpStartData = [NSDate date];//计算代码段所用时间
    
    NSLog(@"self.channel:%@,self.opusid:%@,self.share_to:%@,self.share_type:%@",BCIntString(self.channel),self.opusid,self.share_to,self.share_type);
    NSLog(@"");
    
//    if ([self.opusid isEqualToString:@""])//如果是包月、客户端分享默认就是成功，不调用接口！ add by suzq 2015.3.2
//    {
//        [MBProgressHUD showHudMsgWithKeyWindow:@"分享成功!"];
//        return;
//    }
    
   
    
    
    [[HDMNetwork sharedInstance]  share_submit_POST_Chann_id:BCIntString(self.channel)
                                                     Opus_id:self.opusid
                                                    Share_to:self.share_to Share_type:self.share_type
                                                     Success:^(NSURLSessionDataTask *task, id responseObject)
     {
         
         
         NSString * msg = [responseObject objectForKey:@"msg"];
         NSString * code = [responseObject objectForKey:@"code"];
         NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
         
         if (![code boolValue])
         {
             msg=@"分享成功!";
             //jf_hint  如果有积分  就积分提示
             NSString * jf_hint = [responseObject objectForKey:@"jf_hint"];
             NSLog(@"jf_hint:%@",jf_hint);
             NSLog(@"");
//             if([jf_hint length] >0)
//             {
//                 [MBProgressHUD showHudForJifenHintWithKeyWindow:jf_hint Message:msg];
//             }else
//             {
//                 [MBProgressHUD showHudMsgWithKeyWindow:msg];//msg  @"分享成功!"
//             }
             
             success(codeMsg);
             //计算代码段所用时间
             double deltaTime = [[NSDate date] timeIntervalSinceDate:tmpStartData];
             NSLog(@">>>>>>>>>>near stop cost time 分享提交接口接口2 = %f ms", deltaTime);
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
