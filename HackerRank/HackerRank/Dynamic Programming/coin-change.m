/**
 
 https://www.hackerrank.com/challenges/coin-change/problem
 
 In this problem you will be given a list of coin denominations and a target amount. Determine the number of ways the target amount can be arrived at using the denominations available.
 
 Input Format
 
 The first line contains two space-separated integers describing the respective values of  and , where:  is the number of units
 is the number of coin types
 The second line contains  space-separated integers describing the respective values of each coin type :  (the list of distinct coins available in infinite amounts).
 
 Constraints
 
 Each  is guaranteed to be distinct.
 Hints
 
 Solve overlapping subproblems using Dynamic Programming (DP):
 You can solve this problem recursively but will not pass all the test cases without optimizing to eliminate the overlapping subproblems. Think of a way to store and reference previously computed solutions to avoid solving the same subproblem multiple times. * Consider the degenerate cases:
 - How many ways can you make change for  cents? - How many ways can you make change for  cents if you have no coins? * If you're having trouble defining your solutions store, then think about it in terms of the base case . - The answer may be larger than a -bit integer.
 
 Output Format
 
 Print a long integer denoting the number of ways we can get a sum of  from the given infinite supply of  types of coins.
 
 Sample Input 0
 
 4 3
 1 2 3
 Sample Output 0
 
 4
 Explanation 0
 
 There are four ways to make change for  using coins with values given by :
 
 Thus, we print  as our answer.
 
 Sample Input 1
 
 10 4
 2 5 3 6
 Sample Output 1
 
 5
 Explanation 1
 
 There are five ways to make change for  units using coins with values given by :
 
 Thus, we print  as our answer.
 */

#import <Foundation/Foundation.h>

@interface Record: NSObject
@property (nonatomic, assign) NSInteger variantCount;
@property (nonatomic, assign) NSInteger largestElement;
- (id)initWithVariantCount:(NSInteger)variantCount largestElement:(NSInteger)largestElement;
@end

@implementation Record

- (id)initWithVariantCount:(NSInteger)variantCount largestElement:(NSInteger)largestElement {
    if ((self = [super init]) != nil) {
        self.variantCount = variantCount;
        self.largestElement = largestElement;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"count: %ld, largest coin: %ld", _variantCount, _largestElement];
}

@end

NSInteger coinChange(NSInteger targetSum, NSMutableSet *coinTypes) {
    
    
    
    // This method doesn't work because it counts the same variant multiple times (for sum = 4, 1 + 1 + 2 = 1 + 2 + 1 = 2 + 1 + 1)
    
    
    
    NSMutableDictionary *kSum_vs_vRecord = [NSMutableDictionary new];
    for (NSNumber *coin in coinTypes) {
        // add record for each coin itself
        Record *r = [[Record alloc] initWithVariantCount:1 largestElement:coin.integerValue];
        kSum_vs_vRecord[coin] = r;
    }
    for (NSInteger i = 1; i <= targetSum; i++) {
        for (NSNumber *coin in coinTypes) {
            NSInteger coinInt = coin.integerValue;
            NSInteger partial = i - coinInt;
            Record *partialRecord = kSum_vs_vRecord[[NSNumber numberWithInteger:partial]];
            if (partialRecord == nil) { continue; }
            if (coinInt > partialRecord.largestElement) { continue; }
            
            NSInteger count = partialRecord.variantCount;
            if (coinInt == partial) {
                count = 1;
            }
            Record *curRecord = kSum_vs_vRecord[[NSNumber numberWithInteger:i]];
            if (curRecord != nil) {
                curRecord.variantCount += count;
            } else {
                curRecord = [[Record alloc] initWithVariantCount:count largestElement:MAX(coinInt, partialRecord.largestElement)];
                kSum_vs_vRecord[[NSNumber numberWithInteger:i]] = curRecord;
            }
        }
    }
    Record *targetRecord = kSum_vs_vRecord[[NSNumber numberWithInteger:targetSum]];
    return targetRecord.variantCount;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger targetSum;
        NSInteger coinTypeCount;
        scanf("%ld %ld", &targetSum, &coinTypeCount);
        NSMutableSet *coinTypes = [NSMutableSet new];
        for (int i = 0; i < coinTypeCount; i++) {
            NSInteger coinValue;
            scanf("%ld", &coinValue);
            [coinTypes addObject: [NSNumber numberWithInteger: coinValue]];
        }
        printf("%ld", coinChange(targetSum, coinTypes));
    }
    return 0;
}
