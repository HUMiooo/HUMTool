//
//  HUMBaseVCConfig.h
//  HUMTool
//
//  Created by Humioo on 2021/8/6.
//

#import <Foundation/Foundation.h>

@interface HUMBaseVCConfig : NSObject
//======================== NavBar ========================
/// 导航栏样式
@property (nonatomic, assign) UIBarStyle HUM_Nav_BarStyle;
/// 是否隐藏nav
@property (nonatomic, assign) BOOL isHiddenNav;
/// 是否隐藏navShadow
@property (nonatomic, assign) BOOL isHiddenNavShadow;
/// nav背景图片 优先度最高
@property (nonatomic, strong) UIImage *HUM_Image_Nav_BGImage;
/// nav背景色 优先度低
@property (nonatomic, strong) UIColor *HUM_Color_Nav_BarBarTintColor;
/// nav按钮颜色
@property (nonatomic, strong) UIColor *HUM_Color_Nav_BarTintColor;
/// 导航栏返回按钮文字
@property (nonatomic, copy) NSString *HUM_String_Nav_BackText;
/// 导航栏返回按钮图片
@property (nonatomic, strong) UIImage *HUM_Image_Nav_BackImage;
/// 导航栏标题属性
@property (nonatomic, strong) NSDictionary *HUM_Attributes_Nav_titleText;
/// 导航栏背景透明度
@property (nonatomic, assign) float HUM_Color_Nav_barAlpha;


//======================== StatusBar ========================
/// 是否隐藏statusBar
@property (nonatomic, assign) BOOL isHiddenStatusBar;
/// 状态栏类型
@property (nonatomic, assign) UIStatusBarStyle HUM_statusBarStyle;

//======================== VC ========================
/// VC背景色
@property (nonatomic, strong) UIColor *HUM_Color_VC_BG;

@end
