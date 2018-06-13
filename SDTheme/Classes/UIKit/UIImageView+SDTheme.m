//
//  UIImageView+SDTheme.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "UIImageView+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@interface UIImageView ()

@end

@implementation UIImageView (SDTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_image) {
        self.image = [SDThemeManager imageWithName:self.theme_image];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_image:(NSString *)image {
    self.image = [SDThemeManager imageWithName:image];
    objc_setAssociatedObject(self, @selector(theme_image), image, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setSd_image:(NSString *)sd_image {
    self.theme_image = sd_image;
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_image {
    return objc_getAssociatedObject(self, @selector(theme_image));
}

- (NSString *)sd_image {
    return self.theme_image;
}

@end
