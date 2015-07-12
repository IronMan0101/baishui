
#import <Foundation/Foundation.h>
#import "AFNetworking.h"

/*!
 *  网络请求方法
 */
typedef enum {
    BCGET,
    BCPOST,
    BCSpecialPost,
    BCSpecialPost01,//运营日志
}BCHTTPMethod;


@interface BCNetwork : AFHTTPSessionManager
{
    
}

#pragma mark - Server Veriable

+ (void)setFlag:(NSNumber *)flag;

+ (NSString *)ServerTime;

+ (void)setJetLag:(NSNumber *)jetLag;
+ (void)setRandomKey:(NSString *)randomKey;
+ (NSString *)currentUserID;
+ (void)setCurrentUserID:(NSString *)currentUserID;


#pragma mark - Server API

- (void)APIName_MethodGET_APIParameters:(NSArray *)APIParameters;
- (void)APIName_MethodPOST_APIParameters:(NSArray *)APIParameters;
- (void)APIName_MethodSpeicalPOST_APIParameters:(NSArray *)APIParameters;
- (void)APIName_MethodSpeicalPOST01_APIParameters:(NSArray *)APIParameters;

- (NSURLSessionDownloadTask *)DOWNLOAD:(NSString *)URLString fileName:(NSString *)fileName progress:(NSProgress *)progress;

- (NSURLSessionDataTask *)POST:(NSString *)URLString header:(NSDictionary *)header parameters:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/*!
 * @override
 */
- (void)setClientInitParameter:(NSDictionary *)parameter;

@end
