//
//  ThemeDataManager.h
//  TinkoffChat
//
//  Created by Aleksandr on 28.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThemeDataManager : NSObject

@property (strong, nonatomic) NSUserDefaults* def;
-(void) saveTheme: (NSString*) theme;
-(void) getTheme: (void (^) (NSString*)) onComplete;

@end

NS_ASSUME_NONNULL_END
