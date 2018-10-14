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

-(IBAction)firstThemeAction:(id)sender {
    [self.delegate themesViewController: self didSelectTheme: self.theme.theme1];
}
-(IBAction)secondThemeAction:(id)sender {
    [self.delegate themesViewController: self didSelectTheme: self.theme.theme2];
}
-(IBAction)thirdThemeAction:(id)sender {
    [self.delegate themesViewController: self didSelectTheme: self.theme.theme3];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.theme = [[Themes alloc] init];
}

- (void)dealloc {
    if(self.theme!=NULL){
        [self.theme release];
    }
    if(self.delegate!=NULL){
        [self.delegate release];
    }
    [super dealloc];
}

@end
