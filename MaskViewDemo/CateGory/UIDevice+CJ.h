//
//  UIDevice+CJ.h
//  goubang
//
//  Created by iOS_Developer on 15/11/2.
//  Copyright © 2015年 CoderJee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (CJ)
+ (BOOL)isSystemVersioniOS8;
+ (BOOL)isAllowedNotification;
+ (NSString *)getIPAddress ;
@end
