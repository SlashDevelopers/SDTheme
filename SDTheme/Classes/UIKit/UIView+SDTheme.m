//
//  UIView+SDTheme.m
//  HuashengSecurities
//
//  Created by SlashDevelopers on 2018/4/25.
//  Copyright © 2018年 www.hstong.com. All rights reserved.
//

#import "UIView+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@interface UIView ()

@end

@implementation UIView (SDTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_backgroundColor) {
        self.backgroundColor = [SDThemeManager colorWithID:self.theme_backgroundColor];
    }
    if (self.theme_tintColor) {
        self.tintColor = [SDThemeManager colorWithID:self.theme_tintColor];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_backgroundColor:(NSString *)backgroundColorId {
    self.backgroundColor = [SDThemeManager colorWithID:backgroundColorId];
    objc_setAssociatedObject(self, @selector(theme_backgroundColor), backgroundColorId, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_tintColor:(NSString *)tintColorId {
    self.tintColor = [SDThemeManager colorWithID:tintColorId];
    objc_setAssociatedObject(self, @selector(theme_tintColor), tintColorId, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setSd_background:(NSString *)sd_background {
    self.theme_backgroundColor = sd_background;
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_backgroundColor {
    return objc_getAssociatedObject(self, @selector(theme_backgroundColor));
}

- (NSString *)theme_tintColor {
    return objc_getAssociatedObject(self, @selector(theme_tintColor));
}

- (NSString *)sd_background {
    return self.theme_backgroundColor;
}

@end
