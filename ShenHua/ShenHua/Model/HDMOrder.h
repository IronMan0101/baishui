
#import <Foundation/Foundation.h>

/*!
 *  定单
 */
@interface HDMOrder : BCModel
{
    
}

@property (nonatomic, copy) NSString * coins_tips;

/*!
 *  用于异网支付判断，如果为空或null不支持异网支付
 */
@property (nonatomic, copy) NSString * hw_content_id; //鉴别是否是包月
@property (nonatomic, copy) NSString * product_desc;
@property (nonatomic, copy) NSString * product_id;
@property (nonatomic, copy) NSString * product_name;
@property (nonatomic, copy) NSString * product_price;
@property (nonatomic, copy) NSString * product_tips;
@property (nonatomic, copy) NSString * product_type;
@property (nonatomic, copy) NSString * spending_type; //1:漫币消费 0:话费消费

@property (nonatomic, copy) NSString * chann_id;
@property (nonatomic, copy) NSString * opus_id;
@property (nonatomic, copy) NSString * content_id;

@property (nonatomic, copy) NSString * coins; //漫币
@property (nonatomic, copy) NSString * points; //积分


#pragma mark - 异网支付
/*!
 *  计费码
 */
@property (nonatomic, copy) NSString * charge_code;

/*!
 *  接口号,电话号码
 */
@property (nonatomic, copy) NSString * access_code;

/*!
 *  调取系统短信前发起，获取计费码和接口号
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)beforeSubmitOrderByCTSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

/*!
 *  发送正确短信后发起订购
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)submitOrderByCTSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

#pragma mark 异网支付 -

@end
