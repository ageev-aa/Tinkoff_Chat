//
//  ThemesViewControllerDelegate.h
//  TinkoffChat
//
//  Created by Aleksandr on 12.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ThemesViewController; 

@protocol ThemesViewControllerDelegate <NSObject>

- (void)themesViewController: (ThemesViewController *)controller
              didSelectTheme:(UIColor *)selectedTheme;

@end
