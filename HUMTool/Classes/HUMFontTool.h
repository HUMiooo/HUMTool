//
//  HUMFontTool.h
//
//  Created by Humioo on 2020/7/29.
//

#import <Foundation/Foundation.h>
#import "HUMFrameworkHeader.h"//FrameworkHeader
//font:'PingFangSC-Ultralight'
//font:'PingFangSC-Thin'
//font:'PingFangSC-Light'
//font:'PingFangSC-Regular'
//font:'PingFangSC-Medium'
//font:'PingFangSC-Semibold'
NS_ASSUME_NONNULL_BEGIN
/// 自定义字号
@interface HUMFontTool : NSObject
typedef NS_ENUM (NSUInteger) {
    HUMFontTypeUltralight = 100,
    HUMFontTypeThin,
    HUMFontTypeLight,
    HUMFontTypeRegular,
    HUMFontTypeMedium,
    HUMFontTypeSemibold,
} HUMFontType;

/// 快速定义
/// @param size size description
/// @param fontType fontType description
+ (UIFont *)HUM_fontSize:(NSInteger)size fontType:(HUMFontType)fontType;
@end

NS_ASSUME_NONNULL_END
