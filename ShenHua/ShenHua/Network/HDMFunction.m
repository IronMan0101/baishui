
#import "HDMFunction.h"


@implementation HDMFunction


- (void)submit;{
    
    
}


/*!
 *  type: 登录类型（无登录：-1、游客：0、用户登录：1）
 *  value: mobile_num（AES加密的id，分别对应登录类型：IMEI、游客id、手机号）
 *
 *  @return 营运数据有关信息
 */
+ (NSDictionary *)logNeedInfomation:(NSDictionary *)infomation;{
    
    static NSMutableDictionary * m_Dictionary = nil;
    
    if (!infomation) // 获取信息
    {
        return m_Dictionary;
    }
    else // 设置信息
    {
        m_Dictionary = [[NSMutableDictionary alloc] init];
        if ([[infomation valueForKey:@"type"] isEqualToString:@"value"])
        {
            [m_Dictionary setValue:@"-1" forKey:@"type"];
            
            NSString * UUIDString = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            UUIDString = [UUIDString stringByReplacingOccurrencesOfString:@"-" withString:@""];
            [m_Dictionary setValue:[BCEncryption hisunAES128EncryptString:UUIDString] forKey:@"value"];
        }
        else
        {
            for (NSString * key in [infomation allKeys])
            {
                if ([key isEqualToString:@"value"])
                {
                    [m_Dictionary setValue:[BCEncryption hisunAES128EncryptString:[infomation objectForKey:key]] forKey:@"value"];
                }
                else
                {
                    [m_Dictionary setValue:[infomation valueForKey:key] forKey:key];
                }
            }
        }
    }
    
    return m_Dictionary;
}



+ (NSString *)typeStringOfChannel:(HDMChannel)channel;{
    
    NSString * string = nil;
    
    switch (channel)
    {
        case HDMManHuaChannel:
        {
            string = @"话";
        }break;
            
        case HDMDongHuaChannel:
        {
            string = @"集";
        }break;
            
        default:
        {
            string = @"话";
        }break;
    }
    
    return string;
}


@end
