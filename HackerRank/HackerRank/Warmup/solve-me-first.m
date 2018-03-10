/**
 
 https://www.hackerrank.com/challenges/solve-me-first/problem
 
 Complete the function solveMeFirst to compute the sum of two integers.
 
 Function prototype:
 
 int solveMeFirst(int x, int y);
 
 where,
 
 x is the first integer input.
 y is the second integer input
 Return values
 
 sum of the above two integers
 Sample Input
 
 x = 2
 y = 3
 Sample Output
 
 5
 Explanation
 
 The sum of the two integers  and  is computed as: .
 */

#import <Foundation/Foundation.h>

NSInteger solveMeFirst(NSInteger a, NSInteger b) {
    return a + b;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger a, b, res;
        scanf("%ld %ld", &a, &b);
        res = solveMeFirst(a, b);
        printf("%ld", res);
    }
    return 0;
}
