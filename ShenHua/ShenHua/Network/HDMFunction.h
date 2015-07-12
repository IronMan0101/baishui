
#import <Foundation/Foundation.h>
#import "PCCommonTypes.h"

@interface HDMFunction : NSObject
{
    
}

/*!
 *  type: 登录类型（无登录：-1、游客：0、用户登录：1）
 *  value: mobile_num（AES加密的id，分别对应登录类型：IMEI、游客id、手机号）
 *
 *  @return 营运数据有关信息
 */
+ (NSDictionary *)logNeedInfomation:(NSDictionary *)infomation;

+ (NSString *)typeStringOfChannel:(HDMChannel)channel;

@end
