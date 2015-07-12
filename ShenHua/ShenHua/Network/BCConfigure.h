
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BCClienVersion)
{
//    BCiTunesVersion = 3,  //app内支付标识   //暂时对换下 4->3  silence 20150403
//    BCJailbreakVersion = 4, //越狱标识    3->4
    BCiTunesVersion = 4,
    BCJailbreakVersion = 3
};

/*!
 *  应用配置类
 *  从本地加密文件BCConfigure.plist中读取内容, 然后解密输出
 */
@interface BCConfigure : NSObject
{
    
}

#pragma mark - HTTP URL

/*!
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)kBaseURLString;

/*!
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)kUserURLString;
/*!
 *
 *
 *  @return 推送地址
 */
+ (NSString *)pushURLString;
/*!
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)kHTTPURLSuffix;


#pragma mark - HTTP Header

/*!
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)kHTTPChannel;

/*!
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)kHTTPVersion;

/*!
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)kHTTPPlatform;

/*!
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)kDeviceChannelType;


#pragma mark - Encryption

/*!
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)kEncryptionPassword;


#pragma mark - UIWebView

/*!
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)kAgreementURLString;

+ (NSString *)kHelpURLString;

+ (NSString *)kManbiURLString;

#pragma mark - Download -

+ (NSString *)kFileDownloadPath;

@end
