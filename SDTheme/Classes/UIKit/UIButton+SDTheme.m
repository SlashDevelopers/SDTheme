//
//  UIButton+SDTheme.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved
//

#import "UIButton+SDTheme.h"
#import "NSObject+SDTheme.h"
#import "NSAttributedString+SDTheme.h"
#import "UIImage+SDExtension.h"
#import "SDThemeManager.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (nonatomic, strong) NSMutableDictionary *theme_images;
@property (nonatomic, strong) NSMutableDictionary *theme_backgroundImages;
@property (nonatomic, strong) NSMutableDictionary *theme_titleColors;
@property (nonatomic, strong) NSMutableDictionary *theme_backgroundColors;
@property (nonatomic, strong) NSMutableDictionary *theme_attributedTitles;

@end

@implementation UIButton (SDTheme)

- (void)theme_setImage:(NSString *)imageName
              forState:(UIControlState)state
{
    self.theme_images[@(state)] = imageName;
    [self theme_registChangedNotification];
    [self setImage:[SDThemeManager imageWithName:imageName] forState:state];
}

- (void)theme_setBackgroundImage:(NSString *)imageName
                        forState:(UIControlState)state
{
    self.theme_backgroundImages[@(state)] = imageName;
    [self theme_registChangedNotification];
    [self setBackgroundImage:[SDThemeManager imageWithName:imageName] forState:state];
}

- (void)theme_setTitleColor:(NSString *)color
                   forState:(UIControlState)state
{
    self.theme_titleColors[@(state)] = color;
    [self theme_registChangedNotification];
    [self setTitleColor:[SDThemeManager colorWithID:color] forState:state];
}

- (void)theme_setBackgroundColor:(NSString *)color
                        forState:(UIControlState)state
{
    UIImage *image = [UIImage sd_imageWithColor:[SDThemeManager colorWithID:color]];
    self.theme_backgroundColors[@(state)] = color;
    [self theme_registChangedNotification];
    [self setBackgroundImage:image forState:state];
}

- (void)theme_setAttributedTitle:(NSAttributedString *)title
                        forState:(UIControlState)state
{
    self.theme_attributedTitles[@(state)] = title;
    [self theme_registChangedNotification];
    [self setAttributedTitle:title.theme_replaceRealityColor forState:state];
}

- (void)theme_didChanged {
    [super theme_didChanged];
    [self.theme_images enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, NSString *obj, BOOL * _Nonnull stop) {
        [self setImage:[SDThemeManager imageWithName:obj]
              forState:key.unsignedIntegerValue];
    }];
    [self.theme_backgroundImages enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, NSString *obj, BOOL * _Nonnull stop) {
        [self setBackgroundImage:[SDThemeManager imageWithName:obj] forState:key.unsignedIntegerValue];
    }];
    [self.theme_titleColors enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, NSString *obj, BOOL * _Nonnull stop) {
        [self setTitleColor:[SDThemeManager colorWithID:obj] forState:key.unsignedIntegerValue];
    }];
    [self.theme_backgroundColors enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, NSString *obj, BOOL * _Nonnull stop) {
        UIImage *image = [UIImage sd_imageWithColor:[SDThemeManager colorWithID:obj]];
        [self setBackgroundImage:image forState:key.unsignedIntegerValue];
    }];
    [self.theme_attributedTitles enumerateKeysAndObjectsUsingBlock:^(NSNumber *key,NSAttributedString *obj, BOOL * _Nonnull stop) {
        [self setAttributedTitle:obj.theme_replaceRealityColor forState:key.unsignedIntegerValue];
    }];
}

// MARK: - ================ Getters ===========================

- (NSMutableDictionary *)theme_images {
    NSMutableDictionary *images = objc_getAssociatedObject(self, @selector(theme_images));
    if (images) {
        return images;
    }
    images = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, @selector(theme_images), images, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return images;
}

- (NSMutableDictionary *)theme_backgroundImages {
    NSMutableDictionary *backgroundImages = objc_getAssociatedObject(self, @selector(theme_backgroundImages));
    if (backgroundImages) {
        return backgroundImages;
    }
    backgroundImages = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, @selector(theme_backgroundImages), backgroundImages, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return backgroundImages;
}

- (NSMutableDictionary *)theme_titleColors {
    NSMutableDictionary *titleColors = objc_getAssociatedObject(self, @selector(theme_titleColors));
    if (titleColors) {
        return titleColors;
    }
    titleColors = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, @selector(theme_titleColors), titleColors, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return titleColors;
}

- (NSMutableDictionary *)theme_backgroundColors {
    NSMutableDictionary *backgroundColors = objc_getAssociatedObject(self, @selector(theme_backgroundColors));
    if (backgroundColors) {
        return backgroundColors;
    }
    backgroundColors = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, @selector(theme_backgroundColors), backgroundColors, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return backgroundColors;
}

- (NSMutableDictionary *)theme_attributedTitles {
    NSMutableDictionary *attributedTitles = objc_getAssociatedObject(self, @selector(theme_attributedTitles));
    if (attributedTitles) {
        return attributedTitles;
    }
    attributedTitles = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, @selector(theme_attributedTitles), attributedTitles, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return attributedTitles;
}

@end
