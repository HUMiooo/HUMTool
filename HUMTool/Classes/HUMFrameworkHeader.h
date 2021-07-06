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
#import "HUM_FontTool.h"//字体工具类
#import "HUM_ColorTool.h"//颜色工具类
#import "NSString+Price.h"//价格处理拓展

#import "HUMBaseTableViewCell.h"//基于MyLayout 自适应高度TableViewCell
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
#define SIZESCALE(r)                HUMSCRW/375.0*(r) //比例

#endif /* HUMFrameworkHeader_h */
