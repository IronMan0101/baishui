//
//  HDMHotkeyManager.m
//  User
//
//  Created by Sea on 14-6-4.
//
//

#import "HDMHotkeyManager.h"
#import "HDMNetwork.h"
#import "HDMHotkey.h"

@implementation HDMHotkeyManager


- (void)enquiryListSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure {
    
    [[HDMNetwork sharedInstance] search_hotKey_new_GET_Success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString * msg = [responseObject objectForKey:@"msg"];
        NSString * code = [responseObject objectForKey:@"code"];
        NSDictionary * codeMsg = [NSDictionary dictionaryWithObjectsAndKeys:code,@"code", msg,@"msg", nil];
        
        if (![code boolValue])
        {
            self.all_list = [[NSMutableArray alloc] init];
            self.anime_list = [[NSMutableArray alloc] init];
            self.cartoon_list = [[NSMutableArray alloc] init];
            self.comic_list = [[NSMutableArray alloc] init];
            
            
            NSArray * array0 = [responseObject objectForKey:@"all"];
            for (NSDictionary * dictionary in array0)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMHotkey * model = [[HDMHotkey alloc] initWithAttributes:attributes];//修改一处
                [self.all_list addObject:model];
            }
            
            NSArray * array1 = [responseObject objectForKey:@"anime"];
            for (NSDictionary * dictionary in array1)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMHotkey * model = [[HDMHotkey alloc] initWithAttributes:attributes];//修改一处
                [self.anime_list addObject:model];
            }
            
            NSArray * array2 = [responseObject objectForKey:@"cartoon"];
            for (NSDictionary * dictionary in array2)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMHotkey * model = [[HDMHotkey alloc] initWithAttributes:attributes];//修改一处
                [self.cartoon_list addObject:model];
            }
            
            NSArray * array3 = [responseObject objectForKey:@"comic"];
            for (NSDictionary * dictionary in array3)
            {
                NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithDictionary:dictionary];
                
                HDMHotkey * model = [[HDMHotkey alloc] initWithAttributes:attributes];//修改一处
                [self.comic_list addObject:model];
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
