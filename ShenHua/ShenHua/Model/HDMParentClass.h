//
//  HDMParentClass.h
//  User
//
//  Created by Sea on 14-6-4.
//
//
#import <Foundation/Foundation.h>

@interface HDMParentClass : BCModel
{
    
}

@property (nonatomic, copy) NSString * input;
@property (nonatomic, copy) NSString * parent_id;
@property (nonatomic, copy) NSString * value;
@property (nonatomic, strong) NSArray *classList;

@end
