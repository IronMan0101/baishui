//
//  HDMGlobal.m
//  HDMProject
//
//  Created by Sea on 14/12/26.
//
//

#import "HDMGlobal.h"
#import "PCCommonDefines.h"


@implementation HDMGlobal


+ (instancetype)sharedInstance;{
    
    static HDMGlobal * instance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{instance = [[self alloc] init];});
    
    return instance;
}

- (instancetype)init;{
    
    if (self=[super init])
    {
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(purchaseed:)
//                                                     name:N_HDM_Purchase_Succeed object:nil];
        
        self.isShowDPB = YES;
    }
    
    return self;
}


//- (void)purchaseed:(NSNotification *)notification;{
//    
//    self.purchaseStatus = BCPurchaseed;
//}


@end
