
#import <Foundation/Foundation.h>
#import <Mantle.h>

/*
 * Mantle模型
 */
@interface BCModel : MTLModel<MTLJSONSerializing>
{
    
}


/** 解决json返回带有脏数据
 *  {
 *    "copyToChina": null
 *  }
 *
 */
- (void)setNilValueForKey:(NSString *)key;


/**
 *  iOS中处理URL使用的是NSURL类型，但JSON只支持基本的字符串
 *
 */
+ (NSValueTransformer *)URLJSONTransformer;














+ (instancetype)testInstance;

/*!
 *  数据是否发现变化
 */
@property (nonatomic, assign) BOOL isChanged;

/*!
 * 模型键值
 */
@property (nonatomic, strong) NSNumber * modelTag;

/*!
 *  <#Description#>
 */
@property (nonatomic, strong, readonly) NSDictionary *attributes;


#pragma mark - Method

/*!
 *  初始化方法
 *
 *  @param instancetype <#instancetype description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithAttributes:(NSDictionary *)attributes;

/*
 关联请求重新发起
 */
@property (nonatomic, assign) BOOL reloadRequest;

@property (nonatomic, assign) BOOL isChecked;


/*
 * 属性重新赋值
 * if you need, you can override this method
 */
- (void)propertyWithAttributes:(NSDictionary *)attributes;

/*!
 *  给部分属性赋值
 *
 *  @param attributes <#attributes description#>
 *  @param keys       <#keys description#>
 */
- (void)propertyWithAttributes:(NSDictionary *)attributes andKeys:(NSArray *)keys;

- (void)do_afterPropertyWithAttributes;


@end
