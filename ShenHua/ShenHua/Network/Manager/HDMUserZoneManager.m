
#import "HDMUserZoneManager.h"
#import "HDMNetwork.h"


@implementation HDMUserZoneManager


+ (instancetype)sharedInstance;{
    
    static HDMUserZoneManager * instance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{instance = [[self alloc] init];});
    
    return instance;
}


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;{
    
    [[HDMNetwork sharedInstance] user_queryMyZone_GET_Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            NSArray * array = [responseObject objectForKey:@"list"];//修改一处
            for (NSDictionary * dictionary in array)
            {
                HDMZone * model = [[HDMZone alloc] initWithAttributes:dictionary];//修改二处
                
                NSString * type = [dictionary objectForKey:@"type"];
                switch ([type integerValue])
                {
                    case 1:
                    {
                        self.creditZone = model;
                    }break;
                        
                    case 2:
                    {
                        self.currencyZone = model;
                    }break;
                        
                    case 3:
                    {
                        self.packageZone = model;
                    }break;
                        
                    case 4:
                    {
                        self.reviewZone = model;
                    }break;
                        
                        
                        
                    default:
                        break;
                }
                
                [self.contextList addObject:model];
            }
            
            success(codeMsg);
        }
        else
        {
            failure(codeMsg);
        }
    } Failure:^(NSURLSessionDataTask *task, NSError *error) {
        
     //  //failure([BCAlertText networkErrorDictionary:error]);
    }];
}


@end
