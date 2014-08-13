#import "SSNumberHelper.h"

@implementation SSNumberHelper



+(BOOL) isNumericValue:(NSString*)string
{
    NSScanner *scanner = [NSScanner scannerWithString: string];
    BOOL isNumeric = [scanner scanDouble:NULL] && [scanner isAtEnd];
    return isNumeric;
}



@end
