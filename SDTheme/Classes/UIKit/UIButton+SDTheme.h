//
//  UIButton+SDTheme.h
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved
//

#import <UIKit/UIKit.h>

@interface UIButton (SDTheme)

- (void)theme_setImage:(NSString *)imageName
              forState:(UIControlState)state;

- (void)theme_setBackgroundImage:(NSString *)imageName
                        forState:(UIControlState)state;

- (void)theme_setTitleColor:(NSString *)color
                   forState:(UIControlState)state;

- (void)theme_setBackgroundColor:(NSString *)color
                        forState:(UIControlState)state;

- (void)theme_setAttributedTitle:(NSAttributedString *)title
                        forState:(UIControlState)state;

@end
