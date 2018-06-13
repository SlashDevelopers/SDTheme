//
//  UITextField+SDTheme.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "UITextField+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "NSAttributedString+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@interface UITextField ()

@end

@implementation UITextField (SDTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_textColor) {
        self.textColor = [SDThemeManager colorWithID:self.theme_textColor];
    }
    if (self.attributedPlaceholder) {
        self.attributedPlaceholder = self.attributedPlaceholder.theme_replaceRealityColor;
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_textColor:(NSString *)color {
    self.textColor = [SDThemeManager colorWithID:color];
    objc_setAssociatedObject(self, @selector(theme_textColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_attributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
    self.attributedPlaceholder = attributedPlaceholder.theme_replaceRealityColor;
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_textColor {
    return objc_getAssociatedObject(self, @selector(theme_textColor));
}

- (NSAttributedString *)theme_attributedPlaceholder {
    return self.attributedPlaceholder;
}

@end
