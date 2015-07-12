
#import <Foundation/Foundation.h>

/*!
 * 应用加密类
 */
@interface BCEncryption : NSObject
{
    
}

/*!
 *  高阳加密算法--AES128
 *
 *  @param string 要加密的字符串
 *
 *  @return 已加密的字符串
 */
+ (NSString *)hisunAES128EncryptString:(NSString *)string;

/*!
 *  高阳加密算法--AES256
 *
 *  @param string 要加密的字符串
 *
 *  @return 已加密的字符串
 */
+ (NSString *)hisunAES256EncryptString:(NSString *)string;

/*!
 *  高阳解密算法--AES128
 *
 *  @param string 要加密的字符串
 *
 *  @return 已加密的字符串
 */
+ (NSString *)hisunAES128EncryptString:(NSString *)string withAESPassword:(NSString *)password;

@end
