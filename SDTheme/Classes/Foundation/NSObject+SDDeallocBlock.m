//
//  NSObject+SDDeallocBlock.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "NSObject+SDDeallocBlock.h"
#import <objc/runtime.h>

const void *SDDeallocExecutorsKey = &SDDeallocExecutorsKey;

@interface SDDeallocExecutor : NSObject

@property (nonatomic, copy) void(^deallocExecutorBlock)(void);

@end

@implementation SDDeallocExecutor

- (id)initWithBlock:(void(^)(void))deallocExecutorBlock {
    self = [super init];
    if (self) {
        _deallocExecutorBlock = [deallocExecutorBlock copy];
    }
    return self;
}

- (void)dealloc {
    _deallocExecutorBlock ? _deallocExecutorBlock() : nil;
}

@end


@implementation NSObject (SDDeallocBlock)

- (void)sd_executeAtDealloc:(void (^)(void))block {
    if (block) {
        SDDeallocExecutor *executor = [[SDDeallocExecutor alloc] initWithBlock:block];
        @synchronized (self) {
            [[self hs_deallocExecutors] addObject:executor];
        }
    }
}

- (NSHashTable *)hs_deallocExecutors {
    NSHashTable *table = objc_getAssociatedObject(self,SDDeallocExecutorsKey);
    if (!table) {
        table = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];
        objc_setAssociatedObject(self, SDDeallocExecutorsKey, table, OBJC_ASSOCIATION_RETAIN);
    }
    return table;
}

@end
