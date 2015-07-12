//
//  BCManager.m
//  
//
//  Created by Sea on 14-5-23.
//
//

#import "BCManager.h"
#import "FMDatabaseQueue.h"


typedef enum {
    
    BCManagerRefreshOperation,
    BCManagerLoadMoreOperation,
}BCManagerOperationType;


@interface BCManager ()
{
    NSInteger _type;
}

@end


@implementation BCManager


+ (FMDatabaseQueue *)classDatabaseQueue;{
    
    static NSMutableDictionary * mutableDictionary = nil;
    if (!mutableDictionary)
    {
        mutableDictionary = [NSMutableDictionary dictionary];
    }
    
    NSString * directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * path = [directory stringByAppendingPathComponent:@"HDMApplicationDatabase.sqlite"];
    
    
    FMDatabaseQueue * queue = [mutableDictionary objectForKey:NSStringFromClass([self class])];
    if (!queue)
    {
        queue = [FMDatabaseQueue databaseQueueWithPath:path];
        [mutableDictionary setObject:queue forKey:NSStringFromClass([self class])];
    }
    //add by silence 20150625
   // [DBTool addSkipBackupAttributeToItemAtPath:path];
    return queue;
}


- (instancetype)init {
    
    if (self = [super init])
    {
        self.contextList = [[NSMutableArray alloc] init];
        self.currentPage = kInitCurrentPage;
        self.pageSize = kInitPageSize;
        self.ascend = YES;
    }
    
    return self;
}

- (instancetype)initWithParameter:(NSDictionary *)parameter {
    
    self = [super init];
    if (self)
    {
        self.contextList = [[NSMutableArray alloc] init];
        self.currentPage = kInitCurrentPage;
        self.pageSize = kInitPageSize;
        self.ascend = YES;
        
        for (NSString * key in [parameter allKeys])
        {
            [self setValue:[parameter valueForKey:key] forKey:key];
        }
    }
    
    return self;
}

- (void)enquiryListSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
}

/*!
 * 重新刷新内容
 */
- (void)refreshSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    _type = BCManagerRefreshOperation;
    
    self.currentPage = kInitCurrentPage;
    self.contextList = [NSMutableArray array];
    [self enquiryListSuccess:success Failure:failure];
}

/*!
 * 加载更多内容
 */
- (void)loadMoreSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure {
    
    _type = BCManagerLoadMoreOperation;
    
    self.currentPage++;
    if (self.currentPage>self.totalPage)
    {
        self.isFinish = YES;
        self.currentPage = self.totalPage;
        
        success(@{@"code": @"10086",
                  @"msg": @"到底了哦！"});
    }
    else
    {
        [self enquiryListSuccess:success Failure:failure];
    }
}


- (void)reloadSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;{
    
    switch (_type)
    {
        case BCManagerRefreshOperation:
        {
            [self refreshSuccess:success Failure:failure];
        }break;
            
        case BCManagerLoadMoreOperation:
        {
            [self loadMoreSuccess:success Failure:failure];
        }break;
            
        default:
            break;
    }
}

- (void)dealloc
{
    self.contextList = nil;
}

@end
