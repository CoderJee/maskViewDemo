//
//  ViewControllerOne.m
//  MaskViewDemo
//
//  Created by iOS_Developer on 16/2/25.
//  Copyright © 2016年 CoderJee. All rights reserved.
//

#import "ViewControllerOne.h"

@interface ViewControllerOne ()

@end

@implementation ViewControllerOne

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 40, 100, 60)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];

    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    maskView.backgroundColor = [UIColor redColor];
    view.maskView = maskView;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(view.frame) + 20, 100, 60)];
    view1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view1];
    
    UIView *maskView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    maskView1.backgroundColor = [UIColor redColor];
    [view1 addSubview:maskView1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
