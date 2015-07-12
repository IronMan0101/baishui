
#import "HDMNetwork.h"
#import "PCCommonTypes.h"
#import <Foundation/Foundation.h>

@class HDMProduct;


/*!
 * 和动漫--作品--话/集
 */
@interface HDMSection : BCModel
{
    NSArray * _orderList;
    
    NSString * _sectionTag;
    
    
    long long _downloadBytes;
    
    NSString * _fileSize;
    NSString * _downloadProgress;
}
@property (nonatomic, assign) BOOL isFromPlayer; //silence 是否是来自播放
@property (nonatomic, copy) NSString * content_id;
@property (nonatomic, copy) NSString * content_name;
@property (nonatomic, copy) NSString * index_id;
@property (nonatomic, copy) NSString * is_free;
@property (nonatomic, copy) NSString * myrow;
@property (nonatomic, copy) NSString * next_content_id;
@property (nonatomic, copy) NSString * pkg_size;
@property (nonatomic, copy) NSString * plugin_type;
@property (nonatomic, copy) NSString * quality;
@property (nonatomic, copy) NSString * source;
@property (nonatomic, copy) NSString * orderStatus; //silence 订购状态

/*Player*/
@property (nonatomic, copy) NSString * thumbimg_url;
@property (nonatomic, copy) NSString * mark_value;
@property (nonatomic, copy) NSString * total_page;
@property (nonatomic, copy) NSString * url_path;

@property (nonatomic, copy) NSString * page;//用于添加书签

@property (nonatomic, copy) NSString * chann_id;
@property (nonatomic, copy) NSString * opus_id;

@property (nonatomic, copy) NSString * prev_quality_support;
@property (nonatomic, copy) NSString * quality_support;
@property (nonatomic, copy) NSString * next_quality_support;
@property (nonatomic, copy) NSString * is_subscribe;
@property (nonatomic, copy) NSString * last_content_name;
@property (nonatomic, copy) NSString * prev_is_clear;
@property (nonatomic, copy) NSString * opus_wap_url;
@property (nonatomic, copy) NSString * share_text;
@property (nonatomic, copy) NSString * prev_content_quality;
@property (nonatomic, copy) NSString * is_favor;

@property (nonatomic, copy) NSString * pkg_h_size;
@property (nonatomic, copy) NSString * pkg_hd_size;

/*!
 *  鉴权地址
 */
@property (nonatomic, copy) NSString * url;
@property (nonatomic, copy) NSString * cp_id;
@property (nonatomic, copy) NSString * is_flow;
@property (nonatomic, copy) NSString * prev_is_hdmi;
@property (nonatomic, copy) NSString * subscribe;
@property (nonatomic, copy) NSString * prev_content_id;
@property (nonatomic, copy) NSString * is_egg;
@property (nonatomic, copy) NSString * next_is_flow;
@property (nonatomic, copy) NSString * is_next_content_free;
@property (nonatomic, copy) NSString * opus_name;
@property (nonatomic, copy) NSString * is_hdmi;
@property (nonatomic, copy) NSString * eggs;
@property (nonatomic, copy) NSString * flowers;
@property (nonatomic, copy) NSString * has_other_quality;
@property (nonatomic, copy) NSString * opus_url;
@property (nonatomic, copy) NSString * next_is_clear;
@property (nonatomic, copy) NSString * share;
@property (nonatomic, copy) NSString * prev_is_flow;
@property (nonatomic, copy) NSString * next_content_quality;
@property (nonatomic, copy) NSString * is_prev_content_free;
@property (nonatomic, copy) NSString * isCanUse;
@property (nonatomic, copy) NSString * is_flower;
@property (nonatomic, copy) NSString * sum_count;
@property (nonatomic, copy) NSString * is_clear;
@property (nonatomic, copy) NSString * next_is_hdmi;
@property (nonatomic, copy) NSString * favor;
@property (nonatomic, copy) NSString * watchstate;

@property (nonatomic, copy) NSString * pkg_bd_size;
@property (nonatomic, copy) NSString * pkg_ultra_size;
//@property (nonatomic, copy) NSString * ;
//@property (nonatomic, copy) NSString * ;
//@property (nonatomic, copy) NSString * ;
//@property (nonatomic, copy) NSString * ;
//@property (nonatomic, copy) NSString * ;
//@property (nonatomic, copy) NSString * ;
//@property (nonatomic, copy) NSString * ;
//@property (nonatomic, copy) NSString * ;

- (void)changeWatchState:(HDMWatchState)watchState;
- (HDMWatchState)obtainWatchState;

@property (nonatomic, copy) NSString * next_is_ultra;
@property (nonatomic, copy) NSString * next_is_bd;
@property (nonatomic, copy) NSString * is_bd;
@property (nonatomic, copy) NSString * prev_is_ultra;
@property (nonatomic, copy) NSString * prev_is_bd;
@property (nonatomic, copy) NSString * is_ultra;

@property (nonatomic, copy) NSString * sectionTag;

@property (nonatomic, copy) NSString * downloadQuality;


@property (nonatomic, assign) BOOL  bAsc;          //是否升序

- (NSString *)watch_type;

- (NSArray *)orderList;

/*!
 *  最近观看时间
 */
@property (nonatomic, copy) NSString * watchTime;

/*!
 *  0:没选择
 *  1:被选择
 *  2:下载不可选
 */

@property (nonatomic, assign) BOOL checkEnable;

@property (nonatomic, copy) NSNumber * isChanged;

@property (nonatomic, assign) long long downloadBytes;

/*下载部分*/
@property (nonatomic, copy) NSString * fileName;
@property (nonatomic, copy) NSString * fileSize;//文件大小

- (void)changeDownloadStatus:(BCDownloadStatus)status;
- (void)changeOrderStatus:(BCOrderStatus)status; //silence 20150403
@property (nonatomic, copy) NSString * downloadStatus;//下载状态
@property (nonatomic, copy) NSString * downloadProgress;//下载进度


#pragma mark - Method -

/*!
 * 添加书签
 */
- (void)bookmarkAddSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

@property (nonatomic, assign) HDMWatchType watchType;//watch_type
//@property (nonatomic, copy) NSString * watch_type;
/*!
 *  单话鉴权
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)authSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;
- (void)syncAuthSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

@property (nonatomic, copy) NSString * isorder;
/*!
 *  查询单话是否订购
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)isOrderQuerySuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

- (void)bugOrder:(NSDictionary *)order Success:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

- (BOOL)judgeSectionIsFree;


- (HDMWatchType)watchTypeInDownload:(BOOL)yesOrNo;



@property (nonatomic, copy) NSString * typeString;


#pragma mark - property -


@end
