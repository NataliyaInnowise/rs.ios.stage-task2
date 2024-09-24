#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    int amount = 0;
    int neededDifference = number.intValue;
    
    for (int i = 0; i < array.count; i++) {
        for (int j = i + 1; j < array.count; j++) {
            int difference = ABS(array[i].intValue - array[j].intValue);
            
            if (difference == neededDifference) {
                amount += 1;
            }
        }
    }
    return amount;
}

@end
