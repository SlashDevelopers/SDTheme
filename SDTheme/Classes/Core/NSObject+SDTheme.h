//
//  NSObject+SDTheme.h
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved
//

#import <Foundation/Foundation.h>

@interface NSObject (SDTheme)

/**
 * 注册换肤监听，不会重复监听。
 * 收到通知后会调用 theme_didChanged 方法。
 */
- (void)theme_registChangedNotification;

/**
 * 注册换肤监听，不会重复监听。
 * 会立即调用一次 themeChangeBlock，和收到通知后调用
 */
- (void)theme_observerChangedUsingBlock:(void(^)(id observer))themeChangeBlock;

/**
 * 子类重写，收到换肤通知会调用本方法
 */
- (void)theme_didChanged;

@end
