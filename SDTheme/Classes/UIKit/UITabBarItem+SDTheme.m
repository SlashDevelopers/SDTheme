//
//  UITabBarItem+SDTheme.m
//  Pods
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "UITabBarItem+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@implementation UITabBarItem (SDTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_selectedImage) {
        self.selectedImage = [[SDThemeManager imageWithName:self.theme_selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_selectedImage:(NSString *)image {
    self.selectedImage = [[SDThemeManager imageWithName:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    objc_setAssociatedObject(self, @selector(theme_selectedImage), image, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_selectedImage {
    return objc_getAssociatedObject(self, @selector(theme_selectedImage));
}

@end
