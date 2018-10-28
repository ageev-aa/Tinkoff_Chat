//
//  ThemesViewController.m
//  TinkoffChat
//
//  Created by Aleksandr on 12.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

#import "ThemesViewController.h"

@interface ThemesViewController ()

@end

@implementation ThemesViewController
- (IBAction)closeThemeViewControllerAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)chooseThemeAction:(UIButton*)sender {
    self.themeDataManager = [[ThemeDataManager alloc] init];
    if (sender.tag == 1){
        [self.delegate themesViewController: self didSelectTheme: self.theme.theme1];
        [self.themeDataManager saveTheme: @"theme1"];
    } else if (sender.tag == 2){
        [self.delegate themesViewController: self didSelectTheme: self.theme.theme2];
        [self.themeDataManager saveTheme: @"theme2"];
    }else if (sender.tag == 3){
        [self.delegate themesViewController: self didSelectTheme: self.theme.theme3];
        [self.themeDataManager saveTheme: @"theme3"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.theme = [[Themes alloc] init];
}


@end

