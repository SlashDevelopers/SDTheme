//
//  SDThemeManager.h
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved
//

#import <Foundation/Foundation.h>

/// 主题切换通知
FOUNDATION_EXPORT NSString *const SDThemeChangedNotification;

/// 主题管理
@interface SDThemeManager : NSObject

@property (nonatomic, assign, readonly) NSString *themeName;  ///< 当前主题名称

+ (instancetype)sharedInstance;
/// 初始化主题数组
- (void)setupThemeNameArray:(NSArray *)array;
/// 改变主题
- (BOOL)changeTheme:(NSString *)themeName;
/// 获取颜色
+ (UIColor *)colorWithID:(NSString *)colorID;
/// 获取图片
+ (UIImage *)imageWithName:(NSString *)imageName;
/// 获取颜色值
+ (NSString *)colorStringWithID:(NSString *)colorID;

@end
