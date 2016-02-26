//
//  ViewControllerDemoThree.m
//  MaskViewDemo
//
//  Created by iOS_Developer on 16/2/25.
//  Copyright © 2016年 CoderJee. All rights reserved.
//

#import "ViewControllerDemoThree.h"
#import "UIColor+DDF.h"
@interface ViewControllerDemoThree ()

@end

@implementation ViewControllerDemoThree

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor colorWithRed:145.0 / 255.0
                                                green:191.0 / 255.0
                                                 blue:192.0 / 255.0
                                                alpha:1.0];
    UIImage *star = [UIImage imageNamed:@"Star"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:star];
    imageView.frame = view.frame;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:view];
    view.maskView = imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
