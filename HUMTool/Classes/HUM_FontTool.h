//
//  HUM_FontTool.h
//
//  Created by Humioo on 2020/7/29.
//

#import <Foundation/Foundation.h>
#import "HUMFrameworkHeader.h"//FrameworkHeader
//font:'PingFangSC-Regular'
//font:'PingFangSC-Ultralight'
//font:'PingFangSC-Thin'
//font:'PingFangSC-Light'
//font:'PingFangSC-Medium'
//font:'PingFangSC-Semibold'
NS_ASSUME_NONNULL_BEGIN
/// 自定义字号
@interface HUM_FontTool : NSObject
typedef NS_ENUM (NSUInteger) {
    HUMFont_16px = 0,//用于部分小标签文字
    HUMFont_20px,//用于部分小标签文字
    HUMFont_22px,//用于提示性文案
    HUMFont_24px,//用于二级标题下辅助性文字
    HUMFont_26px,//用于瀑布流标题、分栏标题未选中状态
    HUMFont_28px,//用于商品订单标题
    HUMFont_30px,//二级标题-用于分栏标题、二级标题
    HUMFont_32px,//二级标题-用于分栏标题、二级标题
    HUMFont_34px,
    HUMFont_36px,//一级标题-用于导航栏、一级标题
    HUMFont_40px,
    HUMFont_48px,
    HUMFont_52px,
    HUMFont_60px,
} HUMCustomFont;

typedef NS_ENUM (NSUInteger) {
    RegularFont = 100,//一级标题-用于导航栏、一级标题
    MediumFont,//二级标题-用于分栏标题、二级标题
    BoldFont,//用于商品订单标题
} HUMCustomFontType;
/**
 自定义Font

 @param HUMCustomFont HUMCustomFont
 @return UIFont
 */
+ (UIFont *)fontWithCustomFont:(HUMCustomFont)HUMCustomFont andCustomFontType:(HUMCustomFontType)HUMCustomFontType;

/// 快速定义
/// @param size size description
/// @param HUMCustomFontType HUMCustomFontType description
+ (UIFont *)fontWithCustomFontSize:(NSInteger)size andCustomFontType:(HUMCustomFontType)HUMCustomFontType;
@end

NS_ASSUME_NONNULL_END
