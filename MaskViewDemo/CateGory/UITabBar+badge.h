//
//  UITabBar+badge.h
//  ZouZou
//
//  Created by CoderJee on 15/6/8.
//  Copyright (c) 2015年 com.huazhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)
- (void)hideBadgeOnItemIndex:(int)index;
- (void)showBadgeOnItemIndex:(int)index;
@end
