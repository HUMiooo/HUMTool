//
//  HUMFrameworkHeader.h
//  BaseFrame
//
//  Created by Humioo on 2021/7/6.
//  Copyright © 2021 合肥皮诺客科技. All rights reserved.
//

#ifndef HUMFrameworkHeader_h
#define HUMFrameworkHeader_h
#import <MyLayout/MyLayout.h>
#import <QMUIKit/QMUIKit.h>
#import <LSTPopView/LSTPopView.h>

#import "HUMTool.h"//拓展工具类
#import "HUMFontTool.h"//字体工具类
#import "NSString+Price.h"//价格处理拓展
#import "UIView+HUMView.h"//View补充

#import "HUMAppColorManager.h"//颜色管理类

#import "HUMBaseTableViewCell.h"//基于MyLayout 自适应高度TableViewCell
#import "HUMBaseViewController.h"//基于MyLayout
#import "HUMBaseTableViewController.h"//基于MyLayout

//判断是否属于刘海屏幕
static inline BOOL isiPhoneX() {
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return NO;
    }
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            return YES;
        }
    }
    
    return NO;
}
static inline CGFloat statusbarHeight() {
    return (isiPhoneX() ? 44 : 20);
}
static inline CGFloat screenZeroHeight() {
    return (statusbarHeight() - 20);
}
static inline CGFloat naviBarHeight() {
    return 44;
}
static inline CGFloat statusAndNaviHeight() {
    CGFloat statusbar_H = 0;
    statusbar_H = statusbarHeight() + 44;
    return statusbar_H;
}
static inline CGFloat tabbarHeight() {
    return (isiPhoneX() ? 83 : 49);
}
static inline CGFloat touchButtonHeight() {
    return (isiPhoneX() ? 34 : 0);
}

//坐标相关
#define HUMStatusBarHeight          (statusbarHeight())
#define HUMNavigationBarHeight      (naviBarHeight())
#define HUMStatusAndNavbarHeight    (statusAndNaviHeight())
#define HUMTabBarHeight             (tabbarHeight())
#define HUMTouchButtonHeight        (touchButtonHeight())
#define HUMSCRW    ([UIScreen mainScreen].bounds.size.width)
#define HUMSCRH    ([UIScreen mainScreen].bounds.size.height)

//比例适配
#define SIZEFIT_375(r)    HUMSCRW/375.0*(r) //比例 6P
#define SIZEFIT_414(r)    HUMSCRW/414.0*(r) //比例 8P

//系统相关
#define HUMApp_Name [NSBundle mainBundle].infoDictionary[@"CFBundleDisplayName"]
#define HUMAPP_Version [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]
#define HUMAPP_Development_Version [NSBundle mainBundle].infoDictionary[(NSString *)kCFBundleVersionKey]
#endif /* HUMFrameworkHeader_h */
