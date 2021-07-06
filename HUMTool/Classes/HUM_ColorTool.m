//
//  HUM_ColorTool.m
//
//  Created by Humioo on 2020/3/23.
//

#import "HUM_ColorTool.h"

#define HUMColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HUMHexColor(hex) [UIColor qmui_colorWithHexString:(hex)]
@implementation HUM_ColorTool
/// 预设定主要UI颜色
/// @param HUMCustomColor 颜色
+ (UIColor *)colorWithCustomColor:(HUMCustomColor)HUMCustomColor {
    
    switch (HUMCustomColor) {
            
            ///主色调 #00A9A9
        case HUMColor_ThemeMain:
            if (@available(iOS 13.0, *)) {
                UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
                    if ([[UITraitCollection currentTraitCollection] userInterfaceStyle] == UIUserInterfaceStyleLight) {
                        return HUMHexColor(@"#00A9A9");
                    } else {
                        return HUMHexColor(@"#00A9A9");
                    }
                }];
                return color;
            } else {
                return HUMHexColor(@"#00A9A9");
            }
            
            ///VC-背景色F5F5F5
        case HUMColor_VCBG:
            if (@available(iOS 13.0, *)) {
                UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
                    if ([[UITraitCollection currentTraitCollection] userInterfaceStyle] == UIUserInterfaceStyleLight) {
                        return HUMHexColor(@"F5F5F5");
                    } else {
                        return HUMHexColor(@"F5F5F5");
                    }
                }];
                return color;
            } else {
                return HUMHexColor(@"F5F5F5");
            }
            
        default:
            return [UIColor clearColor];
    }
}

@end
