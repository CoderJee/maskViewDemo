//
//  DDF.m
//  DaiDaiFa
//
//  Created by coder.j on 14/10/23.
//  Copyright (c) 2014年 com.daidaifa. All rights reserved.
//

#import "UIColor+DDF.h"

@implementation UIColor (DDF)

+ (UIColor *)DDF_16_Color:(NSString *)code
{
    NSUInteger length = code.length;
    if ((length == 6) || (length == 8))
    {
        unsigned char color[8];
        sscanf(code.UTF8String, "%02X%02X%02X%02X", (unsigned int *)&color[0], (unsigned int *)&color[1], (unsigned int *)&color[2], (unsigned int *)&color[3]);
        if (length == 6)
        {
            color[3] = 0xFF;
        }
        return [UIColor colorWithRed:color[0]/255.0 green:color[1]/255.0 blue:color[2]/255.0 alpha:color[3]/255.0];
    }
    return [UIColor blackColor];
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}


@end
