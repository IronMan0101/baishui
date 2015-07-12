
#import "HDMChannelClassManager.h"
#import "HDMClass.h"
#import "HDMParentClass.h"
@implementation HDMChannelClassManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
    [[HDMNetwork sharedInstance] query_class_list_GET_Chann_id:BCIntString(self.channel) Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSArray * array = [responseObject objectForKey:@"list"];//修改一处
            for (NSDictionary * dictionary in array)
            {
                NSMutableArray *classList = [[NSMutableArray alloc] init];
                
                NSArray * classArray = [dictionary objectForKey:@"class_list"];//修改一处
                for (NSDictionary * classDictionary in classArray)
                {
                    NSMutableDictionary * classAttributes = [NSMutableDictionary dictionaryWithDictionary:classDictionary];
                    
                    HDMClass * classModel = [[HDMClass alloc] initWithAttributes:classAttributes];//修改二处
                    [classList addObject:classModel];
                }
                
                
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                [attributes removeObjectForKey:@"class_list"];
                
                HDMParentClass * model = [[HDMParentClass alloc] initWithAttributes:attributes];//修改二处
                model.classList =classList;
                
                [self.contextList addObject:model];
            }
            
            success(codeMsg);
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
