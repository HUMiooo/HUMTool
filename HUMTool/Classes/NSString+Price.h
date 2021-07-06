//
//  NSString+Price.h
//  PopularFutures
//
//  Created by RuanYunKeji on 2018/3/2.
//  Copyright © 2018年 WuangZee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Price)

/// 价格留两位小数点
/// @param price 价格
+ (NSString *)moneyWithMoney:(NSString *)price;

/// 价格不留小数点
/// @param price 价格
+ (NSString *)moneyWithMoneyNoZero:(NSString *)price;

+ (NSString *)notNull:(NSString *)string;

/// 去除无效0
/// @param number 传入数值
+ (NSString *)removeAllZeroByString:(NSString *)number;

//处理精度丢失
+ (float)floatWithdecimalNumber:(double)num;
+ (double)doubleWithdecimalNumber:(double)num;
+ (NSString *)stringWithDecimalNumber:(double)num;
@end
