
#import "HDMRecommendProductManager.h"
#import "HDMNetwork.h"
#import "HDMProduct.h"
//#import "CacheManager.h"
#import "Cache.h"


@implementation HDMRecommendProductManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    static BOOL result = NO;
    if (!result)
    {
        result = YES;
        [[HDMNetwork sharedInstance] query_manshang_recomm_GET_Success:^(NSURLSessionDataTask *task, id responseObject) {
            
            result = NO;
            NSString * msg = [responseObject objectForKey:@"msg"];
            NSString * code = [responseObject objectForKey:@"code"];
            NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
            //其他处理
            if (![code boolValue])
            {
                //缓存数据
//                NSData *recommendData = [NSKeyedArchiver archivedDataWithRootObject:responseObject];
//                [[CacheManager sharedManager] cachedWithData:recommendData theKey:[CacheSymbolArray objectAtIndex:Cache_Recommend_Tag]];
//                [[CacheManager sharedManager] storeToDisk];

                //根据数据刷新界面等
                [self refreshData:task Obj:responseObject Success:success Failure:failure];
            }
            else
            {
                failure(codeMsg);
            }
            
        } Failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            result = NO;
   //        //failure([BCAlertText networkErrorDictionary:error]);
        }];
    }
}

/**
 *	@brief	网络连接完成/缓存读取完成 数据使用
 *
 *	@param 	task 
 *	@param 	responseObject 	网络数据或缓存数据
 *
 *	@return
 *
	@author	silence
 */
- (void)refreshData:(NSURLSessionDataTask *)task Obj:(id)responseObject Success:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure

{
    NSString * msg = [responseObject objectForKey:@"msg"];
    NSString * code = [responseObject objectForKey:@"code"];
    NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
    
    self.banner_list = [[NSMutableArray alloc] init];
    NSArray * array0 = [responseObject objectForKey:@"banner_list"];
    for (NSDictionary * dictionary in array0)
    {
        NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
        
        HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改一处
        
        [self.banner_list addObject:model];
    }
    
    NSArray * array1 = [responseObject objectForKey:@"adv_list"];
    for (NSDictionary * dictionary in array1)
    {
        NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
        
        HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改一处
        [self.adv_list addObject:model];
    }
    
    self.adv_list2 = [[NSMutableArray alloc] init];
    NSArray * array2 = [responseObject objectForKey:@"adv_list2"];
    for (NSDictionary * dictionary in array2)
    {
        NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
        
        HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改一处
        [self.adv_list2 addObject:model];
    }
    
    NSArray * array3 = [responseObject objectForKey:@"heyule_list"];
    for (NSDictionary * dictionary in array3)
    {
        NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
        
        HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改一处
        [self.heyule_list addObject:model];
    }
    
    self.chann_list2 = [[NSMutableArray alloc] init];
    self.chann_list4 = [[NSMutableArray alloc] init];
    
    NSArray * array00 = [responseObject objectForKey:@"chann_list"];
    for (NSDictionary * channelDictionary in array00)
    {
        NSInteger chann_id = [[channelDictionary objectForKey:@"chann_id"] integerValue];
        
        switch (chann_id)
        {
            case 2:
            {
                self.mh_update_count = [channelDictionary objectForKey:@"update_count"];
            }break;
                
            case 4:
            {
                self.dh_update_count = [channelDictionary objectForKey:@"update_count"];
            }break;
                
            default:
                break;
        }
        NSArray * array = [channelDictionary objectForKey:@"list"];
        for (NSDictionary * dictionary in array)
        {
            NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
            
            HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改一处
            
            switch (chann_id) {
                case 2:
                {
                    [self.chann_list2 addObject:model];
                }break;
                    
                case 4:
                {
                    [self.chann_list4 addObject:model];
                }break;
                    
                case 5:
                {
                    [self.chann_list5 addObject:model];
                }break;
                    
                case 7:
                {
                    [self.chann_list7 addObject:model];
                }break;
                    
                case 13:
                {
                    [self.chann_list13 addObject:model];
                }break;
                    
                default:
                    break;
            }
        }
    }
    success(codeMsg);
}

@end
