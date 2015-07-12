//
//  HDMPackage.m
//  User
//
//  Created by Sea on 14-6-4.
//
//

#import <objc/runtime.h>

#import "HDMPackage.h"
#import "HDMNetwork.h"
@implementation HDMPackage


- (void)spendingTipSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    [[HDMNetwork sharedInstance] query_package_spend_tip_GET_Product_money:self.productPrice Is_point:self.isPoint Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            // spending_type
            self.spending_tip = [[responseObject objectForKey:@"info"] objectForKey:@"spending_tip"];
            
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
      //  //failure([BCAlertText networkErrorDictionary:error]);
    }];
}

- (void)orderSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
    
    [[HDMNetwork sharedInstance] subscribe_productOfPackage_POST_Product_ids:@[self.productId] Product_type:self.productType Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, id responseObject) {
        
      //  failure([BCAlertText networkErrorDictionary:responseObject]);
    }];
}


- (void)unsubscribeSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
    
    [[HDMNetwork sharedInstance] unSubscribe_product_POST_Product_id:self.productId Product_type:self.productType Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        ;
    }];
}


- (NSString *)descriptiontT;{
    
    NSMutableString * description = [NSMutableString string];
    
    unsigned int outCount, i;
    
    objc_property_t * properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        const char * propName = property_getName(property);
        if (propName)
        {
            NSString * propertyName = [NSString stringWithUTF8String:propName];
            [description appendFormat:@"%@: %@\n", propertyName, [self valueForKey:propertyName]];
        }
    }
    free(properties);
    
    return description;
}


@end
