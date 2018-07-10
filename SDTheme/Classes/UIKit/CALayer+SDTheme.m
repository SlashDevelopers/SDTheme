//
//  CALayer+SDTheme.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/5/18.
//

#import "CALayer+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@interface CALayer ()

@end

@implementation CALayer (SDTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_borderColor) {
        self.borderColor = [SDThemeManager colorWithID:self.theme_borderColor].CGColor;
    }
    if (self.theme_shadowColor) {
        self.shadowColor = [SDThemeManager colorWithID:self.theme_shadowColor].CGColor;
    }
    if (self.theme_backgroundColor) {
        self.backgroundColor = [SDThemeManager colorWithID:self.theme_backgroundColor].CGColor;
    }
}

// MARK: - ================ Setter ===========================

- (void)setTheme_borderColor:(NSString *)color {
    self.borderColor = [SDThemeManager colorWithID:color].CGColor;
    objc_setAssociatedObject(self, @selector(theme_borderColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_shadowColor:(NSString *)color {
    self.shadowColor = [SDThemeManager colorWithID:color].CGColor;
    objc_setAssociatedObject(self, @selector(theme_shadowColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_backgroundColor:(NSString *)color {
    self.backgroundColor = [SDThemeManager colorWithID:color].CGColor;
    objc_setAssociatedObject(self, @selector(theme_backgroundColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getter ===========================

- (NSString *)theme_borderColor {
    return objc_getAssociatedObject(self, @selector(theme_borderColor));
}

- (NSString *)theme_shadowColor {
    return objc_getAssociatedObject(self, @selector(theme_shadowColor));
}

- (NSString *)theme_backgroundColor {
    return objc_getAssociatedObject(self, @selector(theme_backgroundColor));
}

@end
