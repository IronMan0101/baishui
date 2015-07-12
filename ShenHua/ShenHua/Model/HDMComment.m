//
//  HDMComment.m
//  User
//
//  Created by Sea on 14-6-4.
//
//

#import "HDMComment.h"
#import "HDMProduct.h"
#import "HDMNetwork.h"

@implementation HDMComment


- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    self = [super initWithAttributes:attributes];
    if (self)
    {
        //self.comment_content = @"Good!";//初始化参数设置
    }
    
    return self;
}

/*!
 * 提交评论
 * 赋值给comment_content
 */
- (void)submitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] comment_submit_POST_Chann_id:self.product.chann_id Opus_id:self.product.opus_id Comment_content:self.comment_content Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSString * jifen = [responseObject objectForKey:@"jf_hint"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg",jifen,@"jf_hint", nil];
        
        if (![code boolValue])
        {
            //jf_hint
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
