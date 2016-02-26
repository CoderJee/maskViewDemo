//
//  ViewControllerDemoFour.m
//  MaskViewDemo
//
//  Created by iOS_Developer on 16/2/25.
//  Copyright © 2016年 CoderJee. All rights reserved.
//

#import "ViewControllerDemoFour.h"
#import "UIView+Extension.h"
@interface ViewControllerDemoFour ()

@end

@implementation ViewControllerDemoFour

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    background.image        = [UIImage imageNamed:@"base"];
    background.center       = self.view.center;
    [self.view addSubview:background];
    
    
    UIImageView *upGround = [[UIImageView alloc] initWithFrame:background.frame];
    upGround.image        = [UIImage imageNamed:@"background"];
    [self.view addSubview:upGround];
    
    
    UIView *mask      = [[UIView alloc] initWithFrame:upGround.bounds];
    upGround.maskView = mask;
    
    UIImageView *picOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 400)];
    picOne.image        = [UIImage imageNamed:@"mask1"];
    [mask addSubview:picOne];
    
    UIImageView *picTwo = [[UIImageView alloc] initWithFrame:CGRectMake(100, -200, 100, 400)];
    picTwo.image        = [UIImage imageNamed:@"mask"];
    [mask addSubview:picTwo];
    
    [UIView animateWithDuration:2.f delay:2.f options:0 animations:^{
        picOne.y -= 400;
        picTwo.y += 400;
    } completion:^(BOOL finished) {
        
    }];

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
