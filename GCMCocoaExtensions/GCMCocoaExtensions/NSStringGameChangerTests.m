#import <Kiwi.h>
#import "NSString+GameChangerMedia.h"

SPEC_BEGIN(NSStringGameChangerTests)

describe(@"NSString+GameChangerMedia category", ^{
  describe(@"isEmptyOrWhitespace", ^{
    it(@"correctly identifies empty string", ^{
      [[theValue([@"" isEmptyOrWhitespace]) should] beYes];
    });
    it(@"correctly identifies string with spaces and tabs.", ^{
      [[theValue([@" \t" isEmptyOrWhitespace]) should] beYes];
    });
  });
});

SPEC_END
