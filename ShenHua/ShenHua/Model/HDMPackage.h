//
//  HDMPackage.h
//  User
//
//  Created by Sea on 14-6-4.
//
//
#import <Foundation/Foundation.h>



@interface HDMPackage : BCModel
{
    
}

@property (nonatomic, copy) NSString * available;
@property (nonatomic, copy) NSString * iDescription;
@property (nonatomic, copy) NSString * isSubscribe;
@property (nonatomic, copy) NSString * isTrial;

@property (nonatomic, copy) NSString * productId;
@property (nonatomic, copy) NSString * productName;
@property (nonatomic, copy) NSString * productPrice;
@property (nonatomic, copy) NSString * productType;
@property (nonatomic, copy) NSString * residual;
@property (nonatomic, copy) NSString * shareInfo;
@property (nonatomic, copy) NSString * tips;
@property (nonatomic, copy) NSString * total;
@property (nonatomic, copy) NSString * isPoint;

- (NSString *)descriptiontT;
@property (nonatomic, copy) NSString * spending_tip;
- (void)spendingTipSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

- (void)orderSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

- (void)unsubscribeSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

@end
