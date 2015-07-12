
#import <Foundation/Foundation.h>

@interface NSData (BCCategory)

- (NSString *)bc_convertToHexString;

- (NSString *)BC_AES256EncryptWithKey:(NSString *)key;

@end


@interface NSData (BCAES)

/*!
 * 高阳生成秘钥方法
 */
- (instancetype)BC_AES128Decrypt:(BOOL)decrypt withPassword:(const char *)password;
- (instancetype)BC_AES256Decrypt:(BOOL)decrypt withPassword:(const char *)password;

@end


@interface NSData (MSTransformation)

+ (NSData *)bc_bytesDataFromHexString:(NSString *)hexString;
+ (NSString *)bc_hexStringFromBytesData:(NSData *)bytesData;

@end
