//
//  HUMLightVCConfig.m
//  HUMTool_Example
//
//  Created by Humioo on 2021/8/6.
//  Copyright © 2021 HUMiooo. All rights reserved.
//

#import "HUMLightVCConfig.h"
@interface HUMLightVCConfig ()

@end

static HUMLightVCConfig *defaultConfig;

@implementation HUMLightVCConfig

+ (HUMLightVCConfig *)defaultConfig {
    if (!defaultConfig) {
        static HUMLightVCConfig *defaultConfig = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            defaultConfig = HUMLightVCConfig.new;
            [self createDefaultNavBarWithConfig:defaultConfig];
            [self createDefaultStatusBarWithConfig:defaultConfig];
            [self createDefaultVCWithConfig:defaultConfig];
        });
        return defaultConfig;
    }
    return defaultConfig;
}

/// 恢复初始设置
+ (void)reloadDefaultConfig {
    [self createDefaultNavBarWithConfig:HUMLightVCConfig.defaultConfig];
    [self createDefaultStatusBarWithConfig:HUMLightVCConfig.defaultConfig];
    [self createDefaultVCWithConfig:HUMLightVCConfig.defaultConfig];
}


//======================== NavBar ========================
+ (void)createDefaultNavBarWithConfig:(HUMLightVCConfig *)config {
    /// 导航栏样式
    config.HUM_Nav_BarStyle = UIBarStyleDefault;
    /// 是否隐藏nav
    config.isHiddenNav = NO;
    /// 是否隐藏navShadow
    config.isHiddenNavShadow = YES;
    /// nav背景图片 优先度最高
    config.HUM_Image_Nav_BGImage = [UIImage qmui_imageWithColor:UIColor.qmui_randomColor];
    /// nav背景色 优先度低
    config.HUM_Color_Nav_BarBarTintColor = nil;
    /// nav按钮颜色
    config.HUM_Color_Nav_BarTintColor = UIColor.qmui_randomColor;
    /// 导航栏返回按钮文字
    config.HUM_String_Nav_BackText = @"返回";
    /// 导航栏返回按钮图片
    config.HUM_Image_Nav_BackImage = UIImageMake(@"nav_back_normal");

    /// 导航栏标题属性
    config.HUM_Attributes_Nav_titleText = @{
        NSForegroundColorAttributeName: UIColor.blackColor
    };
    /// 导航栏背景透明度
    config.HUM_Color_Nav_barAlpha = 0;
}

//======================== StatusBar ========================
+ (void)createDefaultStatusBarWithConfig:(HUMLightVCConfig *)config {
    /// 是否隐藏状态栏
    config.isHiddenStatusBar = NO;
    /// 状态栏类型
    config.HUM_statusBarStyle = QMUIStatusBarStyleDarkContent;
}

//======================== VC ========================
+ (void)createDefaultVCWithConfig:(HUMLightVCConfig *)config {
    /// VC背景色
    config.HUM_Color_VC_BG = UIColor.systemPinkColor;
}

@end
