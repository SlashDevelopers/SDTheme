//
//  UITableView+SDTheme.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "UITableView+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@implementation UITableView (SDTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_separatorColor) {
        self.separatorColor = [SDThemeManager colorWithID:self.theme_separatorColor];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_separatorColor:(NSString *)separatorColor {
    self.separatorColor = [SDThemeManager colorWithID:separatorColor];
    objc_setAssociatedObject(self, @selector(theme_separatorColor), separatorColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_separatorColor {
    return objc_getAssociatedObject(self, @selector(theme_separatorColor));
}

@end
