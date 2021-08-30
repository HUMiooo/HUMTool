//
//  HUMAppColorManager.m
//  HUMTool
//
//  Created by Humioo on 2021/7/14.
//

#import "HUMAppColorManager.h"
static HUMAppColorManager *manager;
@implementation HUMAppColorManager
/// 色彩管理器全局单例
+ (HUMAppColorManager *)defaultManager {
    if (!manager) {
        static HUMAppColorManager *manager = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[HUMAppColorManager alloc] init];
        });
        return manager;
    }
    return manager;
}

/// 根据UIUserInterfaceStyle设置对应颜色
/// @param lightHex 浅色模式
/// @param darkHex 暗黑模式
/// @param defaultHex iOS13以下默认颜色
+ (UIColor *)colorWithLightHex:(nonnull NSString *)lightHex
                       darkHex:(nonnull NSString *)darkHex
                    defaultHex:(nonnull NSString *)defaultHex {
    if (@available(iOS 13.0, *)) {
        UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if ([[UITraitCollection currentTraitCollection] userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return HUMHexColor(lightHex);
            } else {
                return HUMHexColor(darkHex);
            }
        }];
        return color;
    }
    return HUMHexColor(defaultHex);
}

/// 根据UIUserInterfaceStyle设置对应颜色
/// @param lightRGBA 浅色模式
/// @param darkRGBA 暗黑模式
/// @param defaultRGBA iOS13以下默认颜色
+ (UIColor *)colorWithLightRGBA:(nonnull UIColor *)lightRGBA
                       darkRGBA:(nonnull UIColor *)darkRGBA
                    defaultRGBA:(nonnull UIColor *)defaultRGBA {
    if (@available(iOS 13.0, *)) {
        UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if ([[UITraitCollection currentTraitCollection] userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return lightRGBA;
            } else {
                return darkRGBA;
            }
        }];
        return color;
    }
    return defaultRGBA;
}

@end
