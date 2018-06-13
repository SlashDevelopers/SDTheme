//
//  UIBarItem+SDTheme.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "UIBarItem+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "NSDictionary+SDTheme.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@interface UIBarItem ()

@property (nonatomic, strong) NSMutableDictionary *theme_attributes;

@end

@implementation UIBarItem (SDTheme)

- (void)theme_setTitleTextAttributes:(NSDictionary *)attributes
                            forState:(UIControlState)state
{
    attributes = attributes.theme_replaceTitleTextAttributes;
    self.theme_attributes[@(state)] = attributes;
    [self theme_registChangedNotification];
    [self setTitleTextAttributes:attributes forState:state];
}

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_image) {
        self.image = [[SDThemeManager imageWithName:self.theme_image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    [self.theme_attributes enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, NSDictionary *obj, BOOL * _Nonnull stop) {
        obj = obj.theme_replaceTitleTextAttributes;
        [self setTitleTextAttributes:obj
                            forState:key.unsignedIntegerValue];
    }];
}

// MARK: - ================ Setters ===========================

- (void)setTheme_image:(NSString *)image {
    self.image = [[SDThemeManager imageWithName:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    objc_setAssociatedObject(self, @selector(theme_image), image, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_image {
    return objc_getAssociatedObject(self, @selector(theme_image));
}

- (NSMutableDictionary *)theme_attributes {
    NSMutableDictionary *attributes = objc_getAssociatedObject(self, @selector(theme_attributes));
    if (attributes) {
        return attributes;
    }
    attributes = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, @selector(theme_attributes), attributes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return attributes;
}

@end
