//
//  NSObject+SDDeallocBlock.h
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SDDeallocBlock)

- (void)sd_executeAtDealloc:(void (^)(void))block;

@end
