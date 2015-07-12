//
//  HDMChannelReMenFirstManager.m
//  HDMProject
//
//  Created by suzq on 14-10-10.
//
//

#import "HDMChannelReMenFirstManager.h"
#import "HDMProduct.h"
#import "HDMNetwork.h"
#import "Cache.h"

@implementation HDMChannelReMenFirstManager


- (instancetype)initWithParameter:(NSDictionary *)parameter
{
    self=[super initWithParameter:parameter];
    self.arryBanner=[[NSMutableArray alloc] init];
    
    return self ;
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
    
    
    //banner数据  recom_list
    NSArray * arrayBanner = [responseObject objectForKey:@"recom_list"];//修改一处
    for (NSDictionary * dictionary in arrayBanner)
    {
        NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
        
        HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改二处
        //[model updateModel];//??
        [self.arryBanner addObject:model];
    }

    
    //底部更多数据
    NSArray * array = [responseObject objectForKey:@"list"];
    if([array isKindOfClass:[NSArray class]])
    {
        if([array count]>0)
        {
            NSDictionary * dicList = [array objectAtIndex:0];
            NSArray * array2 = [dicList objectForKey:@"list"];//修改一处
            for (NSDictionary * dictionary in array2)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMProduct * model = [[HDMProduct alloc] initWithAttributes:attributes];//修改二处
                
                [self.contextList addObject:model];
            }
            self.totalItem = [[dicList objectForKey:@"sum_line"] integerValue];
            self.totalPage = [[dicList objectForKey:@"sum_page"] integerValue];
            
            //
            
            NSLog(@"self.totalPage:%d,self.totalItem %d",self.totalPage,self.totalItem );
            success(codeMsg);
        }
    }
}

- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure
{
    
    
    [[HDMNetwork sharedInstance] query_new_recomm_opus_list_GET_Chann_id:BCIntegerString(self.channel) Page_size:BCIntegerString(self.pageSize) Success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        //其他处理
        if (![code boolValue])
        {
            //缓存数据
//            NSData *channelData = [NSKeyedArchiver archivedDataWithRootObject:responseObject];
//            NSString *channel_cacheKey = [CacheSymbolArray objectAtIndex:Cache_Comic_Tag];
//            if(self.channel == HDMDongHuaChannel)
//                channel_cacheKey = [CacheSymbolArray objectAtIndex:Cache_Animate_Tag];
//            [[CacheManager sharedManager] cachedWithData:channelData theKey:channel_cacheKey];
//            [[CacheManager sharedManager] storeToDisk];
            
            [self refreshData:task Obj:responseObject Success:success Failure:failure];
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
