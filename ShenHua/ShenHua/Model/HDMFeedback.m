//
//  HDMFeedback.m
//  User
//
//  Created by Sea on 14-6-4.
//
//

#import "HDMFeedback.h"
#import "HDMNetwork.h"

@implementation HDMFeedback


+ (instancetype)feedback {
    
    static HDMFeedback * feedback = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{feedback = [[self alloc] initWithAttributes:nil];});
    
    return feedback;
}

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    self = [super initWithAttributes:attributes];
    if (self)
    {
        
    }
    
    return self;
}


- (void)submitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] feedback_submit_POST_Feed_des:self.feed_des Cellphone_type:self.cellphone_type question_type:self.question_type Age:self.age Sex:self.sex Success:^(NSURLSessionDataTask *task, id responseObject) {
        
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
        
     //   //failure([BCAlertText networkErrorDictionary:error]);
    }];
}

@end
