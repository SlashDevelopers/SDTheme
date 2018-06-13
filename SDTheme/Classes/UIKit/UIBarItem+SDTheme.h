//
//  UIBarItem+SDTheme.h
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarItem (SDTheme)

@property (nonatomic, copy) NSString *theme_image;

- (void)theme_setTitleTextAttributes:(NSDictionary *)attributes
                            forState:(UIControlState)state;

@end
