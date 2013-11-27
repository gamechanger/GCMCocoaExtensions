//
//  NSAttributedString+GameChangerMedia.h
//  GameChanger
//
//  Created by Jerry Hsu on 7/10/13.
//  Copyright (c) 2013 GameChanger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (GameChangerMedia)

- (CGSize) sizeConstrainedToSize: (CGSize) size;
- (CGSize) sizeGivenWidth: (CGFloat) width;
- (CGFloat) integralHeightGivenWidth: (CGFloat) width;

@end

@interface NSMutableAttributedString (GameChangerMedia)

// Looks for text surrounded by __ and applies the alternate settings to that text.
+ (NSMutableAttributedString*) attributedStringFromString: (NSString*) baseString
                                          withDefaultFont: (UIFont*) defaultFont
                                         defaultTextColor: (UIColor*) defaultColor
                                            alternateFont: (UIFont*) alternateFont
                                       alternateTextColor: (UIColor*) alternateColor
                                                separator: (NSString*) separator;

// Versions to apply attributes over entire range.
- (void) addAttributes:(NSDictionary *)attrs;
- (void) addAttribute:(NSString *)name value:(id)value;

// Convenience to set common attribtes.
- (void) addAttributeForTextColor: (UIColor*) textColor;
- (void) addAttributeForTextBackgroundColor: (UIColor*) textColor;
- (void) addAttributeForFont: (UIFont*) font;
- (void) addAttributeToUnderline: (BOOL) underline;
- (void) addAttributeForShadow: (NSShadow*) shadow;
- (void) addAttributeForTextAlignment: (NSTextAlignment) alignment lineBreakMode: (NSLineBreakMode) lineBreakMode;

- (void) addAttributeForTextColor: (UIColor*) textColor range:(NSRange)range;
- (void) addAttributeForTextBackgroundColor: (UIColor*) textColor range:(NSRange)range;
- (void) addAttributeForFont: (UIFont*) font range: (NSRange) range;
- (void) addAttributeToUnderline: (BOOL) underline range: (NSRange) range;
- (void) addAttributeForShadow: (NSShadow*) shadow range: (NSRange) range;
- (void) addAttributeForTextAlignment: (NSTextAlignment) alignment lineBreakMode: (NSLineBreakMode) lineBreakMode range: (NSRange) range;

@end
