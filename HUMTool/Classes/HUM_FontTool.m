//
//  HUM_FontTool.m
//
//  Created by Humioo on 2020/7/29.
//

#import "HUM_FontTool.h"

#define DefaultRegularFont(Size)    [UIFont fontWithName:@"PingFangSC-Regular" size:SIZESCALE(Size)]
#define DefaultMediumFont(Size)     [UIFont fontWithName:@"PingFangSC-Medium" size:SIZESCALE(Size)]
#define DefaultBoldFont(Size)       [UIFont fontWithName:@"PingFangSC-Semibold" size:SIZESCALE(Size)]
@implementation HUM_FontTool
/// 预设定主要UI字号
/// @param HUMCustomFont 字号
/// @param HUMCustomFontType 字体粗细
+ (UIFont *)fontWithCustomFont:(HUMCustomFont)HUMCustomFont andCustomFontType:(HUMCustomFontType)HUMCustomFontType {
    switch (HUMCustomFont) {
        case HUMFont_16px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(8);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(8);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(8);
            }
            
            //用于部分小标签文字
        case HUMFont_20px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(10);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(10);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(10);
            }
            
            //用于提示性文案
        case HUMFont_22px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(11);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(11);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(11);
            }
            
            //用于二级标题下辅助性文字
        case HUMFont_24px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(12);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(12);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(12);
            }
            
            //用于瀑布流标题、分栏标题未选中状态
        case HUMFont_26px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(13);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(13);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(13);
            }
            
            //用于商品订单标题
        case HUMFont_28px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(14);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(14);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(14);
            }
            
            //二级标题-用于分栏标题、二级标题
        case HUMFont_30px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(15);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(15);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(15);
            }
            
        case HUMFont_32px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(16);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(16);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(16);
            }
            
        case HUMFont_34px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(17);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(17);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(17);
            }
            
            //一级标题-用于导航栏、一级标题
        case HUMFont_36px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(18);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(18);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(18);
            }
            
        case HUMFont_40px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(20);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(20);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(20);
            }
            
        case HUMFont_48px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(24);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(24);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(24);
            }
            
        case HUMFont_60px:
            if (HUMCustomFontType == RegularFont) {
                return DefaultRegularFont(30);
            }
            if (HUMCustomFontType == MediumFont) {
                return DefaultMediumFont(30);
            }
            if (HUMCustomFontType == BoldFont) {
                return DefaultBoldFont(30);
            }
        default:
            return DefaultRegularFont(18);
    }
}

+ (UIFont *)fontWithCustomFontSize:(NSInteger)size andCustomFontType:(HUMCustomFontType)HUMCustomFontType {
    if (HUMCustomFontType == RegularFont) {
        return DefaultRegularFont(size);
    }
    if (HUMCustomFontType == MediumFont) {
        return DefaultMediumFont(size);
    }
    if (HUMCustomFontType == BoldFont) {
        return DefaultBoldFont(size);
    }
    return DefaultRegularFont(size);
}
@end
