//
//  NSDictionary+SDTheme.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/5/8.
//

#import "NSDictionary+SDTheme.h"
#import "NSAttributedString+SDTheme.h"
#import "SDThemeManager.h"

@implementation NSDictionary (SDTheme)

- (NSDictionary *)theme_replaceTitleTextAttributes {
    if (!self[SDThemeForegroundColorAttributeName]) {
        return self;
    }
    NSMutableDictionary *tmpAttributes = [self mutableCopy];
    tmpAttributes[NSForegroundColorAttributeName] = [SDThemeManager colorWithID:self[SDThemeForegroundColorAttributeName]];
    return [tmpAttributes copy];
}

@end

