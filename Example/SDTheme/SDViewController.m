//
//  SDViewController.m
//  SDTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "SDViewController.h"
#import <SDTheme/SDTheme.h>

@interface SDViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UISwitch *switchControl;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *whiteButton;
@property (weak, nonatomic) IBOutlet UIButton *blackButton;

@end

@implementation SDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.indicatorView.theme_color = @"block_activity_indicator";
    self.pageControl.theme_pageIndicatorTintColor = @"block_pageControl_normal";
    self.pageControl.theme_currentPageIndicatorTintColor = @"block_pageControl_current";
    self.textField.theme_textColor = @"text_h1";
    self.textField.theme_attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"最多5个汉字/10个字符" attributes:@{SDThemeForegroundColorAttributeName: @"text_placeholder" }];
    [self.whiteButton theme_setTitleColor:@"text_h1" forState:UIControlStateNormal];
    [self.blackButton theme_setTitleColor:@"text_h1" forState:UIControlStateNormal];
    [self.whiteButton theme_setBackgroundColor:@"block_orange" forState:UIControlStateNormal];
    [self.blackButton theme_setBackgroundColor:@"block_orange" forState:UIControlStateNormal];
    self.switchControl.theme_onTintColor = @"block_orange";
    self.switchControl.theme_thumbTintColor = @"block_tab_bg";
}

- (IBAction)buttonClicked:(UIButton *)sender {
    NSArray *themeArray = @[@"SDTheme-White", @"SDTheme-Black"];
    NSString *themeName = themeArray[sender.tag-100];
    [[SDThemeManager sharedInstance] changeTheme:themeName];
}


@end
