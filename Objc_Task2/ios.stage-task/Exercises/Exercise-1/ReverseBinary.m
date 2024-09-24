#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    
    NSMutableString *initialString = [NSMutableString stringWithCapacity:8];
    while (n > 0) {
        [initialString insertString:(n % 2 == 0 ? @"0" : @"1") atIndex:0];
        n /= 2;
    }
    
    while ([initialString length] < 8) {
        [initialString insertString:@"0" atIndex:0];
    }
    
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:8];
    for (NSInteger i = [initialString length] - 1; i >= 0; i--) {
        [reversedString appendFormat:@"%C", [initialString characterAtIndex:i]];
    }
    
    NSUInteger result = strtoul([reversedString UTF8String], NULL, 2);
    
    return (UInt8)result;
}
