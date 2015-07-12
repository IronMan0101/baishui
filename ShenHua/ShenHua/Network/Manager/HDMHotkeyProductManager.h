//
//  HDMHotkeyProductManager.h
//  User
//
//  Created by Sea on 14-6-4.
//
//
#import <Foundation/Foundation.h>

@class HDMHotkey;

@interface HDMHotkeyProductManager : BCManager
{
    
}

@property (nonatomic, strong) HDMHotkey *hotkey;
@property (nonatomic) BOOL is_empty;
@property (nonatomic, strong) NSString *spell_check;

@end
