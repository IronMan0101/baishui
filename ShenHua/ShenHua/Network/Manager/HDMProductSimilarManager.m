//
//  HDMProductSelManager.m
//  HDMProject
//
//  Created by gyfd on 14-10-31.
//
//

#import "HDMProductSimilarManager.h"
#import "HDMNetwork.h"
#import "HDMProduct.h"

@implementation HDMProductSimilarManager

- (instancetype)init {
    
    if (self = [super init])
    {
        self.contentRecom = [[NSMutableArray alloc] init];
        self.contentGuess = [[NSMutableArray alloc] init];
    }
    
    return self;
}
- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
       NSLog(@"chann_id:%@,opus_id:%@",self.chann_id,self.opus_id);
    
    
    [[HDMNetwork sharedInstance] query_detail_recom_opus_list:self.chann_id Opus_id:self.opus_id  Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {

            
            NSArray * array = [responseObject objectForKey:@"recom_list"];
            for (NSDictionary * dictionary in array)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMProduct * productRecom = [[HDMProduct alloc] initWithAttributes:attributes];
                [self.contentRecom addObject:productRecom];
            }
            
            
            NSArray * arrayGuess = [responseObject objectForKey:@"guess_list"];
            for (NSDictionary * dictionaryGuess in arrayGuess)
            {
                NSMutableDictionary * attributesGuess = [NSMutableDictionary dictionaryWithDictionary:dictionaryGuess];
                
                HDMProduct * productGuess = [[HDMProduct alloc] initWithAttributes:attributesGuess];
                [self.contentGuess addObject:productGuess];
            }

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

@end
