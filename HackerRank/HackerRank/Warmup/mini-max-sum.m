/**
 
 https://www.hackerrank.com/challenges/mini-max-sum/problem
 
 Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.
 
 Input Format
 
 A single line of five space-separated integers.
 
 Constraints
 
 Each integer is in the inclusive range .
 Output Format
 
 Print two space-separated long integers denoting the respective minimum and maximum values that can be calculated by summing exactly four of the five integers. (The output can be greater than a 32 bit integer.)
 
 Sample Input
 
 1 2 3 4 5
 Sample Output
 
 10 14
 Explanation
 
 Our initial numbers are , , , , and . We can calculate the following sums using four of the five integers:
 
 If we sum everything except , our sum is .
 If we sum everything except , our sum is .
 If we sum everything except , our sum is .
 If we sum everything except , our sum is .
 If we sum everything except , our sum is .
 Hints: Beware of integer overflow! Use 64-bit Integer.
 */

#import <Foundation/Foundation.h>

struct Result {
    NSInteger minSum, maxSum;
};

struct Result miniMaxSum(NSInteger fiveInts[]) {
    NSInteger minInt = fiveInts[0];
    NSInteger maxInt = fiveInts[0];
    NSInteger sum = fiveInts[0];
    
    for (int i = 1; i < 5; i++) {
        if (fiveInts[i] < minInt) {
            minInt = fiveInts[i];
        }
        if (maxInt < fiveInts[i]) {
            maxInt = fiveInts[i];
        }
        sum += fiveInts[i];
    }
    
    struct Result result;
    result.minSum = sum - maxInt;
    result.maxSum = sum - minInt;
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger i0, i1, i2, i3, i4;
        scanf("%ld %ld %ld %ld %ld", &i0, &i1, &i2, &i3, &i4);
        NSInteger fiveInts[5] = {i0, i1, i2, i3, i4};
        struct Result res = miniMaxSum(fiveInts);
        printf("%ld %ld", res.minSum, res.maxSum);
    }
    return 0;
}
