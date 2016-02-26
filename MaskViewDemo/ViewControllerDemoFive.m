//
//  ViewControllerDemoFive.m
//  MaskViewDemo
//
//  Created by iOS_Developer on 16/2/25.
//  Copyright © 2016年 CoderJee. All rights reserved.
//

#import "ViewControllerDemoFive.h"
#import "UIColor+DDF.h"
#import "UIView+Extension.h"
@interface ViewControllerDemoFive ()
@property (nonatomic, weak)CAGradientLayer *gradientLayer;
@property (nonatomic, strong)NSArray *colors;
@property (nonatomic, strong)UILabel *unlock;
@end

@implementation ViewControllerDemoFive

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // 渐变Layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.frame = CGRectMake(0, 200, self.view.width, 64);
    gradientLayer.colors = @[
                             (__bridge id)[UIColor blackColor].CGColor,
                              (__bridge id)[UIColor whiteColor].CGColor,
                              (__bridge id)[UIColor blackColor].CGColor,
                             ];
    gradientLayer.locations = @[@0.25,@0.5,@0.75];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);

    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    basicAnimation.fromValue = @[@0, @0, @0.25];
    basicAnimation.toValue = @[@0.75, @1, @1];
    basicAnimation.duration = 2.5;
    basicAnimation.repeatCount = HUGE;
    [gradientLayer addAnimation:basicAnimation forKey:nil];
   
    UILabel *unlock = [[UILabel alloc] initWithFrame:gradientLayer.bounds];
    self.unlock = unlock;
    unlock.alpha = 0.5;
    unlock.text = @"滑动来解锁 >>";
    unlock.textAlignment = NSTextAlignmentCenter;
    unlock.font = [UIFont boldSystemFontOfSize:30];
        gradientLayer.mask = unlock.layer;
}

@end
