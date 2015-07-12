
#import "HDMProductSectionManager.h"
#import "HDMNetwork.h"
#import "HDMProduct.h"
#import "HDMSection.h"
//#import "HDMModelOperationQueue.h"


@implementation HDMProductSectionManager

-(void)clear
{
    [self.contextList removeAllObjects];
}
- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
//    self.pageSize=100;//默认读取100页的数据 外面手工设置
    
    
    [[HDMNetwork sharedInstance] query_opus_menu_list_GET_Chann_id:self.product.chann_id Opus_id:self.product.opus_id Order_by:BCIntString(self.ascend) Cur_page:BCIntegerString(self.currentPage) Page_size:BCIntegerString(self.pageSize) Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSMutableArray * sectionList = [NSMutableArray array];
            NSArray * array = [responseObject objectForKey:@"list"];//修改一处
            for (NSDictionary * dictionary in array)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMSection * model = [[HDMSection alloc] initWithAttributes:attributes];//修改二处
                model.opus_id = self.product.opus_id;
                model.chann_id = self.product.chann_id;
                
                [sectionList addObject:model];
            }
            
            [self.contextList addObjectsFromArray:sectionList];
            
            if (self.pageSize!=10000)
            {
             //   [[HDMModelOperationQueue sharedInstance] su_sectionList:sectionList];
            }
            
            self.totalItem = [[responseObject objectForKey:@"sum_line"] integerValue];
            self.totalPage = [[responseObject objectForKey:@"sum_page"] integerValue];
            
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
   //    //failure([BCAlertText networkErrorDictionary:error]);
    }];
}
- (void)dealloc
{
    self.product = nil;
}

@end
