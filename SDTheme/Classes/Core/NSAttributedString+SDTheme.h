//
//  NSAttributedString+SDTheme.h
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSAttributedStringKey const SDThemeForegroundColorAttributeName;

@interface NSAttributedString (SDTheme)

/// 取得真实颜色值
- (NSAttributedString *)theme_replaceRealityColor;

@end
