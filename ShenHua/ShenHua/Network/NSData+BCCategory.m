//
//  NSData+BCCategory.m
//  
//
//  Created by Sea on 14-5-23.
//
//

#import <CommonCrypto/CommonCrypto.h>   //BCAES
#import "NSData+BCCategory.h"


@implementation NSData (BCCategory)


- (NSString *)bc_convertToHexString;{
    
    if ([self length]==0)
    {
        return nil;
    }
    
    Byte * bytes = (Byte *)[self bytes];
    
    NSString * hexString = @"";
    for (int i=0; i<[self length]; i++)
    {
        NSString * newHexStr = [NSString stringWithFormat:@"%X",bytes[i] & 0xFF]; //16进制数
        if ([newHexStr length]==1)
            hexString = [NSString stringWithFormat:@"%@0%@", hexString,newHexStr];
        else
            hexString = [NSString stringWithFormat:@"%@%@", hexString,newHexStr];
    }
    
    return hexString;
}




- (NSString *)BC_AES256EncryptWithKey:(NSString *)key;{
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData * aData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        return [aData bc_convertToHexString];
    }
    free(buffer);
    return nil;
}

- (NSString *)AES256DecryptWithKey:(NSString *)key {
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData * aData = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        return [[NSString alloc] initWithData:aData encoding:NSASCIIStringEncoding];
    }
    free(buffer);
    return nil;
}



@end


@implementation NSData (BCAES)


- (instancetype)BC_AES128Decrypt:(BOOL)decrypt withPassword:(const char *)password {
    
    /*高阳生成秘钥方法*/
	unsigned char key[(128/8)];
	for (int i = 0; i < sizeof(key); i++)
		key[i] = password != 0 ? *password++ : 0;
    
    NSUInteger dataLength = [self length];size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void * buffer = malloc(bufferSize);
    
    size_t dataOutMoved = 0;
    static Byte ivBuff[] = {0xA,1,0xB,5,4,0xF,7,9,0x17,3,1,6,8,0xC,0xD,91};
    
    CCCryptorStatus cryptStatus = CCCrypt((CCOperation)decrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          key, kCCKeySizeAES128,
                                          ivBuff, /* initialization vector (optional) */
                                          [self bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &dataOutMoved);
    
    NSData * data = nil;
    if (cryptStatus == kCCSuccess)
    {
        //data = [[NSData alloc] initWithBytesNoCopy:buffer length:numBytesEncrypted];//注意这两者的差别
        data = [NSData dataWithBytes:buffer length:dataOutMoved];
    }
    free(buffer);
    
    return data;
}


- (instancetype)BC_AES256Decrypt:(BOOL)decrypt withPassword:(const char *)password;{
    
//    NSData *plainText = [plain dataUsingEncoding:NSUTF8StringEncoding];
//	// 'key' should be 32 bytes for AES256, will be null-padded otherwise
//	char keyPtr[kCCKeySizeAES256+1]; // room for terminator (unused)
//	bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
//    
//	NSUInteger dataLength = [plainText length];
//    
//	size_t bufferSize = dataLength + kCCBlockSizeAES128;
//	void *buffer = malloc(bufferSize);
//    bzero(buffer, sizeof(buffer));
//	
//	size_t numBytesEncrypted = 0;
//    
//	CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,kCCOptionPKCS7Padding,
//                                          [[NSData AESKeyForPassword:PASSWORD] bytes], kCCKeySizeAES256,
//										  ivBuff /* initialization vector (optional) */,
//										  [plainText bytes], dataLength, /* input */
//										  buffer, bufferSize, /* output */
//										  &numBytesEncrypted);
//	if (cryptStatus == kCCSuccess) {
//        NSData *encryptData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
//		return [encryptData base64Encoding];
//	}
//	
//	free(buffer); //free the buffer;
//	return nil;
    
    
    /*高阳生成秘钥方法*/
	unsigned char key[(128/8)];
	for (int i = 0; i < sizeof(key); i++)
		key[i] = password != 0 ? *password++ : 0;
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void * buffer = malloc(bufferSize);
    
    size_t dataOutMoved = 0;
    static Byte ivBuff[] = {0xA,1,0xB,5,4,0xF,7,9,0x17,3,1,6,8,0xC,0xD,91};
    
    CCCryptorStatus cryptStatus = CCCrypt((CCOperation)decrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          key, kCCKeySizeAES256,
                                          ivBuff, /* initialization vector (optional) */
                                          [self bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &dataOutMoved);
    
    NSData * data = nil;
    if (cryptStatus == kCCSuccess)
    {
        //data = [[NSData alloc] initWithBytesNoCopy:buffer length:numBytesEncrypted];//注意这两者的差别
        data = [NSData dataWithBytes:buffer length:dataOutMoved];
    }
    free(buffer);
    
    return data;
}


@end


@implementation NSData (MSTransformation)


+ (NSData *)bc_bytesDataFromHexString:(NSString *)hexString {
    
    int j = 0;
    
    Byte bytes[[hexString length]/2];
    for (int i=0; i<[hexString length]; i++)
    {
        unichar hex_char1 = [hexString characterAtIndex:i]; // 两位16进制数中的第一位(高位*16)
        
        int int_ch1;
        if (hex_char1 >= '0' && hex_char1 <='9')
            int_ch1 = (hex_char1-48) * 16; // 0 的Ascll - 48
        else if (hex_char1 >= 'A' && hex_char1 <='F')
            int_ch1 = (hex_char1-55) * 16; // A 的Ascll - 65
        else
            int_ch1 = (hex_char1-87) * 16; // a 的Ascll - 97
        
        i++;
        
        unichar hex_char2 = [hexString characterAtIndex:i]; //两位16进制数中的第二位(低位)
        
        int int_ch2;
        if (hex_char2 >= '0' && hex_char2 <='9')
            int_ch2 = (hex_char2-48); // 0 的Ascll - 48
        else if (hex_char2 >= 'A' && hex_char2 <='F')
            int_ch2 = (hex_char2-55); // A 的Ascll - 65
        else
            int_ch2 = (hex_char2-87); // a 的Ascll - 97
        
        bytes[j] = (int_ch1+int_ch2);  //将两位16进制数转化后的10进制数放入Byte数组里
        
        j++;
    }
    
    return [NSData dataWithBytes:bytes length:([hexString length]/2)];
}


+ (NSString *)bc_hexStringFromBytesData:(NSData *)bytesData {
    
    Byte * bytes = (Byte *)[bytesData bytes];
    
    NSString *hexString = @"";
    for (int i=0; i<[bytesData length]; i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%X",bytes[i]&0xFF]; //16进制数
        if ([newHexStr length]==1)
            hexString = [NSString stringWithFormat:@"%@0%@", hexString,newHexStr];
        else
            hexString = [NSString stringWithFormat:@"%@%@", hexString,newHexStr];
    }
    
    return hexString;
}

@end
