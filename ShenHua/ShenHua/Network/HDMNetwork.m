
#import "HDMNetwork.h"
#import "HDMClient.h"
#import "PCCommonDefines.h"


@implementation HDMNetwork


+ (instancetype)sharedInstance {
    
    static HDMNetwork * instance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{instance = [[self alloc] init];});
    
    return instance;
}


- (void)setClientInitParameter:(NSDictionary *)parameter {
    
    [HDM_Client propertyWithAttributes:[parameter objectForKey:@"user_info"]];
    [HDM_Client propertyWithAttributes:[parameter objectForKey:@"advertise"]];
    [HDM_Client propertyWithAttributes:[parameter objectForKey:@"bracket_info"]];
}


#pragma mark - P01 漫画
/*!
 * 1.0 查询应景图
 * query_picture_show_time
 *
 */
- (void)query_picture_show_time_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure
{
    [self APIName_MethodGET_APIParameters:@[@"query_picture_show_time",success, failure]];
}

/*!
 * 1.1 查询热门作品列表接口
 * query_recomm_opus_list
 * 如果chann_id 为6（主题）没有recom_list
 */
- (void)query_recomm_opus_list_GET_Chann_id:(NSString *)chann_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_recomm_opus_list", @{@"chann_id": chann_id}, success, failure]];
}

/*!
 * 1.2 查询热门作品列表接口
 * query_new_recomm_opus_list
 */
- (void)query_new_recomm_opus_list_GET_Chann_id:(NSString *)chann_id Page_size:(NSString *)page_size
                                        Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_new_recomm_opus_list", @{@"chann_id": chann_id,
                                                                             @"page_size": page_size}, success, failure]];
}

/*!
 * 1.3 查询绘本热门作品列表接口（暂开发）
 * query_new_qxs_recomm_opus_list
 */
- (void)query_new_qxs_recomm_opus_list_GET_Page_size:(NSString *)page_size Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_new_qxs_recomm_opus_list", @{@"page_size": page_size}, success, failure]];
}

/*!
 * 1.4 查询首页作品更多列表接口
 * query_recomm_opus_more_list
 */
- (void)query_recomm_opus_more_list_GET_Chann_id:(NSString *)chann_id Node_id:(NSString *)node_id
                                        Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                         Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_recomm_opus_more_list", @{@"chann_id": chann_id,
                                                                              @"node_id": node_id,
                                                                              @"cur_page": cur_page,
                                                                              @"page_size": page_size}, success, failure]];
}

/*!
 * 1.5 查询新品作品列表
 * query_new_opus_list
 */
- (void)query_new_opus_list_GET_Chann_id:(NSString *)chann_id Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                 Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_new_opus_list", @{@"chann_id": chann_id,
                                                                      @"cur_page": cur_page,
                                                                      @"page_size": page_size}, success, failure]];
}

/*!
 * 1.6 查询排行列表接口
 * query_rank_opus_list
 */
- (void)query_rank_opus_list_GET_Chann_id:(NSString *)chann_id
                                  Rank_id:(NSString *)rank_id Order_by:(NSString *)order_by
                                 Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                  Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_rank_opus_list", @{@"chann_id": chann_id,
                                                                       @"rank_id": rank_id,
                                                                       @"order_by": order_by,
                                                                       @"cur_page": cur_page,
                                                                       @"page_size": page_size}, success, failure]];
}

/*!
 * 1.7 获取分类查询条件列表接口
 * query_class_list
 */
- (void)query_class_list_GET_Chann_id:(NSString *)chann_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_class_list", @{@"chann_id": chann_id}, success, failure]];
}

/*!
 * 1.8 查询分类作品列表接口
 * query_class_opus_list
 */
- (void)query_class_opus_list_GET_Chann_id:(NSString *)chann_id Class_ids:(NSDictionary *)class_ids
                                  Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                   Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] initWithDictionary:class_ids];
    [parameter setObject:chann_id forKey:@"chann_id"];
    [parameter setObject:cur_page forKey:@"cur_page"];
    [parameter setObject:page_size forKey:@"page_size"];
    
    [self APIName_MethodGET_APIParameters:@[@"query_class_opus_list", parameter, success, failure]];
}


#pragma mark - P02 详细页

/*!
 * 2.1 查询动画、漫画详细信息接口（包含目录）
 * query_opus_detail_with_menu
 */
- (void)query_opus_detail_with_menu_GET_Chann_id:(NSString *)chann_id
                                         Opus_id:(NSString *)opus_id Order_by:(NSString *)order_by
                                        Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                         Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_opus_detail_with_menu", @{@"chann_id": chann_id,
                                                                              @"opus_id": opus_id,
                                                                              @"order_by": order_by,
                                                                              @"cur_page": cur_page,
                                                                              @"page_size": page_size}, success, failure]];
}

- (void)query_opus_detail_GET_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id
                               Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_opus_detail_with_menu", @{@"chann_id": chann_id,
                                                                              @"opus_id": opus_id,
                                                                              @"order_by": @"1",
                                                                              @"cur_page": @"1",
                                                                              @"page_size": @"1"}, success, failure]];
}

/*!
 * 2.2 查询作品额外信息
 * query_opus_extend_sel
 */
- (void)query_opus_extend_sel_GET_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id
                                   Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_opus_extend_sel", @{@"chann_id": chann_id,
                                                                        @"opus_id": opus_id}, success, failure]];
}

/*!
 * 2.3 收藏内容提交接口
 * favor_submit
 */
- (void)favor_submit_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id
                           Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"favor_submit", @{@"chann_id": chann_id,
                                                                @"opus_id": opus_id}, success, failure]];
}

/*!
 * 2.4 取消作品收藏接口(已发布)
 * cancel_opus_favor
 */
- (void)cancel_opus_favor_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id
                                Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"cancel_opus_favor", @{@"chann_id": chann_id,
                                                                     @"opus_id": opus_id}, success, failure]];
}

/*!
 * 2.5 扔鸡蛋
 * egg_submit
 */
- (void)egg_submit_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id
                         Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"egg_submit", @{@"chann_id": chann_id,
                                                              @"opus_id": opus_id}, success, failure]];
}

/*!
 * 2.6 送鲜花
 * flower_submit
 */
- (void)flower_submit_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id
                            Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"flower_submit", @{@"chann_id": chann_id,
                                                                 @"opus_id": opus_id}, success, failure]];
}

/*!
 * 2.7 查询作品目录页列表信息
 * query_opus_menu_list
 */
- (void)query_opus_menu_list_GET_Chann_id:(NSString *)chann_id
                                  Opus_id:(NSString *)opus_id Order_by:(NSString *)order_by
                                 Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                  Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_opus_menu_list", @{@"chann_id": chann_id,
                                                                       @"opus_id": opus_id,
                                                                       @"order_by": order_by,
                                                                       @"cur_page": cur_page,
                                                                       @"page_size": page_size}, success, failure]];
}

/*!
 * 2.8 查询作品评论信息列表(已发布)
 * query_comm_opus_list
 */
- (void)query_comm_opus_list_GET_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id
                                 Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                  Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_comm_opus_list", @{@"chann_id": chann_id,
                                                                       @"opus_id": opus_id,
                                                                       @"cur_page": cur_page,
                                                                       @"page_size": page_size}, success, failure]];
}

/*!
 * 2.9 评论信息提交接口(已发布)
 * comment_submit
 * 默认是需要审核
 */
- (void)comment_submit_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id Comment_content:(NSString *)comment_content
                             Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"comment_submit", @{@"chann_id": chann_id,
                                                                  @"opus_id": opus_id,
                                                                  @"comment_content": comment_content,
                                                                  @"is_check": @"0"}, success, failure]];
}

/*!
 * 2.10 我的书签提交接口
 * add_mark
 */
- (void)add_mark_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id Content_id:(NSString *)content_id Page:(NSString *)page
                       Quality:(NSString *)quality Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"add_mark", @{@"chann_id": chann_id,
                                                            @"opus_id": opus_id,
                                                            @"content_id": content_id,
                                                            @"page": page,
                                                            @"quality": quality}, success, failure]];
}

/*!
 * 2.11 分享提交接口(已发布)
 * share_submit
 */
- (void)share_submit_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id
                          Share_to:(NSString *)share_to Share_type:(NSString *)share_type
                           Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"share_submit", @{@"chann_id": chann_id,
                                                                @"opus_id": opus_id,
                                                                @"share_to": share_to,
                                                                @"share_type": share_type,}, success, failure]];
}

/*!
 * 2.12 轻小说收藏提交
 * qxs_favor_submit
 */
- (void)qxs_favor_submit_POST_Opus_id:(NSString *)opus_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"qxs_favor_submit", @{@"opus_id": opus_id}, success, failure]];
}

/*!
 * 2.13 轻小说书签提交
 * qxs_mark_submit
 */
- (void)qxs_mark_submit_POST_Opus_id:(NSString *)opus_id Content_id:(NSString *)content_id Mark_value:(NSString *)mark_value
                             Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"qxs_mark_submit", @{@"opus_id": opus_id,
                                                                   @"content_id": content_id,
                                                                   @"mark_value": mark_value}, success, failure]];
}


/*!
 * 2.14 同类作品推荐
 * query_detail_recom_opus_list
 */
- (void)query_detail_recom_opus_list:(NSString *)chann_id Opus_id:(NSString *)opus_id
                             Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"query_detail_recom_opus_list", @{@"chann_id": chann_id,
                                                                                @"opus_id": opus_id}, success, failure]];
}


#pragma mark - P03 鉴权订购

/*!
 * 3.1 套餐包按部订购提示查询
 * query_spend_tip
 */
- (void)query_spend_tip_GET_Product_type:(NSString *)product_type Product_money:(NSString *)product_money Is_point:(NSString *)is_point
                                 Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_spend_tip", @{@"product_type": product_type,
                                                                  @"product_money": product_money,
                                                                  @"is_point": is_point}, success, failure]];
}

/*!
 * 3.1.1 单部作品订购提示查询
 * query_opus_spend_tip
 */
- (void)query_opus_spend_tip_GET_Product_money:(NSString *)product_money Is_point:(NSString *)is_point
                                       Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    [self query_spend_tip_GET_Product_type:BCIntString(HDMProductMerchandise) Product_money:product_money Is_point:is_point Success:success Failure:failure];
}

/*!
 * 3.1.2 套餐包订购提示查询
 * query_package_spend_tip
 */
- (void)query_package_spend_tip_GET_Product_money:(NSString *)product_money Is_point:(NSString *)is_point
                                          Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self query_spend_tip_GET_Product_type:BCIntString(HDMPackageMerchandise) Product_money:product_money Is_point:is_point Success:success Failure:failure];
}

- (void)query_package_spend_tipForMB_GET_Product_money:(NSString *)product_money Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self query_package_spend_tip_GET_Product_money:product_money Is_point:@"1" Success:success Failure:failure];
}

- (void)query_package_spend_tipForNMB_GET_Product_money:(NSString *)product_money Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self query_package_spend_tip_GET_Product_money:product_money Is_point:@"0" Success:success Failure:failure];
}

/*!
 * 3.2 单话订购关系鉴权接口
 * auth_order_relation
 */
- (void)auth_order_relation_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id Content_id:(NSString *)content_id Quality:(NSString *)quality
                               Watch_type:(NSString *)watch_type Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"auth_order_relation", @{@"chann_id": chann_id,
                                                                       @"opus_id": opus_id,
                                                                       @"content_id": content_id,
                                                                       @"watch_type": watch_type,
                                                                       @"quality": quality}, success, failure]];
}

/*!
 * 3.3 查询单话是否订购
 * query_content_id_isorder
 */
- (void)query_content_id_isorder_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id Content_id:(NSString *)content_id
                                       Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"query_content_id_isorder", @{@"chann_id": chann_id,
                                                                            @"opus_id": opus_id,
                                                                            @"content_id": content_id}, success, failure]];
}

/*!
 * 3.4 单话鉴权接口（3.5.1以后使用）
 * new_auth_order_relation
 */
- (void)new_auth_order_relation_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id Content_id:(NSString *)content_id
                                      Quality:(NSString *)quality Watch_type:(NSString *)watch_type
                                      Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"new_auth_order_relation", @{@"chann_id": chann_id,
                                                                           @"opus_id": opus_id,
                                                                           @"content_id": content_id,
                                                                           @"watch_type": watch_type,
                                                                           @"quality": quality}, success, failure]];
}

/*!
 * 3.5 产品订购
 * subscribe_product
 */
- (void)subscribe_product_POST_Product_ids:(NSArray *)product_ids Opertion_type:(NSString *)opertion_type Product_type:(NSString *)product_type Content_id:(NSString *)content_id Opus_id:(NSString *)opus_id Chann_id:(NSString *)chann_id Spending_type:(NSString *)spending_type
                                   Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    NSString *product_id = [product_ids componentsJoinedByString:@"~"];
    //MDSP2000115599|501|0|1035701|11794|2
    NSString * encryptString = [NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@", product_id, opertion_type, product_type, content_id, opus_id, chann_id, spending_type];
    //对加密前的字符串做补位处理,补'#'满60位,保证加密后字符串长度为96
    for (int i=(int)encryptString.length; i<60; i++)
    {
        encryptString = [NSString stringWithFormat:@"%@%@", encryptString, @"#"];
    }
    //MDSP2000115599|501|0|1035701|11794|2########################
    //1406883293396
    //E86CC28CC3AC1602C2D00553FB982A24C762382BC6E0F72BC7263BACD5241626736FFC95C72B4FA8A0F633468A2AA54E8AB062B49A571D185FA9B78FD99144DB
    //E86CC28CC3AC1602C2D00553FB982A24C762382BC6E0F72BC7263BACD5241626736FFC95C72B4FA8A0F633468A2AA54E8AB062B49A571D185FA9B78FD99144DB
//    long long localTime = [[NSDate date] bc_microsecondTimeIntervalSince1970].longLongValue;
//    NSString * password = [NSString stringWithFormat:@"%@", [NSNumber numberWithLongLong:localTime]];
//    NSString * order_msg = [BCEncryption hisunAES128EncryptString:encryptString withAESPassword:password];
//    
    NetworkSuccessBlock success01 = ^(NSURLSessionDataTask *task, id responseObject){
//        
//        NSLog(@"responseObject %@",responseObject);
//        NSString * code = [responseObject objectForKey:@"code"];
//        
//        if (![code boolValue])
//        {
//            [[NSNotificationCenter defaultCenter] postNotificationName:N_HDM_Purchase_Succeed object:nil];
//            success(task, responseObject);
//        }
//        else
//        {
//            failure(task, responseObject);
//        }
   };
    
    [self APIName_MethodSpeicalPOST_APIParameters:@[@"subscribe_product", @{@"order_msg": @"",
                                                                     @"localTime": @""}, success01, failure]];
}

- (void)subscribe_productOfPackage_POST_Product_ids:(NSArray *)product_ids Product_type:(NSString *)product_type Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self subscribe_product_POST_Product_ids:product_ids Opertion_type:@"506" Product_type:product_type Content_id:@"-1" Opus_id:@"-1" Chann_id:@"-1" Spending_type:@"0" Success:success Failure:failure];
}


- (void)unSubscribe_product_POST_Product_id:(NSString *)product_id Product_type:(NSString *)product_type Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self APIName_MethodPOST_APIParameters:@[@"unSubscribe_product", @{@"product_id": product_id,
                                                                       @"product_type": product_type}, success, failure]];
}


#pragma mark - P04 我的最爱

/*!
 * 4.1 收藏列表查询
 * query_favor_opus_list
 */
- (void)query_favor_opus_list_GET_Chann_id:(NSString *)chann_id Type:(NSString *)type
                                  Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                   Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_favor_opus_list", @{@"chann_id": chann_id,
                                                                        @"type": type,
                                                                        @"cur_page": cur_page,
                                                                        @"page_size": page_size}, success, failure]];
}

/*!
 * 4.2 我的最爱标签列表
 * query_subscribe_tag_list
 */
- (void)query_subscribe_tag_list_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_subscribe_tag_list", success, failure]];
}

/*!
 * 4.3 我的最爱标签作品列表
 * query_subscribe_tag_opus_list
 */
- (void)query_subscribe_tag_opus_list_GET_Tag_id:(NSString *)tag_id Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                         Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_subscribe_tag_opus_list", @{@"tag_id": tag_id,
                                                                                @"cur_page": cur_page,
                                                                                @"page_size": page_size}, success, failure]];
}

/*!
 * 4.4 批量取消收藏（已发布）
 * cancel_favors
 */
- (void)cancel_favors_POST_Ids:(NSArray *)ids Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    NSString *product_id = [ids componentsJoinedByString:@","];
    
    [self APIName_MethodPOST_APIParameters:@[@"cancel_favors", @{@"id": product_id}, success, failure]];
}

/*!
 * 4.5 最爱banner推荐列表
 * query_subscribe_banner_list
 */
- (void)query_subscribe_banner_list_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_subscribe_banner_list", success, failure]];
}


#pragma mark - P05 我的书架-书签

/*!
 * 5.1 查询我的书签接口（已发布）
 * query_my_mark
 */
- (void)query_my_mark_GET_Chann_id:(NSString *)chann_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_my_mark", @{@"chann_id": chann_id}, success, failure]];
}

/*!
 * 5.2 批量取消书签（已发布）
 * cancel_marks
 */
- (void)cancel_marks_POST_Ids:(NSArray *)ids Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    NSString *product_id = [ids componentsJoinedByString:@","];
    
    [self APIName_MethodPOST_APIParameters:@[@"cancel_marks", @{@"id": product_id}, success, failure]];
}

#pragma mark - P06 登录

/*!
 * 6.1 密码登录
 * user_login_from_huawei
 */
- (void)user_login_from_huawei_POST_Mobile_num:(NSString *)mobile_num Password:(NSString *)password
                                       Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"user_login_from_huawei", @{@"mobile_num": mobile_num,
                                                                          @"password": password,
                                                                          @"is_encrypted": @"need",
                                                                          @"is_supportIDMP": @"True"}, success, failure]];
}

/*!
 * 6.2 用唯一标示自动登录接口（暂开发）
 * auto_login_by_only_flag
 * Header参数 only_flag 标示唯一用户
 */
- (void)auto_login_by_only_flag_POST_Height:(NSString *)height Width:(NSString *)width
                                    Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"auto_login_by_only_flag", @{@"height": height,
                                                                           @"width": width}, success, failure]];
}

/*!
 * 6.3 更改密码
 * change_password
 */
- (void)change_password_POST_Old_password:(NSString *)old_password new_password:(NSString *)new_password
                                  Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"change_password", @{@"old_password": old_password,
                                                                   @"new_password": new_password,
                                                                   @"is_encrypted": @"need",
                                                                   @"is_supportIDMP": @"True"}, success, failure]];
}

- (void)updatePassword_POST_Moblie_num:(NSString *)moblie_num
                          Old_password:(NSString *)old_password New_password:(NSString *)new_password
                               Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self change_password_POST_Old_password:old_password new_password:new_password Success:success Failure:failure];
}

/*!
 * 6.4 获取游客ID
 * query_anonymous_id
 */
- (void)query_anonymous_id_POST_Anonymous_id:(NSString *)anonymous_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"query_anonymous_id", success, failure]];
}

/*!
 * 6.5 cmwap登录（暂开发）
 * user_login
 */
- (void)user_login_POST_Height:(NSString *)height Width:(NSString *)width
                       Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"user_login", @{@"height": height,
                                                              @"width": width}, success, failure]];
}

/*!
 * 6.6 忘记密码
 * forget_password
 */
- (void)forget_password_POST_Moblie:(NSString *)moblie New_password:(NSString *)new_password Validate_code:(NSString *)validate_code
                            Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self APIName_MethodPOST_APIParameters:@[@"forget_password", @{@"mobile": moblie,
                                                                 @"new_password": new_password,
                                                                 @"validate_code": validate_code,
                                                                 @"is_encrypted": @"true",
                                                                 @"is_supportIDMP": @"True"}, success, failure]];
}


/*!
 * 6.7 注册
 * register_user
 */
- (void)register_user_POST_Moblie:(NSString *)moblie New_password:(NSString *)new_password Validate_code:(NSString *)validate_code
                          Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"register_user", @{@"mobile": moblie,
                                                                 @"new_password": new_password,
                                                                 @"validate_code": validate_code,
                                                                 @"is_encrypted": @"true",
                                                                 @"is_supportIDMP": @"True"}, success, failure]];
}

/*!
 * 6.8 获取验证码接口
 * send_message_to_get_vertification_code
 */
- (void)send_message_to_get_vertification_code_GET_Mobile_num:(NSString *)mobile_num Type:(NSString *)type
                                                      Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"send_message_to_get_vertification_code", @{@"mobile_num": mobile_num,
                                                                                          @"type": type,
                                                                                          @"is_supportIDMP": @"True"}, success, failure]];
}

/*!
 * 6.9 新版获取验证码接口
 * new_send_message_to_get_vertification_code
 */
- (void)new_send_message_to_get_vertification_code_GET_Mobile_num:(NSString *)mobile_num Type:(NSString *)type
                                                          Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"new_send_message_to_get_vertification_code", @{@"mobile_num": mobile_num,
                                                                                              @"type": type,
                                                                                              @"is_supportIDMP": @"True"}, success, failure]];
}

- (void)new_send_message_to_get_vertification_codeOfRecharege_GET_Mobile_num:(NSString *)mobile_num
                                                                     Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self new_send_message_to_get_vertification_code_GET_Mobile_num:mobile_num Type:@"4" Success:success Failure:failure];
}


/*!
 * 6.10 pbs登录方式
 * user_login_from_pbs
 */
- (void)user_login_from_pbs_POST_Mobile_num:(NSString *)mobile_num Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"user_login_from_pbs", @{@"mobile_num": mobile_num,
                                                                       @"is_supportIDMP": @"True"}, success, failure]];
}

/*!
 *  6.11 邮箱注册
 *
 *  @param mobile       <#mobile description#>
 *  @param new_password <#new_password description#>
 *  @param success      <#success description#>
 *  @param failure      <#failure description#>
 */
- (void)register_mail_POST_Mobile:(NSString *)mobile New_password:(NSString *)new_password Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self APIName_MethodPOST_APIParameters:@[@"register_mail", @{@"mobile_num": mobile,
                                                                 @"new_password": new_password,
                                                                 @"is_encrypted": @"true",
                                                                 @"is_supportIDMP": @"True"}, success, failure]];
}

/*!
 *  6.12 获取图形验证码接口
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)get_picture_vertification_code_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self APIName_MethodGET_APIParameters:@[@"get_picture_vertification_code", success, failure]];
}

/*!
 *  6.13 邮箱找回密码
 *
 *  @param mobile  <#mobile description#>
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)mail_forget_password_POST_Mobile:(NSString *)mobile Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self APIName_MethodPOST_APIParameters:@[@"mail_forget_password", @{@"mobile": mobile,
                                                                        @"is_supportIDMP": @"True"}, success, failure]];
}

/*!
 *  6.14 发送激活邮件
 *
 *  @param email   <#email description#>
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)send_activation_email_POST_Email:(NSString *)email AndType:(NSString *)type Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self APIName_MethodPOST_APIParameters:@[@"send_activation_email", @{@"email": email,@"type":type}, success, failure]];
}

/*!
 *  6.15 邮箱帐号手机号绑定接口
 *
 *  @param mobile        <#mobile description#>
 *  @param validate_code <#validate_code description#>
 *  @param success       <#success description#>
 *  @param failure       <#failure description#>
 */
- (void)binding_mobile_POST_Mobile:(NSString *)mobile Validate_code:(NSString *)validate_code
                           Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self APIName_MethodPOST_APIParameters:@[@"binding_mobile", @{@"mobile": mobile,
                                                                  @"validate_code": validate_code}, success, failure]];
}

/*!
 *  6.16 邮箱帐号解绑接口
 *
 *  @param success <#success description#>
 *  @param failure <#failure description#>
 */
- (void)unbinding_mobile_POST_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self APIName_MethodPOST_APIParameters:@[@"unbinding_mobile", success, failure]];
}


#pragma mark - P07 我的动漫

/*!
 * 7.1 我的动漫
 * user_queryMyZone
 */
- (void)user_queryMyZone_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"user_queryMyZone", success, failure]];
}

/*!
 * 7.2 更新用户信息接口
 * user_updateInfo
 */
- (void)user_updateInfo_POST_Nick_name:(NSString *)nick_name Sex:(NSString *)sex Signature:(NSString *)signature
                               Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"user_updateInfo", @{@"sex": sex,
                                                                   @"nick_name": nick_name,
                                                                   @"signature": signature}, success, failure]];
}

/*!
 * 7.3 查询积兑换漫币比例
 * query_jifen_exchange_strategy
 */
- (void)query_jifen_exchange_strategy_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_jifen_exchange_strategy", success, failure]];
}

/*!
 * 7.4 积分兑换漫币
 * jifen_submit
 */
- (void)jifen_submit_POST_Mb:(NSString *)mb Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"jifen_submit", @{@"mb": mb}, success, failure]];
}

/*!
 * 7.5 查询漫币充值记录
 * query_mb_recharge_record
 */
- (void)query_mb_recharge_record_GET_Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                      Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_mb_recharge_record", @{@"cur_page": cur_page,
                                                                           @"page_size": page_size}, success, failure]];
}

/*!
 * 7.6 查询漫币消费记录
 * query_mb_cost_record
 */
- (void)query_mb_cost_record_GET_Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                  Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_mb_cost_record", @{@"cur_page": cur_page,
                                                                       @"page_size": page_size}, success, failure]];
}

/*!
 * 7.7 更改密码
 * change_password
 * P6.3
 */


/*!
 * 7.8 查询我的消费
 * query_subscription_status
 */
- (void)query_subscription_status_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_subscription_status", success, failure]];
}

/*!
 * 7.9 查询套餐包信息
 * query_package_bag_info
 */
- (void)query_package_bag_info_GET_Tabnum:(NSString *)tabnum Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_package_bag_info", @{@"tabnum": tabnum}, success, failure]];
}

/*!
 * 7.9.1 查询套餐包信息--动漫包
 * tabnum: 1
 */
- (void)query_dmPackage_bag_info_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self query_package_bag_info_GET_Tabnum:@"1" Success:success Failure:failure];
}

/*!
 * 7.9.2 查询套餐包信息--动漫杂志
 * tabnum: 2
 */
- (void)query_dmmPackage_bag_info_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self query_package_bag_info_GET_Tabnum:@"2" Success:success Failure:failure];
}

/*!
 * 7.9.3 查询套餐包信息--品牌包
 * tabnum: 3
 */
- (void)query_brandPackage_bag_info_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self query_package_bag_info_GET_Tabnum:@"3" Success:success Failure:failure];
}

/*!
 * 7.9.4 查询套餐包信息--地方包
 * tabnum: 4
 */
- (void)query_placePackage_bag_info_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self query_package_bag_info_GET_Tabnum:@"4" Success:success Failure:failure];
}

/*!
 * 7.10 查询我的包月
 * query_my_package_bag
 */
- (void)query_my_package_bag_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_my_package_bag", success, failure]];
}

/*!
 * 7.11 查询我的评论
 * user_queryComment
 */
- (void)user_queryComment_GET_Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                               Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"user_queryComment", @{@"cur_page": cur_page,
                                                                    @"page_size": page_size}, success, failure]];
}

/*!
 * 7.12 查询漫币充值数值列表
 * query_mb_price_list
 */
- (void)query_mb_price_list_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_mb_price_list", success, failure]];
}

/*!
 * 7.13 充值漫币
 * mb_recharge
 */
- (void)mb_recharge_POST_Mb_num:(NSString *)mb_num Price:(NSString *)price
                        Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"mb_recharge", @{@"mb_num": mb_num,
                                                               @"price": price}, success, failure]];
}

/*!
 * 7.14 查询积分获取记录
 * query_jf_record
 */
- (void)query_jf_record_GET_Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                             Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_jf_record", @{@"cur_page": cur_page,
                                                                  @"page_size": page_size}, success, failure]];
}

/*!
 * 7.15 查询积分消费记录
 * query_jf_cost_record
 */
- (void)query_jf_cost_record_GET_Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                  Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_jf_cost_record", @{@"cur_page": cur_page,
                                                                       @"page_size": page_size}, success, failure]];
}

/*!
 * 7.16 充值漫币
 * new_mb_recharge
 */
- (void)new_mb_recharge_POST_Mb_num:(NSString *)mb_num Price:(NSString *)price Type:(NSString *)type Vcode:(NSString *)vcode Other_num:(NSString *)other_num Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self APIName_MethodPOST_APIParameters:@[@"new_mb_recharge", @{@"mb_num": mb_num,
                                                                   @"price": price,
                                                                   @"vcode": vcode,
                                                                   @"type": type,
                                                                   @"other_num": other_num}, success, failure]];
}

- (void)new_mb_rechargeForMe_POST_Mb_num:(NSString *)mb_num Price:(NSString *)price Vcode:(NSString *)vcode Other_num:(NSString *)other_num Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self new_mb_recharge_POST_Mb_num:mb_num Price:price Type:@"0" Vcode:vcode Other_num:other_num Success:success Failure:failure];
}

- (void)new_mb_rechargeForOther_POST_Mb_num:(NSString *)mb_num Price:(NSString *)price Vcode:(NSString *)vcode Other_num:(NSString *)other_num Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self new_mb_recharge_POST_Mb_num:mb_num Price:price Type:@"1" Vcode:vcode Other_num:other_num Success:success Failure:failure];
}

- (void)ios_mb_recharge_POST_Mb_num:(NSString *)mb_num Order_id:(NSString *)order_id
                            Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self APIName_MethodPOST_APIParameters:@[@"ios_mb_recharge", @{@"mb_num": mb_num,
                                                                   @"order_id": order_id}, success, failure]];
}


#pragma mark - P08 主题

/*!
 * 8.1 查询主题详细页（已发布）
 * query_theme_detail
 */
- (void)query_theme_detail_GET_Opus_id:(NSString *)opus_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_theme_detail", @{@"opus_id": opus_id}, success, failure]];
}


#pragma mark - P09 彩漫

/*!
 * 9.1 查询彩漫首页
 * query_caiman_home
 */
- (void)query_caiman_home_GET_Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                               Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_caiman_home", @{@"cur_page": cur_page,
                                                                    @"page_size": page_size}, success, failure]];
}

/*!
 * 9.2 查询彩漫首页更多
 * query_caiman_home_more
 */
- (void)query_caiman_home_more_GET_Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                    Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_caiman_home_more", @{@"cur_page": cur_page,
                                                                         @"page_size": page_size}, success, failure]];
}

/*!
 * 9.3 查询彩漫最新
 * query_caiman_newest
 */
- (void)query_caiman_newest_GET_Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                 Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_caiman_newest", @{@"cur_page": cur_page,
                                                                      @"page_size": page_size}, success, failure]];
}

/*!
 * 9.4 查询彩漫排行
 * query_caiman_rank
 */
- (void)query_caiman_rank_GET_Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                               Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_caiman_rank", @{@"cur_page": cur_page,
                                                                    @"page_size": page_size}, success, failure]];
}

/*!
 * 9.5 获取彩漫分类查询条件列表
 * query_caiman_class_list
 */
- (void)query_caiman_class_list_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_caiman_class_list", success, failure]];
}

/*!
 * 9.6 获取彩漫层级分类查询条件列表
 * query_caiman_layered_class_list
 */
- (void)query_caiman_layered_class_list_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_caiman_layered_class_list", success, failure]];
}

/*!
 * 9.7 查询彩漫分类作品列表接口
 * query_caiman_class_opus_list
 */
- (void)query_caiman_class_opus_list_GET_Chann_id:(NSString *)chann_id Class_ids:(NSDictionary *)class_ids
                                         Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                          Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] initWithDictionary:class_ids];
    [parameter setObject:chann_id forKey:@"chann_id"];
    [parameter setObject:cur_page forKey:@"cur_page"];
    [parameter setObject:page_size forKey:@"page_size"];
    
    [self APIName_MethodGET_APIParameters:@[@"query_caiman_class_opus_list", parameter, success, failure]];
}

/*!
 * 9.8 查询彩漫详细页
 * query_caiman_detail
 */
- (void)query_caiman_detail_GET_Opus_id:(NSString *)opus_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_caiman_detail", @{@"opus_id": opus_id,
                                                                      @"is_ordertip": @"true"}, success, failure]];
}

/*!
 * 9.9 查询彩漫预览图
 * query_caiman_preview
 */
- (void)query_caiman_preview_POST_Opus_id:(NSString *)opus_id User_input:(NSString *)user_input
                              font_family:(NSString *)font_family font_size:(NSString *)font_size
                                  Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"query_caiman_preview", @{@"opus_id": opus_id,
                                                                        @"user_input": user_input,
                                                                        @"font_family": font_family,
                                                                        @"font_size": font_size}, success, failure]];
}

/*!
 * 9.10 发送彩漫
 * send_caiman
 */
- (void)send_caiman_POST_Phone_nums:(NSArray *)phone_nums Opus_id:(NSString *)opus_id
                         User_input:(NSString *)user_input Font_size:(NSString *)font_size
                        Font_family:(NSString *)font_family Product_id:(NSString *)product_id
                            Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    NSString *phone_num = [phone_nums componentsJoinedByString:@","];
    
    [self APIName_MethodPOST_APIParameters:@[@"send_caiman", @{@"phone_nums": phone_num,
                                                               @"opus_id": opus_id,
                                                               @"user_input": user_input,
                                                               @"font_family": font_family,
                                                               @"font_size": font_size,
                                                               @"product_id": product_id}, success, failure]];
}

/*!
 * 9.11 彩漫包月提示
 * caiman_package_desc
 */
- (void)caiman_package_desc_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"caiman_package_desc", @{@"is_ordertip": @"true"}, success, failure]];
}

/*!
 * 9.12 预发送彩漫
 * pre_send_caiman
 */
- (void)pre_send_caiman_POST_Phone_nums:(NSArray *)phone_nums Opus_id:(NSString *)opus_id User_input:(NSString *)user_input
                              Font_size:(NSString *)font_size Font_family:(NSString *)font_family
                                Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    NSString *phone_num = [phone_nums componentsJoinedByString:@","];
    
    [self APIName_MethodPOST_APIParameters:@[@"pre_send_caiman", @{@"phone_nums": phone_num,
                                                                   @"opus_id": opus_id,
                                                                   @"user_input": user_input,
                                                                   @"font_family": font_family,
                                                                   @"font_size": font_size,
                                                                   @"is_supportIDMP": @"true"}, success, failure]];
}


#pragma mark - P10 装机必备

/*!
 * 10.1 查询装机必备软件列表
 * query_soft_list
 */
- (void)query_soft_list_GET_Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                             Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_soft_list", @{@"cur_page": cur_page,
                                                                  @"page_size": page_size}, success, failure]];
}

/*!
 * 10.2 装机必备下载记录
 * soft_download_submit
 */
- (void)soft_download_submit_POST_Soft_name:(NSString *)soft_name Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"soft_download_submit", @{@"soft_name": soft_name}, success, failure]];
}


#pragma mark - P11 搜索

/*!
 * 11.1 热词查询接口
 * search_hotKey
 */
- (void)search_hotKey_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"search_hotKey", success, failure]];
}
/*!
 * 11.1 热词查询接口
 * search_hotKey_new
 */
- (void)search_hotKey_new_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"search_hotKey_new", success, failure]];
}

/*!
 * 11.2 内容搜索接口
 * content_search
 */
- (void)content_search_GET_Chann_id:(NSString *)chann_id key:(NSString *)key
                           Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                            Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"content_search", @{@"key": key,
                                                                 @"chann_id": chann_id,
                                                                 @"cur_page": cur_page,
                                                                 @"page_size": page_size}, success, failure]];
}
/*!
 * 11.4 内容搜索接口
 * content_search_new
 */
- (void)content_search_new_GET_Chann_id:(NSString *)chann_id key:(NSString *)key
                           Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                            Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"content_search_new", @{@"key": key,
                                                                 @"chann_id": chann_id,
                                                                 @"cur_page": cur_page,
                                                                 @"page_size": page_size}, success, failure]];
}

/*!
 * 11.3 搜索无结果接口
 * query_search_recom_opus_list
 */
- (void)query_search_recom_opus_list_GET_Chann_id:(NSString *)chann_id key:(NSString *)key
                                         Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                          Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_search_recom_opus_list", @{@"key": key,
                                                                               @"chann_id": chann_id,
                                                                               @"cur_page": cur_page,
                                                                               @"page_size": page_size}, success, failure]];
}
/*!
 * 11.6	查询联想词接口
 * search_recom_word_list
 *
 */
- (void)search_recom_word_list_GET_Key:(NSString *)key
                                    Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure{
    [self APIName_MethodGET_APIParameters:@[@"search_recom_word_list", @{@"key_word": key}, success, failure]];
}

#pragma mark - P12 PUSH

/*!
 * 12.1 获取通知时间
 * query_notify_time
 */
- (void)query_notify_time_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_notify_time", success, failure]];
}

/*!
 * 12.2 获取订阅通知（用户订阅、系统推荐）
 * query_subscribe_notify
 * 弃用
 */


/*!
 * 12.3 获取系统通知
 * query_system_notify
 */
- (void)query_system_notify_GET_User_id:(NSString *)user_id Notify_id:(NSString *)notify_id
                                Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_system_notify", @{@"user_id": user_id,
                                                                      @"id": notify_id}, success, failure]];
}

/*!
 * 12.4 获取订阅通知列表
 * query_subscribe_notify_list
 */
- (void)query_subscribe_notify_list_GET_User_id:(NSString *)user_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_system_notify", @{@"user_id": user_id}, success, failure]];
}

/*!
 * 12.5 查询PUSH设置
 * query_push_setting
 */
- (void)query_push_setting_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_push_setting", success, failure]];
}

/*!
 * 12.6 提交PUSH设置
 * push_setting_submit
 * 各选项以@隔开，选项id和状态以#隔开，1代表打开，0代表关闭。如：1#0@2#1@3#0。表示：id为1的关闭，id为2的打开，id为3的关闭
 */
- (void)push_setting_submit_POST_Id_statues:(NSString *)id_statues Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"push_setting_submit", @{@"id_statues": id_statues}, success, failure]];
}

/*!
 * 12.7 服务器推送内容格式
 *
 */


/*!
 * 12.8 获取订阅主题列表
 * query_topic_list
 */
- (void)query_topic_list_GET_Client_id:(NSString *)client_id Is_login:(NSString *)is_login
                               Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_topic_list", @{@"client_id": client_id,
                                                                   @"is_login": is_login}, success, failure]];
}

/*!
 * 12.9 查询push配置信息
 * query_push_config
 * client_id: 游客设备ID，真实用户user_id
 */
- (void)query_push_config_GET_Client_id:(NSString *)client_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_push_config", @{@"client_id": client_id}, success, failure]];
}

/*!
 * 12.10 push信息计数
 * push_count_submit
 */
- (void)push_count_submit_POST_Info_id:(NSString *)info_id Count_type:(NSString *)count_type
                               Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"push_count_submit", @{@"info_id": info_id,
                                                                     @"count_type": count_type}, success, failure]];
}

/*!
 * 12.11 push接收状态提交
 * push_status_submit
 */
- (void)push_status_submit_POST_Topic:(NSString *)topic Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"push_status_submit", @{@"topic": topic}, success, failure]];
}


#pragma mark - P13 其他

/*!
 * 13.1 分享提交接口
 * share_submit
 * P2.11
 */

/*!
 * 13.2 意见反馈提交接口
 * feedback_submit
 */
- (void)feedback_submit_POST_Feed_des:(NSString *)feed_des Cellphone_type:(NSString *)cellphone_type question_type:(NSString *)question_type
                                   Age:(NSString *)age Sex:(NSString *)sex Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] initWithDictionary:@{@"feed_des": feed_des}];
    
//    [parameter objectForKey:cellphone_type forKey:@"cellphone_type"];
//    [parameter bc_setNotEmptyObject:age forKey:@"age"];
//    [parameter bc_setNotEmptyObject:sex forKey:@"sex"];
//    [parameter bc_setNotEmptyObject:question_type forKey:@"question_type"];
    
    [self APIName_MethodPOST_APIParameters:@[@"feedback_submit", parameter, success, failure]];
}

/*!
 * 13.3 查询通知设置
 * query_push_setting
 * P12.5
 */


/*!
 * 13.4 提交通知设置
 * push_setting_submit
 * P12.6
 */


#pragma mark - P14 全局规划接口

/*!
 * 14.1 获取系统全局说明文字
 * query_system_remark
 */
- (void)query_system_remark_GET_Type:(NSString *)type Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_system_remark", @{@"type": type}, success, failure]];
}

/*!
 * 14.2 已下载内容提交接口
 * down_load_submit
 */
- (void)down_load_submit_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id Content_id:(NSString *)content_id Quality:(NSString *)quality
                                Status:(NSString *)status Save_path:(NSString *)save_path Thumbnail_save_path:(NSString *)thumbnail_save_path
                               Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"down_load_submit", @{@"chann_id": chann_id,
                                                                    @"opus_id": opus_id,
                                                                    @"content_id": content_id,
                                                                    @"quality": quality,
                                                                    @"status": status,
                                                                    @"save_path": save_path,
                                                                    @"thumbnail_save_path": thumbnail_save_path}, success, failure]];
}

/*!
 * 14.3 已下载内容更新接口
 * down_load_update
 */
- (void)down_load_update_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id Content_id:(NSString *)content_id Quality:(NSString *)quality
                                Status:(NSString *)status Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"down_load_update", @{@"chann_id": chann_id,
                                                                    @"opus_id": opus_id,
                                                                    @"content_id": content_id,
                                                                    @"quality": quality,
                                                                    @"status": status}, success, failure]];
}


#pragma mark - P15 管理

/*!
 * 15.1 用户反馈接口
 * feedback_submit
 * P13.2
 */


/*!
 * 15.2 检测更新接口
 * query_client
 */
- (void)query_client_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_client", success, failure]];
}

/*!
 * 15.3 插件升级查询接口
 * query_plugin_upd
 */
- (void)query_plugin_upd_GET_Plugin_type:(NSString *)plugin_type Plugin_version:(NSString *)plugin_version
                                 Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_plugin_upd", @{@"plugin_type": plugin_type,
                                                                   @"plugin_version": plugin_version}, success, failure]];
}


#pragma mark - P16 WAP PUSH 相关

/*!
 * 16.1 WAP PUSH进行详情页转换
 * query_opus_detail_for_wappush
 */
- (void)query_opus_detail_for_wappush_GET_Hw_content_id:(NSString *)hw_content_id
                                                Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_opus_detail_for_wappush", @{@"hw_content_id": hw_content_id}, success, failure]];
}

/*!
 * 16.2 WAP PUSH进行单话鉴权转换
 * query_opus_content_for_wappush
 */
- (void)query_opus_content_for_wappush_GET_Hw_content_id:(NSString *)hw_content_id
                                                 Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_opus_content_for_wappush", @{@"hw_content_id": hw_content_id}, success, failure]];
}


#pragma mark - P17 观看阅读时长记录

/*!
 * 17.1 观看阅读记录时长记录
 * watch_report_submit
 */
- (void)watch_report_submit_POST_Chann_id:(NSString *)chann_id Opus_id:(NSString *)opus_id Content_id:(NSString *)content_id
                                Send_time:(NSString *)send_time Response_time:(NSString *)response_time End_time:(NSString *)end_time
                                    Total:(NSString *)total Watch_total:(NSString *)watch_total Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"watch_report_submit", @{@"chann_id": chann_id,
                                                                       @"opus_id": opus_id,
                                                                       @"content_id": content_id,
                                                                       @"send_time": send_time,
                                                                       @"response_time": response_time,
                                                                       @"end_time": end_time,
                                                                       @"total": total,
                                                                       @"watch_total": watch_total}, success, failure]];
}


#pragma mark - P18 签到

/*!
 * 18.1 获取签到详细页信息
 * query_checkin_detail
 */
- (void)query_checkin_detail_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_checkin_detail", success, failure]];
}

/*!
 * 18.2 查询签到记录
 * query_checkin_record
 */
- (void)query_checkin_record_GET_Start_date:(NSString *)start_date End_date:(NSString *)end_date
                                    Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_checkin_record", @{@"start_date": start_date,
                                                                       @"end_date": end_date}, success, failure]];
}

/*!
 * 18.3 签到/补签
 * checkin_submit
 */
- (void)checkin_submit_POST_Date:(NSString *)date Is_recharge:(NSString *)is_recharge
                         Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"checkin_submit", @{@"date": date,
                                                                  @"is_recharge": is_recharge}, success, failure]];
}

/*!
 * 18.4 消费并自动签到
 * order_checkin_submit
 */
- (void)order_checkin_submit_POST_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"order_checkin_submit", success, failure]];
}

/*!
 * 18.5 查询抽奖积分
 * query_lottery_jf_list
 */
- (void)query_lottery_jf_list_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_lottery_jf_list", success, failure]];
}

/*!
 * 18.6 抽奖
 * lottery_submit
 */
- (void)lottery_submit_POST_Lottery_id:(NSString *)lottery_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"lottery_submit", @{@"lottery_id": lottery_id}, success, failure]];
}

/*!
 * 18.7 中奖名单
 * query_winner_member_list
 */
- (void)query_winner_member_list_GET_Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                      Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_winner_member_list", @{@"cur_page": cur_page,
                                                                           @"page_size": page_size}, success, failure]];
}



#pragma mark - P19 热点活动

/*!
 * 19.0 获取活动页信息
 * query_activity
 */
- (void)query_activity_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_activity", success, failure]];
}

/*!
 * 19.1 获取热点活动详细页信息
 * query_hotsport_detail
 */
- (void)query_hotsport_detail_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_hotsport_detail", success, failure]];
}

/*!
 * 19.2 获取各省活动页信息
 * query_hotsport_area_page
 */
- (void)query_hotsport_area_page_GET_Area_id:(NSString *)area_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_hotsport_area_page", @{@"area_id": area_id}, success, failure]];
}

/*!
 * 19.3 代言成功提交
 * hotsport_share_submit
 */
- (void)hotsport_share_submit_POST_Area_id:(NSString *)area_id Share_to:(NSString *)share_to Content_id:(NSString *)content_id
                                   Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"hotsport_share_submit", @{@"area_id": area_id,
                                                                         @"share_to": share_to,
                                                                         @"content_id": content_id}, success, failure]];
}

/*!
 * 19.4 流量领取提交
 * hotsport_getflow_submit
 */
- (void)hotsport_getflow_submit_POST_Area_id:(NSString *)area_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"hotsport_getflow_submit", @{@"area_id": area_id}, success, failure]];
}

/*!
 * 19.5 流量领取成功分享提交
 * hotsport_getflow_share_submit
 */
- (void)hotsport_getflow_share_submit_POST_Area_id:(NSString *)area_id Share_to:(NSString *)share_to
                                           Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"hotsport_getflow_share_submit", @{@"area_id": area_id,
                                                                                 @"share_to": share_to}, success, failure]];
}

/*!
 * 19.6 视频观看记录提交
 * hotsport_view_submit
 */
- (void)hotsport_view_submit_POST_Content_id:(NSString *)content_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"hotsport_view_submit", @{@"content_id": content_id}, success, failure]];
}

/*!
 * 19.7 用户活动进度信息
 * query_hotsport_progress
 */
- (void)query_hotsport_progress_GET_Area_id:(NSString *)area_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_hotsport_progress", @{@"area_id": area_id}, success, failure]];
}

/*!
 * 19.8 省活动规则信息
 * query_hotsport_area_role
 */
- (void)query_hotsport_area_role_GET_Area_id:(NSString *)area_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_hotsport_area_role", @{@"area_id": area_id}, success, failure]];
}

/*!
 * 19.9 我为冠军代言活动页面信息
 * query_champion_activity_detail
 */
- (void)query_champion_activity_detail_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_champion_activity_detail", success, failure]];
}

/*!
 * 19.10 我为冠军代言-分享成功提交
 * champion_share_info_submit
 */
- (void)champion_share_info_submit_POST_Share_to:(NSString *)share_to Share_content:(NSString *)share_content
                                         Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"champion_share_info_submit", @{@"share_to": share_to,
                                                                             @"share_content": share_content}, success, failure]];
}

/*!
 *
 *
 */


#pragma mark - P20 3.6版本相关

/*!
 * 20.1 推荐数据
 * query_manshang_recomm
 */
- (void)query_manshang_recomm_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_manshang_recomm", success, failure]];
}

/*!
 * 20.2 频道一层分类标签列表
 * query_chann_tag_list
 */
- (void)query_chann_tag_list_GET_Chann_id:(NSString *)chann_id Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_chann_tag_list", @{@"chann_id": chann_id}, success, failure]];
}

/*!
 * 20.3 教育频道作品列表
 * query_edu_opus_list_by_node_id
 */
- (void)query_edu_opus_list_by_node_id_GET_Node_id:(NSString *)node_id Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                           Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_edu_opus_list_by_node_id", @{@"node_id": node_id,
                                                                                 @"cur_page": cur_page,
                                                                                 @"page_size": page_size}, success, failure]];
}

/*!
 * 20.4 教育频道栏目首页
 * query_edu_recom_and_opus_list_by_node_id
 * 每个栏目banner动态推荐+作品列表（加载更多时，调用20.3接口）
 */
- (void)query_edu_recom_and_opus_list_by_node_id_GET_Node_id:(NSString *)node_id Cur_page:(NSString *)cur_page Page_size:(NSString *)page_size
                                                     Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_edu_recom_and_opus_list_by_node_id", @{@"node_id": node_id,
                                                                                           @"cur_page": cur_page,
                                                                                           @"page_size": page_size}, success, failure]];
}


#pragma mark - P21 异网支付

/*!
 *  21.1 获取电信计费信息接口（附带修改鉴权接口）
 *  get_ct_sub_info
 */
- (void)get_ct_sub_info_GET_Mail:(NSString *)mail Hw_content_id:(NSString *)hw_content_id Hw_price:(NSString *)hw_price
                         Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"get_ct_sub_info", @{@"mail": mail,
                                                                  @"hw_content_id": hw_content_id,
                                                                  @"hw_price": hw_price}, success, failure]];
}

/*!
 *  21.2 电信计费轮询接口
 *  get_ct_sub_result
 */
- (void)get_ct_sub_result_GET_Mail:(NSString *)mail Charge_code:(NSString *)charge_code
                           Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodPOST_APIParameters:@[@"get_ct_sub_result", @{@"mail": mail,
                                                                    @"charge_code": charge_code}, success, failure]];
}


#pragma mark - P23 插件相关

/*!
 * 23.6 插件退出时的推荐作品列表
 * query_random_list
 */
- (void)query_random_list_GET_Chann_id:(NSString *)chann_id Page_size:(NSString *)page_size
                               Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_random_list", @{@"chann_id": chann_id,
                                                                    @"page_size": page_size}, success, failure]];
}

/*!
 * 27.6	checkflag接口
 * query_flag
 */
- (void)query_flag_GET_Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure {
    
    [self APIName_MethodGET_APIParameters:@[@"query_flag", @{@"ver": [BCConfigure kHTTPVersion]}, success, failure]];
}
#pragma mark - 营运数据 -

- (void)submitMaintain:(NSString *)log Success:(NetworkSuccessBlock)success Failure:(NetworkFailureBlock)failure;{
    
    [self APIName_MethodPOST_APIParameters:@[@"all_maintain_log_submit", @{@"log": log}, success, failure]];
}


@end
