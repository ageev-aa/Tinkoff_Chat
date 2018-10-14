//
//  Themes.m
//  TinkoffChat
//
//  Created by Aleksandr on 12.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

#import "Themes.h"

@implementation Themes

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.theme1 = [UIColor blueColor];
        self.theme2 = [UIColor greenColor];
        self.theme3 = [UIColor yellowColor];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    if(self.theme1) [self.theme1 release];
    if(self.theme2) [self.theme2 release];
    if(self.theme3) [self.theme3 release];
}

@end
