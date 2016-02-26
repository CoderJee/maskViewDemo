//
//  UITabBar+badge.m
//  ZouZou
//
//  Created by CoderJee on 15/6/8.
//  Copyright (c) 2015年 com.huazhi. All rights reserved.
//

#import "UITabBar+badge.h"
#define TabbarItemNums 5
@implementation UITabBar (badge)
- (void)showBadgeOnItemIndex:(int)index{
    
    [self removeBadgeOnItemIndex:index];
    
    UIView *badgeView = [[UIView alloc]init];
    
    badgeView.tag = 888 + index;
    
    badgeView.backgroundColor = [UIColor redColor];
    
    CGRect tabFrame = self.frame;
    
    float percentX = (index +0.6) / TabbarItemNums;
    
    CGFloat x = ceilf(percentX * tabFrame.size.width) + 5;
    
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    
    badgeView.frame = CGRectMake(x, y, 5, 5);
    
    badgeView.layer.cornerRadius = badgeView.frame.size.width * 0.5;
    
    [self addSubview:badgeView];
    
}

- (void)hideBadgeOnItemIndex:(int)index{
    
    [self removeBadgeOnItemIndex:index];
    
}

- (void)removeBadgeOnItemIndex:(int)index{
    
    for (UIView *subView in self.subviews) {
        
        if (subView.tag == 888+index) {
            
            [subView removeFromSuperview];
            
        }
    }
}
@end
