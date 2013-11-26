//
// NSString+GameChangerMedia.h
// GameChanger
//
// Created by Kiril Savino on Wednesday, April 15, 2009
// Copyright 2008 GameChanger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (GameChangerMedia)
- (NSString*)stringByTrimmingWhitespace;
- (NSString*)stringByTrimmingWhitespaceAndNewlines;
- (BOOL)isEmpty;
- (BOOL)isEmptyOrWhitespace;
- (BOOL)isNotEmptyOrWhitespace;
- (BOOL)isNotEmptyOrWhitespaceOrNewlines;

@end
