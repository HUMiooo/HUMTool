//
//  HUMAppColorManager.m
//  HUMTool
//
//  Created by Humioo on 2021/7/14.
//

#import "HUMAppColorManager.h"
@interface HUMAppColorManager ()

@end

static HUMAppColorManager *manager;

@implementation HUMAppColorManager
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

/// 设置配置色
/// @param Hex Hex
+ (UIColor *)colorWithCustomColorWithHex:(NSString *)Hex {
    if (@available(iOS 13.0, *)) {
        UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if ([[UITraitCollection currentTraitCollection] userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return HUMHexColor(Hex);
            } else {
                return HUMHexColor(Hex);
            }
        }];
        return color;
    } else {
        return HUMHexColor(Hex);
    }
}

+ (UIColor *)colorWithCustomColorWithRGBA:(UIColor *)RGBA {
    if (@available(iOS 13.0, *)) {
        UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if ([[UITraitCollection currentTraitCollection] userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return RGBA;
            } else {
                return RGBA;
            }
        }];
        return color;
    } else {
        return RGBA;
    }
}
@end
