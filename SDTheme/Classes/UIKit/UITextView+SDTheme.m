//
//  UITextView+SDTheme.m
//  Pods
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "UITextView+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@implementation UITextView (SDTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_textColor) {
        self.textColor = [SDThemeManager colorWithID:self.theme_textColor];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_textColor:(NSString *)color {
    self.textColor = [SDThemeManager colorWithID:color];
    objc_setAssociatedObject(self, @selector(theme_textColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_textColor {
    return objc_getAssociatedObject(self, @selector(theme_textColor));
}

@end
