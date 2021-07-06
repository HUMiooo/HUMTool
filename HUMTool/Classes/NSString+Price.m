//
//  NSString+Price.m
//  PopularFutures
//
//  Created by RuanYunKeji on 2018/3/2.
//  Copyright © 2018年 WuangZee. All rights reserved.
//

#import "NSString+Price.h"

@implementation NSString (Price)

+ (NSString *)moneyWithMoney:(NSString *)price {
    price = [NSString stringWithFormat:@"%.2f", price.floatValue];
    if (price == nil) {
        return @"--";
    }
    if ([price containsString:@"."]) {
        NSRange location = [price rangeOfString:@"."];
        if (price.length - location.length - location.location > 8) {
            price = [NSString stringWithFormat:@"%lf", price.doubleValue];
            NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:price];
            return number.stringValue;
        } else {
            return price;
        }
    } else {
        return price;
    }
}

+ (NSString *)moneyWithMoneyNoZero:(NSString *)price {
    price = [NSString stringWithFormat:@"%.f", price.floatValue];
    if (price == nil) {
        return @"--";
    }
    if ([price containsString:@"."]) {
        NSRange location = [price rangeOfString:@"."];
        if (price.length - location.length - location.location > 8) {
            price = [NSString stringWithFormat:@"%lf", price.doubleValue];
            NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:price];
            return number.stringValue;
        } else {
            return price;
        }
    } else {
        return price;
    }
}

+ (NSString *)notNull:(NSString *)string {
    if (string.length == 0) {
        return @"--";
    }
    return string;
}

+ (NSString*)removeAllZeroByString:(NSString *)number{
    NSString * outNumber = [NSString stringWithFormat:@"%@",@(number.floatValue)];
    return outNumber;
}

+ (float)floatWithdecimalNumber:(double)num {
    return [[self decimalNumber:num] floatValue];
}

+ (double)doubleWithdecimalNumber:(double)num {
    return [[self decimalNumber:num] doubleValue];
}

+ (NSString *)stringWithDecimalNumber:(double)num {
    return [[self decimalNumber:num] stringValue];
}

+ (NSDecimalNumber *)decimalNumber:(double)num {
    NSString *numString = [NSString stringWithFormat:@"%lf", num];
    return [NSDecimalNumber decimalNumberWithString:numString];
}

@end
