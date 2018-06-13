//
//  UINavigationBar+SDTheme.m
//  Pods
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "UINavigationBar+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "NSDictionary+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@interface UINavigationBar ()

@end

@implementation UINavigationBar (SDTheme)

- (void)theme_setBarTintColor:(NSString *)color {
    self.theme_barTintColor = color;
}

- (void)theme_setTitleTextAttributes:(NSDictionary *)attributes {
    [self theme_registChangedNotification];
}

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_barTintColor) {
        self.barTintColor = [SDThemeManager colorWithID:self.theme_barTintColor];
    }
    if (self.titleTextAttributes) {
        self.titleTextAttributes = self.titleTextAttributes.theme_replaceTitleTextAttributes;
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_barTintColor:(NSString *)barTintColor {
    self.barTintColor = [SDThemeManager colorWithID:barTintColor];
    objc_setAssociatedObject(self, @selector(theme_barTintColor), barTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_titleTextAttributes:(NSDictionary *)titleTextAttributes {
    titleTextAttributes = titleTextAttributes.theme_replaceTitleTextAttributes;
    self.titleTextAttributes = titleTextAttributes;
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_barTintColor {
    return objc_getAssociatedObject(self, @selector(theme_barTintColor));
}

- (NSDictionary *)theme_titleTextAttributes {
    return self.titleTextAttributes;
}

@end
