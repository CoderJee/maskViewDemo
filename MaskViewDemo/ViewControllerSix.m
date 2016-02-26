//
//  ViewControllerSix.m
//  MaskViewDemo
//
//  Created by iOS_Developer on 16/2/26.
//  Copyright © 2016年 CoderJee. All rights reserved.
//

#import "ViewControllerSix.h"
#import "UIImage+DDF.h"
#define   DEGREES(degrees)  ((M_PI * (degrees))/ 180.f)

@interface ViewControllerSix ()
@property (nonatomic, strong) UIView        *showView;
@property (nonatomic, strong) CAShapeLayer  *maskLayer;
@end

@implementation ViewControllerSix

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    // 拖拽
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    // 关闭CoreAnimation实时动画绘制(核心)
    [CATransaction setDisableActions:YES];
    _maskLayer.position = recognizer.view.center;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"Slice"];
    [self.view addSubview:imageView];
    
    
    _maskLayer = [CAShapeLayer layer];
    
    // 贝塞尔曲线(创建一个圆)
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0)
                                                        radius:100
                                                    startAngle:DEGREES(0)
                                                      endAngle:DEGREES(360)
                                                     clockwise:YES];
    // 获取path
    _maskLayer.path     = path.CGPath;
    _maskLayer.position = CGPointMake(_showView.bounds.size.width/2.f,
                                      _showView.bounds.size.height/2.f);
    // 设置填充颜色为透明
    _maskLayer.fillColor = [UIColor whiteColor].CGColor;
    _maskLayer.position = self.view.center;
    
    UIView *blurView = [[UIView alloc] initWithFrame:self.view.bounds];
    blurView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blurView];
    blurView.layer.mask = _maskLayer;
    blurView.layer.contents = (__bridge id)([[UIImage imageNamed:@"Slice"] imgWithBlur].CGImage);
    
    /* 
     透明的View,用于maskView中的ShapeLayer的参考View(用于拖拽)
     */
    _showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _showView.backgroundColor = [UIColor clearColor];
    _showView.center = self.view.center;
    [self.view addSubview:_showView];
    
    UIPanGestureRecognizer *recognizer = \
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handlePan:)];
    [_showView addGestureRecognizer:recognizer];
}

@end
