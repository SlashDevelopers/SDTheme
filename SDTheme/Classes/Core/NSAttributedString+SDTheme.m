//
//  NSAttributedString+SDTheme.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "NSAttributedString+SDTheme.h"
#import "SDThemeManager.h"

NSAttributedStringKey const SDThemeForegroundColorAttributeName = @"SDThemeForegroundColorAttributeName";

@implementation NSAttributedString (SDTheme)

- (NSAttributedString *)theme_replaceRealityColor {
    NSMutableAttributedString *tmpAttributedText = [self mutableCopy];
    [self enumerateAttributesInRange:NSMakeRange(0, self.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        if (!attrs[SDThemeForegroundColorAttributeName]) {
            return;
        }
        NSMutableDictionary *tmpAttrs = [attrs mutableCopy];
        tmpAttrs[NSForegroundColorAttributeName] = [SDThemeManager colorWithID:attrs[SDThemeForegroundColorAttributeName]];
        [tmpAttributedText setAttributes:tmpAttrs range:range];
    }];
    return tmpAttributedText;
}

@end
