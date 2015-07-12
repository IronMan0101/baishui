
#import "HDMDownloadProductSectionManager.h"
#import "HDMSection.h"


@implementation HDMDownloadProductSectionManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;{
    
//    [[HDMSection modelDatabaseQueueWithSuperKey:self.opus_id] inDatabase:^(BCDatabase *db) {
//        
//        BCResultSet * rs = [db executeQuery:@"SELECT * FROM HDMSection WHERE downloadStatus > 0 ORDER BY index_id*1"];
//        while ([rs next])
//        {
//            HDMSection * section = [[HDMSection alloc] initWithAttributes:[rs resultDictionary]];
//            [self.contextList addObject:section];
//        }
//        
//        success(@{@"code": @"0",
//                  @"msg": @"获取数据成功"});
//    }];
}


@end
