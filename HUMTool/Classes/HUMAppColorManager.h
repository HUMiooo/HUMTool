//
//  HUMAppColorManager.h
//  HUMTool
//
//  Created by Humioo on 2021/7/14.
//

#import <Foundation/Foundation.h>
#import <HUMTool/HUMTool.h>
//#import "HUMFrameworkHeader.h"//FrameworkHeader

#define HUMColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HUMColorA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define HUMHexColor(hex) [UIColor qmui_colorWithHexString:(hex)]
NS_ASSUME_NONNULL_BEGIN

@interface HUMAppColorManager : NSObject

+ (HUMAppColorManager *)defaultManager;

/// 设置配置色
/// @param Hex Hex description
+ (UIColor *)colorWithCustomColorWithHex:(NSString *)Hex;

+ (UIColor *)colorWithCustomColorWithRGBA:(UIColor *)RGBA;

//-------------------------- VC App ------------------------
/// App主色调
@property (nonatomic, strong) UIColor *HUM_Color_App_ThemeMain;
/// VC背景色
@property (nonatomic, strong) UIColor *HUM_Color_VC_BG;
@property (nonatomic, strong) UIColor *HUM_Color_VC_BG_Dark;
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
//-------------------------- View ------------------------
//-------------------------- View ------------------------
//-------------------------- View ------------------------

@end

NS_ASSUME_NONNULL_END