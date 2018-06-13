//
//  UITextField+SDTheme.h
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (SDTheme)

@property (nonatomic, copy) NSString *theme_textColor;
@property (nonatomic, copy) NSAttributedString *theme_attributedPlaceholder;

@end
