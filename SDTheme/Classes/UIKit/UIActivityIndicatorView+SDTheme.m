//
//  UIActivityIndicatorView+SDTheme.m
//  Pods
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "UIActivityIndicatorView+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@implementation UIActivityIndicatorView (SDTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_color) {
        self.color = [SDThemeManager colorWithID:self.theme_color];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_color:(NSString *)color {
    self.color = [SDThemeManager colorWithID:color];
    objc_setAssociatedObject(self, @selector(theme_color), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_color {
    return objc_getAssociatedObject(self, @selector(theme_color));
}

@end
