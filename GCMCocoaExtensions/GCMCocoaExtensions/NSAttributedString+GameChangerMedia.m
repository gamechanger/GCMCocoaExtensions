//
//  NSAttributedString+GameChangerMedia.m
//  GameChanger
//
//  Created by Jerry Hsu on 7/10/13.
//  Copyright (c) 2013 GameChanger. All rights reserved.
//

#import "NSAttributedString+GameChangerMedia.h"

@implementation NSAttributedString (GameChangerMedia)

- (CGSize) sizeConstrainedToSize:(CGSize)size {
  return [self boundingRectWithSize: size
                            options: NSStringDrawingUsesLineFragmentOrigin
                            context: nil].size;
}

- (CGSize) sizeGivenWidth:(CGFloat)width {
  return [self sizeConstrainedToSize: CGSizeMake(width, CGFLOAT_MAX)];
}

- (CGSize)integralSizeGivenSize:(CGSize)size {
  CGSize ret = [self sizeConstrainedToSize:size];
  ret.width = ceilf(ret.width);
  ret.height = ceilf(ret.height);
  return ret;
}

- (CGFloat) integralHeightGivenWidth:(CGFloat)width {
  return ceilf([self sizeGivenWidth: width].height);
}

@end

@implementation NSMutableAttributedString (GameChangerMedia)

+ (NSMutableAttributedString *)attributedStringFromString:(NSString *)baseString
                                          withDefaultFont:(UIFont *)defaultFont
                                         defaultTextColor:(UIColor *)defaultColor
                                            alternateFont:(UIFont *)alternateFont
                                       alternateTextColor:(UIColor *)alternateColor
                                                separator:(NSString *)separator {
  NSMutableAttributedString* outString = [[NSMutableAttributedString alloc] init];
  NSArray* sections = [baseString componentsSeparatedByString: separator];
  NSDictionary* defaultAttributes = @{
                                      NSFontAttributeName : defaultFont,
                                      NSForegroundColorAttributeName : defaultColor
                                      };
  NSDictionary* alternateAttributes = @{
                                        NSFontAttributeName : alternateFont,
                                        NSForegroundColorAttributeName : alternateColor
                                        };

  [sections enumerateObjectsUsingBlock: ^(NSString* fragment, NSUInteger idx, BOOL *stop) {
    // If idx is even, then use default, odd, alternate.
    NSAttributedString* attributedFragment = [[NSAttributedString alloc] initWithString: fragment
                                                                                    attributes: (idx % 2 == 0) ? defaultAttributes : alternateAttributes];
    [outString appendAttributedString: attributedFragment];
  }];
  return outString;
}

#define FULL_RANGE NSMakeRange(0, [self length])

// Versions to apply attributes over entire range.
- (void) addAttributes:(NSDictionary *)attrs {
  [self addAttributes: attrs range: FULL_RANGE];
}

- (void) addAttribute:(NSString *)name value:(id)value {
  [self addAttribute: name value: value range: FULL_RANGE];
}

// Convenience to set common attribtes.
- (void) addAttributeForTextColor: (UIColor*) textColor range:(NSRange)range {
  [self addAttribute: NSForegroundColorAttributeName value: textColor range: range];
}

- (void) addAttributeForTextBackgroundColor: (UIColor*) textColor range:(NSRange)range {
  [self addAttribute: NSBackgroundColorAttributeName value: textColor range: range];
}

- (void) addAttributeForFont: (UIFont*) font range: (NSRange) range {
  [self addAttribute: NSFontAttributeName value: font range: range];
}

- (void) addAttributeToUnderline: (BOOL) underline range: (NSRange) range {
  [self addAttribute: NSUnderlineStyleAttributeName
               value: @(underline ? NSUnderlineStyleSingle : NSUnderlineStyleNone)
               range: range];
}

- (void) addAttributeForShadow: (NSShadow*) shadow range: (NSRange) range {
  [self addAttribute: NSShadowAttributeName value: shadow range: range];
}

- (void)addAttributeForTextAlignment:(NSTextAlignment)alignment lineBreakMode:(NSLineBreakMode)lineBreakMode range:(NSRange)range {
  NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
  [paragraphStyle setAlignment: alignment];
  [paragraphStyle setLineBreakMode: lineBreakMode];
  [self addAttribute: NSParagraphStyleAttributeName value: paragraphStyle range: range];
}

#pragma mark -

- (void) addAttributeForTextColor: (UIColor*) textColor {
  [self addAttributeForTextColor: textColor range: FULL_RANGE];
}

- (void) addAttributeForTextBackgroundColor: (UIColor*) textColor {
  [self addAttributeForTextBackgroundColor: textColor range: FULL_RANGE];
}

- (void) addAttributeForFont: (UIFont*) font {
  [self addAttributeForFont: font range: FULL_RANGE];
}

- (void) addAttributeToUnderline: (BOOL) underline {
  [self addAttributeToUnderline: underline range: FULL_RANGE];
}

- (void) addAttributeForShadow: (NSShadow*) shadow {
  [self addAttributeForShadow: shadow range: FULL_RANGE];
}

- (void)addAttributeForTextAlignment:(NSTextAlignment)alignment lineBreakMode:(NSLineBreakMode)lineBreakMode {
  [self addAttributeForTextAlignment: alignment lineBreakMode: lineBreakMode range: FULL_RANGE];
}

@end
