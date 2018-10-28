//
//  ThemeDataManager.m
//  TinkoffChat
//
//  Created by Aleksandr on 28.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

#import "ThemeDataManager.h"

@implementation ThemeDataManager


-(void) saveTheme: (NSString*) theme{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        self.def = [[NSUserDefaults alloc]init];
        [self.def setValue:theme forKey:@"theme"];
    });
}

-(void) getTheme: (void (^) (NSString*)) onComplete{
    __block NSString* theme;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        self.def = [[NSUserDefaults alloc]init];
        theme = [self.def stringForKey:@"theme"];
        onComplete(theme);
    });
}

@end
