//
//  ThemesViewController.h
//  TinkoffChat
//
//  Created by Aleksandr on 12.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Themes.h"
#import "ThemesViewControllerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThemesViewController : UIViewController

@property (strong, nonatomic) id <ThemesViewControllerDelegate> delegate;
@property (strong, nonatomic) Themes * theme;

@end

NS_ASSUME_NONNULL_END
