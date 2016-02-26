//
//  MainTableViewController.m
//  MaskViewDemo
//
//  Created by iOS_Developer on 16/2/25.
//  Copyright © 2016年 CoderJee. All rights reserved.
//

#import "MainTableViewController.h"
#import "ViewControllerOne.h"
#import "ViewControllerSix.h"
#import "ViewControllerDemoTwo.h"
#import "ViewControllerDemoThree.h"
#import "ViewControllerDemoFour.h"
#import "ViewControllerDemoFive.h"
@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"maskView讲解及使用";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MaskDemo "];
    if (!cell) {
        cell  =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MaskDemo"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSString *title = nil;
    switch (indexPath.row) {
        case 0:
            title = @"maskView原理讲解Demo1";
            break;
        case 1:
            title = @"maskView原理讲解Demo2";
            break;
        case 2:
            title = @"maskView基本使用";
            break;
        case 3:
            title = @"maskView多张图片动画";
            break;
        case 4:
            title = @"maskView配合CAShapeLayer使用";
            break;
        case 5:
            title = @"maskView配合CAGradientLayer使用";
            break;
        default:
            break;
    }
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            ViewControllerOne *one = [[ViewControllerOne alloc] init];
            [self.navigationController pushViewController:one animated:YES];
        }
            break;
        case 1:
        {
            ViewControllerDemoTwo *demoTwo = [[ViewControllerDemoTwo alloc] init];
            [self.navigationController pushViewController:demoTwo animated:YES];
        }
            break;
        case 2:
        {
            ViewControllerDemoThree *demoThree = [[ViewControllerDemoThree alloc] init];
            [self.navigationController pushViewController:demoThree animated:YES];
        }
            break;
        case 3:
        {
            ViewControllerDemoFour *demoFour = [[ViewControllerDemoFour alloc] init];
            [self.navigationController pushViewController:demoFour animated:YES];
        }
            break;
        case 4:
        {
            ViewControllerSix *viewCon = [[ViewControllerSix alloc] init];
            [self.navigationController pushViewController:viewCon animated:YES];
            break;
        }
        case 5:
        {
            ViewControllerDemoFive *demoFive = [[ViewControllerDemoFive alloc] init];
            [self.navigationController pushViewController:demoFive animated:YES];
        }
            break;
        default:
            break;
    }
}



@end
