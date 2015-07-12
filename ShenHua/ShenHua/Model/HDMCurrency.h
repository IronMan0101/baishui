
#import <Foundation/Foundation.h>
/*!
 *  漫币
 */
@interface HDMCurrency : BCModel
{
    
}
@property (nonatomic, copy) NSString * num;
@property (nonatomic, copy) NSString * type;
@property (nonatomic, copy) NSString * price;
@property (nonatomic, copy) NSString * mb_num;
@property (nonatomic, copy) NSString * deadline;
@property (nonatomic, copy) NSString * recharge_date;
@property (nonatomic, copy) NSString * effective_date;




/*!
 * 充值
 */
- (void)rechargeSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

@end
