//
//  HUMAppColorManager.h
//  HUMTool
//
//  Created by Humioo on 2021/7/14.
//

#import <Foundation/Foundation.h>
#import "HUMFrameworkHeader.h"//FrameworkHeader

#define HUMColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HUMColorA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
//*      hexString 支持以 # 开头和不以 # 开头的 hex 字符串
//*      #RGB        例如#f0f，等同于#ffff00ff，RGBA(255, 0, 255, 1)
//*      #ARGB       例如#0f0f，等同于#00ff00ff，RGBA(255, 0, 255, 0)
//*      #RRGGBB     例如#ff00ff，等同于#ffff00ff，RGBA(255, 0, 255, 1)
//*      #AARRGGBB   例如#00ff00ff，等同于RGBA(255, 0, 255, 0)
#define HUMHexColor(hex) [UIColor qmui_colorWithHexString:(hex)]

NS_ASSUME_NONNULL_BEGIN

@interface HUMAppColorManager : NSObject

/// 色彩管理器全局单例
+ (HUMAppColorManager *)defaultManager;

/// 根据UIUserInterfaceStyle设置对应颜色
/// @param lightHex 浅色模式
/// @param darkHex 暗黑模式
/// @param defaultHex iOS13以下默认颜色
///     hexString 支持以 # 开头和不以 # 开头的 hex 字符串
///     #RGB        例如#f0f，等同于#ffff00ff，RGBA(255, 0, 255, 1)
///     #ARGB       例如#0f0f，等同于#00ff00ff，RGBA(255, 0, 255, 0)
///     #RRGGBB     例如#ff00ff，等同于#ffff00ff，RGBA(255, 0, 255, 1)
///     #AARRGGBB   例如#00ff00ff，等同于RGBA(255, 0, 255, 0)
+ (UIColor *)colorWithLightHex:(nonnull NSString *)lightHex darkHex:(nonnull NSString *)darkHex defaultHex:(nonnull NSString *)defaultHex;

/// 根据UIUserInterfaceStyle设置对应颜色
/// @param lightRGBA 浅色模式
/// @param darkRGBA 暗黑模式
/// @param defaultRGBA iOS13以下默认颜色
+ (UIColor *)colorWithLightRGBA:(nonnull UIColor *)lightRGBA darkRGBA:(nonnull UIColor *)darkRGBA defaultRGBA:(nonnull UIColor *)defaultRGBA;

//========================= 常用颜色设置 =========================
/// App主色调
@property (nonatomic, strong) UIColor *HUM_Color_App_ThemeMain;
//-------------------------- Tabbar ------------------------
@property (nonatomic, strong) UIColor *HUM_Color_Tab_Normal;
@property (nonatomic, strong) UIColor *HUM_Color_Tab_Selected;
//-------------------------- View ------------------------
@property (nonatomic, strong) UIColor *HUM_Color_View_BG;
@property (nonatomic, strong) UIColor *HUM_Color_View_Line;
@property (nonatomic, strong) UIColor *HUM_Color_View_Shadow;
//-------------------------- Cell ------------------------
@property (nonatomic, strong) UIColor *HUM_Color_Cell_BG;
@property (nonatomic, strong) UIColor *HUM_Color_Cell_Line;
@property (nonatomic, strong) UIColor *HUM_Color_Cell_Shadow;
//-------------------------- Text ------------------------
@property (nonatomic, strong) UIColor *HUM_Color_Text_Color_A;
@property (nonatomic, strong) UIColor *HUM_Color_Text_Color_B;
@property (nonatomic, strong) UIColor *HUM_Color_Text_Color_C;
@property (nonatomic, strong) UIColor *HUM_Color_Text_Color_D;
@property (nonatomic, strong) UIColor *HUM_Color_Text_Color_E;
@property (nonatomic, strong) UIColor *HUM_Color_Text_Color_F;
//-------------------------- CustomColor 自定义额外颜色 ------------------------
@property (nonatomic, strong) UIColor *HUM_Color_Custom_A;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_B;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_C;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_D;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_E;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_F;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_G;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_H;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_I;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_J;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_K;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_L;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_M;
@property (nonatomic, strong) UIColor *HUM_Color_Custom_N;
@end

NS_ASSUME_NONNULL_END
