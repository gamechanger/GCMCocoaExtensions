//
// NSString+GameChangerMedia.m
// GameChanger
//
// Created by Kiril Savino on Wednesday, April 15, 2009
// Copyright 2008 GameChanger. All rights reserved.
//

#import "NSString+GameChangerMedia.h"

@implementation NSString (GameChangerMedia)

- (NSString *)stringByTrimmingWhitespace {
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)stringByTrimmingWhitespaceAndNewlines {
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)isEmpty {
  return [self length] == 0;
}

- (BOOL)isEmptyOrWhitespace {
  return [[self stringByTrimmingWhitespace] isEmpty];
}

- (BOOL)isNotEmptyOrWhitespace {
  return ![[self stringByTrimmingWhitespace] isEmpty];
}

- (BOOL)isNotEmptyOrWhitespaceOrNewlines {
  return ![[self stringByTrimmingWhitespaceAndNewlines] isEmpty];
}

@end
