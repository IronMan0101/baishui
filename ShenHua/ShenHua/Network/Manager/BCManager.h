
#import <Foundation/Foundation.h>

@class BCDatabaseQueue;

#define kInitPageSize 15    // 初始分页数
#define kInitCurrentPage 1  // 初始页面

/*!
 *  模型控制管理器
 */
@interface BCManager : NSObject
{
    
}

/*!
 *  当前页码
 */
@property (nonatomic, assign) NSInteger currentPage;

/*!
 *  总页码
 */
@property (nonatomic, assign) NSInteger totalPage;

/*!
 * 分页数
 */
@property (nonatomic, assign) NSInteger pageSize;

/*!
 * 总条数
 */
@property (nonatomic, assign) NSInteger totalItem;

/*!
 * 内容列表
 */
@property (nonatomic, strong) NSMutableArray *contextList;

/*!
 * 升序排列
 */
@property (nonatomic) BOOL ascend;

/*!
 *  <#Description#>
 */
@property (nonatomic) BOOL isFinish;


#pragma mark - Method

- (instancetype)initWithParameter:(NSDictionary *)parameter;

/*!
 * @override
 * 请求内容接口
 * 先从数据库中查找返回,网络接口查找返回(二次返回原则)
 */
- (void)enquiryListSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

/*!
 * 重新刷新内容
 */
- (void)refreshSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

/*!
 * 加载更多内容
 */
- (void)loadMoreSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

/*!
 *  重新请求
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)reloadSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;


+ (BCDatabaseQueue *)classDatabaseQueue;

@end
