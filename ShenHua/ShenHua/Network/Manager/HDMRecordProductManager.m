//
//  HDMRecordProductManager.m
//  HDMProject
//
//  Created by Sea on 14/12/25.
//
//

#import "HDMRecordProductManager.h"
#import "HDMProduct.h"


@implementation HDMRecordProductManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;{
    
//    NSTimeInterval today = [[NSDate date] bc_timeIntervalSince1970WithDateFormat:@"yyyyMMdd"];
//    NSTimeInterval week = today - 518400;
//    
//    [[HDMProduct classDatabaseQueue] inDatabase:^(BCDatabase * db) {
//        
//        BCResultSet * rs = [db executeQuery:@"SELECT * FROM HDMProduct WHERE watchTime*1 > 10086 ORDER BY watchTime*1 DESC"];
//        while ([rs next])
//        {
//            HDMProduct * model = [[HDMProduct alloc] initWithAttributes:[rs resultDictionary]];
//            
//            if (model.watchTime.integerValue>today)
//            {
//                [self.todayContextList addObject:model];
//            }
//            else if (model.watchTime.integerValue>week)
//            {
//                [self.weekContextList addObject:model];
//            }
//            else
//            {
//                [self.agoContextList addObject:model];
//            }
//            NSLog(@"name:%@",model.opus_name);
//        }
//        
//        NSLog(@"self.todayContextList:%d",[self.todayContextList count]);
//        
//        NSLog(@"self.weekContextList :%d",[self.weekContextList count]);
//        
//        NSLog(@"self.agoContextList:%d", [self.agoContextList count]);
//        
//        NSLog(@"");
//    
//        success(@{@"code": @"0", @"msg": @"操作成功"});
//    }];
}


- (void)refreshSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;{
    
    self.agoContextList = [NSMutableArray array];
    self.weekContextList = [NSMutableArray array];
    self.todayContextList = [NSMutableArray array];
    
    [super refreshSuccess:success Failure:failure];
}


@end
