
#import <Foundation/Foundation.h>

@class HDMSection;

/*!
 * 和动漫--作品
 */
@interface HDMProduct : BCModel
{
    NSMutableArray * _bookmarkArray;
}




@property (nonatomic, copy) NSString * downloadProgress;//下载进度
@property (nonatomic, copy) NSString * cacheFlag; //是否是缓存

@property (nonatomic, copy) NSString * chann_id;
@property (nonatomic, copy) NSString * opus_attention;
@property (nonatomic, copy) NSString * opus_desc;
@property (nonatomic, copy) NSString * opus_id;
@property (nonatomic, copy) NSString * opus_name;
@property (nonatomic, copy) NSString * opus_remark;
@property (nonatomic, copy) NSString * opus_url;
@property (nonatomic, copy) NSString * status_value;
@property (nonatomic, copy) NSString * sum_count;
@property (nonatomic, copy) NSString * link_type;
@property (nonatomic, copy) NSString * wap_url;
@property (nonatomic, copy) NSString * whole_order_id;
@property (nonatomic, copy) NSString * view_type;
@property (nonatomic, copy) NSString * opus_wap_url;
@property (nonatomic, copy) NSString * weibo_share;
@property (nonatomic, copy) NSString * share_text;
@property (nonatomic, copy) NSString * mes_share;
@property (nonatomic, copy) NSString * is_favor;
@property (nonatomic, copy) NSString * subscribe;
@property (nonatomic, copy) NSString * hw_content_id;
@property (nonatomic, copy) NSString * is_egg;
@property (nonatomic, copy) NSString * opus_notice;
@property (nonatomic, copy) NSString * cp_name;
@property (nonatomic, copy) NSString * tag_value;
@property (nonatomic, copy) NSString * eggs;
@property (nonatomic, copy) NSString * comment_num;
@property (nonatomic, copy) NSString * menu_type;
@property (nonatomic, copy) NSString * is_support_whole_order; //是否支持按本订购 1.是 0.非
@property (nonatomic, copy) NSString * is_whole_ordered; //是否已按本订购 1.是 0.非
@property (nonatomic, copy) NSString * flowers;
@property (nonatomic, copy) NSString * isPoint;
@property (nonatomic, copy) NSString * share;
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * product_money;
@property (nonatomic, copy) NSString * is_flower;
@property (nonatomic, copy) NSString * author_name;
@property (nonatomic, copy) NSString * update_time;
@property (nonatomic, copy) NSString * favor;
@property (nonatomic, copy) NSString * attention;
@property (nonatomic, copy) NSString * is_subscribe;
@property (nonatomic, copy) NSString * last_content_name;
@property (nonatomic, copy) NSString * opus_des;
@property (nonatomic, copy) NSString * myrow;



@property (nonatomic, copy) NSString * is_need_login;
@property (nonatomic, copy) NSString * order_id;
@property (nonatomic, copy) NSString * is_mm_opus;
@property (nonatomic, copy) NSString * mm_tip_content;

@property (nonatomic,copy)  NSString * class_name;//类别

/*search*/
@property (nonatomic, copy) NSString * upd_time;
@property (nonatomic, copy) NSString * opus_url_720404;
@property (nonatomic, copy) NSString * content_id;
@property (nonatomic, copy) NSString * isruanyin;

@property (nonatomic, strong) NSSet * sections;

//收藏
@property (nonatomic, copy) NSString * favor_id;

@property (nonatomic, copy) NSString * comment_content;//用于提交评论


//下载
@property (nonatomic, copy) NSString * inDownload;
@property (nonatomic, copy) NSString * timeDownload;


- (NSString *)detailStatusString;


@property (nonatomic, assign) NSInteger submitEggCount;
@property (nonatomic, assign) NSInteger submitFlowerCount;

@property (nonatomic, copy) NSString * demand_url;
/*!
 *  本地下载界面
 */
@property (nonatomic, assign) BOOL isCheck_Download;


- (NSDictionary *)hadDownloaded;

- (void)eggSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;
- (void)flowerSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

/*!
 * 提交评论
 * 赋值给comment_content
 */
- (void)commentSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

- (void)favorSubmitSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;
- (void)favorCancelSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

- (void)detailQuerySuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

//查询作品额外信息 add  by  suzq  比如 收藏状态  2014.11.27
- (void)detailSelSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

@property (nonatomic, copy) NSString * spending_tip;
@property (nonatomic, copy) NSString * spending_type;
- (void)spendingTipSuccess:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;


/*!
 *  最近观看时间
 */
@property (nonatomic, copy) NSString * watchTime;



#pragma mark - Download -
/*!
 *  hasDownloadNumber:已下载数量
 *  hasDownloadSize:已下载大小
 *  downloadStatus:下载状态
 *  downloadNumber:下载数量
 *
 *  @return 下载信息
 */
- (NSDictionary *)downloadDictionary;

@property (nonatomic, copy) NSString * updateTime;
@property (nonatomic, copy) NSString * downloadingId;





/*!
 *  添加下载话集
 *
 *  @param section <#section description#>
 */
- (HDMSection *)addDownloadSection:(HDMSection *)section;

/*!
 *  暂停下载话集
 *
 *  @param section <#section description#>
 */
- (void)pauseDownloadSection:(HDMSection *)section;

/*!
 *  下载数目
 *
 *  @return <#return value description#>
 */
- (NSInteger)waitDownloadSectionNumber;

/*!
 *  删除下载话集
 *
 *  @param section <#section description#>
 */
- (void)deleteDownloadSection:(HDMSection *)section;




/*!
 *  未完成下载的任务数
 *
 *  @return <#return value description#>
 */
- (NSInteger)unDownloadSectionNumber;

- (NSArray *)obtainPauseFailDownloadSectionList;


- (NSDictionary *)haveDownload;

- (NSString *)percentageDownloadProgress;

- (HDMSection *)downloadNextSection;





#pragma mark - 数据下载 -

/*!
 *  <#Description#>
 */
- (NSArray *)obtainDownloadSectionList;

@property (nonatomic, strong) NSMutableArray * m_downloadSectionList;









#pragma mark - 下载功能 -

- (void)changeSectionDownloadStatus:(BCDownloadStatus)status;

@end
