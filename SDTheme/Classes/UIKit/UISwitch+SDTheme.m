//
//  UISwitch+SDTheme.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/5/8.
//

#import "UISwitch+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@interface UISwitch ()

@end

@implementation UISwitch (SDTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_onTintColor) {
        UIColor *color = [SDThemeManager colorWithID:self.theme_onTintColor];
        self.onTintColor = color;
    }
    if (self.theme_thumbTintColor) {
        UIColor *color = [SDThemeManager colorWithID:self.theme_thumbTintColor];
        self.thumbTintColor = color;
    }
}

// MARK: - ================ Setter ===========================

- (void)setTheme_onTintColor:(NSString *)color {
    self.onTintColor = [SDThemeManager colorWithID:color];
    objc_setAssociatedObject(self, @selector(theme_onTintColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_thumbTintColor:(NSString *)color {
    self.thumbTintColor = [SDThemeManager colorWithID:color];
    objc_setAssociatedObject(self, @selector(theme_thumbTintColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getter ===========================

- (NSString *)theme_onTintColor {
    return objc_getAssociatedObject(self, @selector(theme_onTintColor));
}

- (NSString *)theme_thumbTintColor {
    return objc_getAssociatedObject(self, @selector(theme_thumbTintColor));
}

@end
