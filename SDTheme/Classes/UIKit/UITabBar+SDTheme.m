//
//  UITabBar+SDTheme.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "UITabBar+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@interface UITabBar ()

@end

@implementation UITabBar (SDTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_barTintColor) {
        self.barTintColor = [SDThemeManager colorWithID:self.theme_barTintColor];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_barTintColor:(NSString *)barTintColor {
    self.barTintColor = [SDThemeManager colorWithID:barTintColor];
    objc_setAssociatedObject(self, @selector(theme_barTintColor), barTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_barTintColor {
    return objc_getAssociatedObject(self, @selector(theme_barTintColor));
}

@end
