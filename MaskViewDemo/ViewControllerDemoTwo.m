//
//  ViewControllerDemoTwo.m
//  MaskViewDemo
//
//  Created by iOS_Developer on 16/2/25.
//  Copyright © 2016年 CoderJee. All rights reserved.
//

#import "ViewControllerDemoTwo.h"
#import "UIView+Extension.h"
@interface ViewControllerDemoTwo ()

@end

@implementation ViewControllerDemoTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head"]];
    imageView.origin = CGPointMake(10, 40);
    [self.view addSubview:imageView];

    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head"]];
    imageView1.origin = CGPointMake(10, CGRectGetMaxY(imageView.frame) + 20);

    UIImageView *maskImage = [[UIImageView alloc] initWithFrame:imageView1.bounds];
    maskImage.image = [UIImage imageNamed:@"gray_green"];
    imageView1.layer.mask = maskImage.layer;
    [self.view.layer addSublayer:imageView1.layer];

    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head"]];
    imageView2.alpha = 0.5;
    imageView2.origin = CGPointMake(10, CGRectGetMaxY(imageView1.frame) + 20);    
    [self.view.layer addSublayer:imageView2.layer];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
