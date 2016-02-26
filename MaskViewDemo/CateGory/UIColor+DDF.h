//
//  DDF.h
//  DaiDaiFa
//
//  Created by coder.j on 14/10/23.
//  Copyright (c) 2014年 com.daidaifa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIColor (DDF)
/**
    转16进制颜色
    使用此方法转16进制颜色,传16进制时需将‘#’去掉
 */
+ (UIColor *)DDF_16_Color:(NSString *)code;

/**
 *  将16进制的颜色直接转成可用的UIColor
 *
 *  @param color 16进制颜色
 *
 *  @return 返回的UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 *  将16进制的颜色直接转成可用的UIColor并可以透明度
 *
 *  @param color 16进制颜色
 *  @param alpha 颜色透明度
 *
 *  @return 一定透明度的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
