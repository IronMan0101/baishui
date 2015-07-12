
#import <Foundation/Foundation.h>
/*!
 *  <#Description#>
 */
@interface HDMZone : BCModel
{
    
}

+ (instancetype)testCurrencyZone;
+ (instancetype)testCreditZone;

@property (nonatomic, copy) NSString * has_count;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * num;
@property (nonatomic, copy) NSString * type;
@property (nonatomic, copy) NSString * exchangeNumber;

- (void)exchangeSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

@end
