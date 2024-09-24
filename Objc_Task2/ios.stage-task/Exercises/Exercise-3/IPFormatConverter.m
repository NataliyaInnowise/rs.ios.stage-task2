#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if (numbersArray == nil || [numbersArray count] == 0) {
        return @""; 
    }
    
    for (NSNumber *number in numbersArray) {
        NSInteger value = [number integerValue];
        if (value < 0) {
            return @"Negative numbers are not valid for input.";
        }
        if (value > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255."; 
        }
    }
    
    NSMutableArray *arrayToFill = [numbersArray mutableCopy];
    
    while ([arrayToFill count] < 4) {
        [arrayToFill addObject:@(0)];
    }
    
    if ([arrayToFill count] > 4) {
        arrayToFill = [[arrayToFill subarrayWithRange:NSMakeRange(0, 4)]mutableCopy];
    }
    
    NSMutableArray *stringArray = [NSMutableArray arrayWithCapacity:4];
    for (NSNumber *number in arrayToFill) {
        [stringArray addObject:[number stringValue]];
    }
    
    NSString *ipString = [stringArray componentsJoinedByString:@"."];
    
    return ipString;
}

@end
