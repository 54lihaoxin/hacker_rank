/**
 
 https://www.hackerrank.com/challenges/time-conversion/problem
 
 Given a time in -hour AM/PM format, convert it to military (24-hour) time.
 
 Note: Midnight is 12:00:00AM on a 12-hour clock, and 00:00:00 on a 24-hour clock. Noon is 12:00:00PM on a 12-hour clock, and 12:00:00 on a 24-hour clock.
 
 Complete the timeConversion function which takes 1 argument, a string s and returns a string denoting the 24-hr formatted time.
 
 Raw Input Format
 
 A single string  containing a time in -hour clock format (i.e.:  or ), where  and .
 
 Sample Input 0
 
 07:05:45PM
 Sample Output 0
 
 19:05:45
 */

#import <Foundation/Foundation.h>

NSString *timeConversion(NSString *time) {
    NSInteger hourIn12 = [[time substringToIndex: 2] integerValue];
    NSInteger hourIn24;
    if ([time.lowercaseString hasSuffix: @"am"]) {
        if (hourIn12 == 12) {
            hourIn24 = 0;
        } else {
            hourIn24 = hourIn12;
        }
    } else {
        if (hourIn12 == 12) {
            hourIn24 = 12;
        } else {
            hourIn24 = hourIn12 + 12;
        }
    }
    NSString *format;
    if (hourIn24 < 10) {
        format = @"0%ld%@";
    } else {
        format = @"%ld%@";
    }
    return [NSString stringWithFormat: format, hourIn24, [time substringWithRange: NSMakeRange(2, time.length - 4)]];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char *charInput = (char *)malloc(512000 * sizeof(char));
        scanf("%s", charInput);
        NSString *r = timeConversion([NSString stringWithFormat: @"%s", charInput]);
        printf("%s", r.UTF8String);
    }
    return 0;
}
