//
//  UIDevice+CJ.m
//  goubang
//
//  Created by iOS_Developer on 15/11/2.
//  Copyright © 2015年 CoderJee. All rights reserved.
//

#import "UIDevice+CJ.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
@implementation UIDevice (CJ)

+ (BOOL)isSystemVersioniOS8 {
     //check systemVerson of device
     UIDevice *device = [UIDevice currentDevice];
     float sysVersion = [device.systemVersion floatValue];

     if (sysVersion >= 8.0f) {
             return YES;
         }
     return NO;
 }

+ (BOOL)isAllowedNotification {
        //iOS8 check if user allow notification
    if ([UIDevice isSystemVersioniOS8]) {// system is iOS8
            UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
            if (UIUserNotificationTypeNone != setting.types) {
                    return YES;
                }
        } else {//iOS7
                UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
                if(UIRemoteNotificationTypeNone != type)
                    return YES;
            }

    return NO;
}

+ (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;}

@end
