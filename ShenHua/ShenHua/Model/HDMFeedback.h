//
//  HDMFeedback.h
//  User
//
//  Created by Sea on 14-6-4.
//
//
#import <Foundation/Foundation.h>

#define BCM_Feedback [HDMFeedback feedback]

@interface HDMFeedback : BCModel
{
    
}

+ (instancetype)feedback;

@property (nonatomic, copy) NSString * feed_des;
@property (nonatomic, copy) NSString * cellphone_type;
@property (nonatomic, copy) NSString * question_type;
@property (nonatomic, copy) NSString * age;
@property (nonatomic, copy) NSString * sex;

- (void)submitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

@end
