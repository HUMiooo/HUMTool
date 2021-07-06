//
//  HUM_ColorTool.h
//
//  Created by Humioo on 2020/3/23.
//

#import <Foundation/Foundation.h>
#import "HUMFrameworkHeader.h"//FrameworkHeader
NS_ASSUME_NONNULL_BEGIN

/// 自定义颜色，对应深色模式与浅色模式
@interface HUM_ColorTool : NSObject
typedef NS_ENUM (NSUInteger) {
    ///APP主题色00A9A9
    HUMColor_ThemeMain,
    ///VC-背景色F5F5F5
    HUMColor_VCBG,
} HUMCustomColor;

/**
 自定义色

 @param HUMCustomColor HUMCustomColor
 @return UIColor
 */
+ (UIColor *)colorWithCustomColor:(HUMCustomColor)HUMCustomColor;
@end

NS_ASSUME_NONNULL_END
