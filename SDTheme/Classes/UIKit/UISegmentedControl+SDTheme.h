//
//  UISegmentedControl+SDTheme.h
//  SDTheme
//
//  Created by SlashDevelopers on 2018/5/8.
//

#import <UIKit/UIKit.h>

@interface UISegmentedControl (SDTheme)

- (void)theme_setTitleTextAttributes:(NSDictionary *)attributes
                            forState:(UIControlState)state;

@end
