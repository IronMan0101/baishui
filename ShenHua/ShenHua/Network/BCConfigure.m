//
//  BCConfigure.m
//  
//
//  Created by Sea on 14-5-23.
//
//

#import "BCConfigure.h"
#import "DBTool.h"


static NSDictionary *configureDictionary = nil;


@implementation BCConfigure


+ (NSString *)configureValueForKey:(NSString *)aKey {
    
    return [configureDictionary objectForKey:aKey];
}

#pragma mark - HTTP URL

+ (NSString *)kBaseURLString {
    
    return @"http://wap.dm.10086.cn/ClientIphone"; //正式
//    return @"http://218.207.208.20:59001/ClientTest1"; //ClientTest1
//    return @"http://218.207.208.20:59001/ClientIphone"; //测试
}


+ (NSString *)kUserURLString;{
    
    return @"http://218.207.208.20:59001/ClientOP/userAuth.hisun";
}

+ (NSString *)pushURLString
{
    return @"http://218.207.208.34:1880/ClientPushws_ios/pushserver.hisun";//正式
//    return @"http://218.207.208.20:59001/ClientPushOp/pushserver.hisun";  //测试
}
+ (NSString *)kHTTPURLSuffix {
    
    return @".hisun";
}


#pragma mark - HTTP Header

+ (NSString *)kHTTPChannel {
    
    return @"0000"; //默认
//    return @"900000006";//91助手
//    return @"900000007";//XY苹果助手
//    return @"12242000"; //同步助手
}

+ (NSString *)kHTTPVersion {
    
    return @"3.1.0132";
}

+ (NSString *)kHTTPPlatform {
    
    return @"iphone";
}

+ (NSString *)kDeviceChannelType {
    
    return @"4";
}


#pragma mark - Encryption

+ (NSString *)kEncryptionPassword {
    
    return @"1DCCE804C0C8F36D19E61DBF53E86214";
}


#pragma mark - UIWebView

+ (NSString *)kAgreementURLString {
    
    return [NSString stringWithFormat:@"%@/protocol.html", [self kBaseURLString]];
}


+ (NSString *)kHelpURLString {
    
    return [NSString stringWithFormat:@"%@/help.html", [self kBaseURLString]];
}


+ (NSString *)kManbiURLString; {
    
    return [NSString stringWithFormat:@"%@/manbi.html", [self kBaseURLString]];
}

#pragma mark - Download -

+ (NSString *)kFileDownloadPath;{
    
    NSString *kFileDownloadPath = @"00HDMFileDownload";
    
    NSString *documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path = [documentsDirectoryPath stringByAppendingPathComponent:kFileDownloadPath];
    
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSError *error = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:path
                                  withIntermediateDirectories:YES attributes:nil error:&error];
    }
    //add by silence 20150625
    [DBTool addSkipBackupAttributeToItemAtPath:path];
    return path;
}


@end
