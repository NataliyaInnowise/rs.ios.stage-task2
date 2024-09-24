#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
        if (![self isTwoDimensionalArray:array]) {
            return @[];
        }
        
        NSMutableArray *numbersArray = [NSMutableArray array];
        NSMutableArray *stringArray = [NSMutableArray array];
        
        for (NSArray *subArray in array) {
            for (id element in subArray) {
                if ([element isKindOfClass:[NSNumber class]]) {
                    [numbersArray addObject:element];
                } else if ([element isKindOfClass:[NSString class]]) {
                    [stringArray addObject:element];
                }
            }
        }
        
        if ([numbersArray count] > 0 && [stringArray count] == 0) {
            [numbersArray sortUsingSelector:@selector(compare:)];
            return numbersArray;
        }
        
        if ([stringArray count] > 0 && [numbersArray count] == 0) {
            // Case 2: Only strings
            [stringArray sortUsingSelector:@selector(compare:)];
            return stringArray;
        }
        
        if ([numbersArray count] > 0 && [stringArray count] > 0) {
            
            [numbersArray sortUsingSelector:@selector(compare:)];
            NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
            NSArray *sortedStrings = [stringArray sortedArrayUsingDescriptors:@[sortDescriptor]];

            return @[numbersArray, sortedStrings];
        }
        
        return @[];
}

- (BOOL)isTwoDimensionalArray:(NSArray *)array {
    for (id element in array) {
        if (![element isKindOfClass:[NSArray class]]) {
            return NO;
        }
    }
    return YES;
}

@end
