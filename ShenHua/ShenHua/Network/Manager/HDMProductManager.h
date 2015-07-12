//
//  HDMProductManager.h
//  Project
//
//  Created by suzq on 14-7-16.
//
//  作品详情
//
#import <Foundation/Foundation.h>
#import "HDMNetwork.h"

@interface HDMProductManager : BCManager

@property (nonatomic,assign) HDMChannel channel;
@property (nonatomic,copy)   NSString * opusid;

@property (nonatomic,copy)   NSString * share_to;
@property (nonatomic,copy)   NSString * share_type;

- (void)shareSubmit:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;

@end
