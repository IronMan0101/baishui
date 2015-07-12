
#import "HDMUserPackageManager.h"

#import "HDMNetwork.h"
#import "HDMPackage.h"


@implementation HDMUserPackageManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
    [[HDMNetwork sharedInstance] query_my_package_bag_GET_Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            self.brandPackageList = [[NSMutableArray alloc] init];
            NSArray * array0 = [responseObject objectForKey:@"brandPackageList"];
            for (NSDictionary * dictionary in array0)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMPackage * model = [[HDMPackage alloc] initWithAttributes:attributes];//修改一处
                [self.brandPackageList addObject:model];
            }
            
            self.comicMagazineList = [[NSMutableArray alloc] init];
            NSArray * array1 = [responseObject objectForKey:@"comicMagazineList"];
            for (NSDictionary * dictionary in array1)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMPackage * model = [[HDMPackage alloc] initWithAttributes:attributes];//修改一处
                [self.comicMagazineList addObject:model];
            }
            
            self.comicPackageList = [[NSMutableArray alloc] init];
            NSArray * array2 = [responseObject objectForKey:@"comicPackageList"];
            for (NSDictionary * dictionary in array2)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMPackage * model = [[HDMPackage alloc] initWithAttributes:attributes];//修改一处
                [self.comicPackageList addObject:model];
            }
            
            self.placePackageList = [[NSMutableArray alloc] init];
            NSArray * array3 = [responseObject objectForKey:@"placePackageList"];
            for (NSDictionary * dictionary in array3)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMPackage * model = [[HDMPackage alloc] initWithAttributes:attributes];//修改一处
                [self.placePackageList addObject:model];
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
