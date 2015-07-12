//
//  HDMDownloadSectionManager.m
//  HDMProject
//
//  Created by Sea on 14-10-9.
//
//

#import "HDMDownloadSectionManager.h"
#import "HDMProduct.h"


@implementation HDMDownloadSectionManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;{
    
//    [[HDMProduct classDatabaseQueue] inDatabase:^(BCDatabase *db) {
//        
//        BCResultSet *rs = [db executeQuery:@"select opus_id, opus_url, chann_id, opus_name, status_value, sum_count from HDMProduct WHERE inDownload = 1"];
//        while ([rs next])
//        {
//            HDMProduct * product = [[HDMProduct alloc] initWithAttributes:nil];
//            
//            NSMutableArray * databasePropertyArray = [[NSMutableArray alloc] initWithArray:
//                                                      [[[HDMProduct class] databasePropertyMap] allKeys]];//修改一处client
//            
//            [databasePropertyArray addObject:@"modelTag"];
//            for (NSString *key in databasePropertyArray)
//            {
//                @try
//                {
//                    if ([key isEqualToString:@"modelTag"])
//                    {
//                        int intValue = [rs intForColumn:key];
//                        [product setValue:[NSNumber numberWithInt:intValue] forKey:key];
//                    }
//                    else
//                    {
//                        id object = [rs stringForColumn:key];
//                        if (!(object==nil || [object isKindOfClass:[NSNull class]]))
//                        {
//                            [product setValue:object forKey:key];
//                        }
//                    }
//                }
//                @catch (NSException *exception)
//                {
//                    NSLog(@"exception key: %@", key);
//                }
//                @finally
//                {
//                    ;
//                }
//            }
//            
//            [self.contextList addObject:product];
//        }
//        
//        success(@{@"code": @"0",
//                  @"msg": @"获取数据成功"});
//    }];
}

@end
