//
//  HDMSectionOrderManager.m
//  PCCommon
//
//  Created by Sea on 14-7-25.
//
//

#import "HDMSectionOrderManager.h"
#import "HDMSection.h"
#import "HDMOrder.h"

@implementation HDMSectionOrderManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
    
    [[HDMNetwork sharedInstance] new_auth_order_relation_POST_Chann_id:self.section.chann_id Opus_id:self.section.opus_id Content_id:self.section.content_id Quality:self.section.quality Watch_type:[self.section watch_type] Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSArray * array = [responseObject objectForKey:@"list"];//修改一处
            for (NSDictionary * dictionary in array)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMOrder * model = [[HDMOrder alloc] initWithAttributes:attributes];//修改二处
                model.chann_id = self.section.chann_id;
                model.opus_id = self.section.opus_id;
                model.content_id = self.section.content_id;
                
                //[model save];
                [self.contextList addObject:model];
            }
            
            NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:responseObject];//修改一处
            [attributes removeObjectForKey:@"list"];
            [attributes removeObjectForKey:@"code"];
            [attributes removeObjectForKey:@"msg"];
            
            [self.section propertyWithAttributes:attributes];
            
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
       //failure([BCAlertText networkErrorDictionary:error]);
    }];
}

/*- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
    [[[BCDatabase sharedInstance] queue] inDatabase:^(FMDatabase *db) {
        
        FMResultSet * rs = [db executeQuery:@"select * from HDMOrder where content_id = ?", self.section.content_id];
        while ([rs next]) {
            HDMOrder * model = [[HDMOrder alloc] initWithAttributes:nil];
            NSMutableArray * propertyNameArray = [[NSMutableArray alloc] initWithArray:[[model class] propertyNameArray]];
            [propertyNameArray addObject:@"modelTag"];
            
            for (NSString *key in propertyNameArray)
            {
                @try
                {
                    NSLog(@"key: %@", key);
                    if ([key isEqualToString:@"modelTag"])
                    {
                        int object = [rs intForColumn:key];
                        [model setValue:[NSNumber numberWithInt:object] forKey:key];
                    }
                    else
                    {
                        id object = [rs stringForColumn:key];
                        if (!(object==nil || [object isKindOfClass:[NSNull class]]))
                        {
                            [model setValue:object forKey:key];
                        }
                    }
                }
                @catch (NSException *exception)
                {
                    NSLog(@"exception key: %@", key);
                    NSLog(@"exception:%@", exception);
                }
                @finally
                {
                    ;
                }
            }
            
            [self.contextList addObject:model];
        }
    }];
    
    success(nil);
}*/


@end
