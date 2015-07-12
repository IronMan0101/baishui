//
//  HDMComment.h
//  User
//
//  Created by Sea on 14-6-4.
//
//
#import <Foundation/Foundation.h>

@class HDMProduct;

/*!
 * 和动漫--作品--评论
 */
@interface HDMComment : BCModel
{
    
}

@property (nonatomic, copy) NSString * comment_content;
@property (nonatomic, copy) NSString * comment_time;
@property (nonatomic, copy) NSString * user_name;
@property (nonatomic, copy) NSString * user_url;

@property (nonatomic, strong) HDMProduct * product;

/*!
 * 提交评论
 * 赋值给comment_content
 */
- (void)submitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

@end
