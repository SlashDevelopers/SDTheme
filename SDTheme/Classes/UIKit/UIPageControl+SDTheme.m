//
//  UIPageControl+SDTheme.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/5/8.
//

#import "UIPageControl+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@interface UIPageControl ()

@end

@implementation UIPageControl (SDTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_pageIndicatorTintColor) {
        self.pageIndicatorTintColor = [SDThemeManager colorWithID:self.theme_pageIndicatorTintColor];
    }
    if (self.theme_currentPageIndicatorTintColor) {
        self.currentPageIndicatorTintColor = [SDThemeManager colorWithID:self.theme_currentPageIndicatorTintColor];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_pageIndicatorTintColor:(NSString *)pageIndicatorTintColor {
    [self setPageIndicatorTintColor:[SDThemeManager colorWithID:pageIndicatorTintColor]];
    objc_setAssociatedObject(self, @selector(theme_pageIndicatorTintColor), pageIndicatorTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_currentPageIndicatorTintColor:(NSString *)currentPageIndicatorTintColor {
    [self setCurrentPageIndicatorTintColor:[SDThemeManager colorWithID:currentPageIndicatorTintColor]];
    objc_setAssociatedObject(self, @selector(theme_currentPageIndicatorTintColor), currentPageIndicatorTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_pageIndicatorTintColor {
    return objc_getAssociatedObject(self, @selector(theme_pageIndicatorTintColor));
}

- (NSString *)theme_currentPageIndicatorTintColor {
    return objc_getAssociatedObject(self, @selector(theme_currentPageIndicatorTintColor));
}

@end
