
#import <Foundation/Foundation.h>
/*!
 * 和动漫--推荐--作品管理器
 */
@interface HDMRecommendProductManager : BCManager
{
    
}

@property (nonatomic, strong) NSMutableArray *banner_list;//滚动广告作品
@property (nonatomic, strong) NSMutableArray *adv_list;//热门营销作品
@property (nonatomic, strong) NSMutableArray *adv_list2;//四格分布作品

@property (nonatomic, strong) NSMutableArray *chann_list2;//漫画
@property (nonatomic, strong) NSMutableArray *chann_list4;//动画
@property (nonatomic, strong) NSMutableArray *chann_list5;//教育
@property (nonatomic, strong) NSMutableArray *chann_list7;//绘本
@property (nonatomic, strong) NSMutableArray *chann_list13;//彩漫

@property (nonatomic, strong) NSMutableArray *heyule_list;//和娱乐作品


@property (nonatomic, copy) NSString * mh_update_count;
@property (nonatomic, copy) NSString * dh_update_count;

- (void)refreshData:(NSURLSessionDataTask *)task Obj:(id)responseObject Success:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;


@end
