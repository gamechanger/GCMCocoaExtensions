//
//  GCMDeviceInfo.m
//  GCMCocoaExtensions
//
//  Created by Jerry Hsu on 11/26/13.
//  Copyright (c) 2013 GameChanger. All rights reserved.
//

#import "GCMDeviceInfo.h"

@implementation GCMDeviceInfo

+ (BOOL)isRetinaDisplay {
  static BOOL retina = NO;
  static BOOL alreadyChecked = NO;
  if (!alreadyChecked) {
    UIScreen *mainScreen = [UIScreen mainScreen];
    if (mainScreen) {
      retina = mainScreen.scale > 1.0;
      alreadyChecked = YES;
    }
  }
  return retina;
}

@end
