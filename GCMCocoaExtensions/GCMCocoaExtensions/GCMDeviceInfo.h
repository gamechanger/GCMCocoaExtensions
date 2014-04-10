//
//  GCMDeviceInfo.h
//  GCMCocoaExtensions
//
//  Created by Jerry Hsu on 11/26/13.
//  Copyright (c) 2013 GameChanger. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IOS7_OR_GREATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define PRE_IOS7 SYSTEM_VERSION_LESS_THAN(@"7.0")

@interface GCMDeviceInfo : NSObject

+ (BOOL)isRetinaDisplay;
+ (BOOL)iPad;

@end
