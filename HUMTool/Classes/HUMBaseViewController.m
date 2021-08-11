//
//  HUMBaseViewController.m
//
//

#import "HUMBaseViewController.h"
@interface HUMBaseViewController ()
@end

@implementation HUMBaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initSubviews {
    [super initSubviews];
    [self setDefaultConfig];
}

- (HUMBaseVCConfig *)config {
    if (!_config) {
        _config = HUMBaseVCConfig.new;
    }
    return _config;
}

- (MyFrameLayout *)frameLayout {
    if (!_frameLayout) {
        _frameLayout = MyFrameLayout.new;
        _frameLayout.backgroundColor = UIColor.clearColor;
    }
    return _frameLayout;
}

/// 设置页面默认Config
- (void)setDefaultConfig {
    self.view = self.frameLayout;
    self.view.backgroundColor = self.config.HUM_Color_VC_BG;
    //======================== StatusBar ========================
    /// 是否隐藏状态栏
    self.hbd_statusBarHidden = self.config.isHiddenStatusBar;
    /// 状态栏类型
    (self.config.HUM_statusBarStyle == UIStatusBarStyleLightContent) ? (self.hbd_blackBarStyle = YES) : (self.hbd_blackBarStyle = NO);
    //======================== NavBar ========================
    /// 是否隐藏nav
    self.hbd_barHidden = self.config.isHiddenNav;
    /// 是否隐藏navShadow
    self.hbd_barShadowHidden = self.config.isHiddenNavShadow;
    /// nav背景图片
    self.hbd_barImage = self.config.HUM_Image_Nav_BGImage;
    /// nav背景颜色
    self.hbd_barTintColor = self.config.HUM_Color_Nav_BarBarTintColor;
    /// nav按钮颜色
    self.hbd_tintColor = self.config.HUM_Color_Nav_BarTintColor;
    /// 导航栏标题属性
    self.hbd_titleTextAttributes = self.config.HUM_Attributes_Nav_titleText;
    /// 导航栏背景透明度
    self.hbd_barAlpha = self.config.HUM_Color_Nav_barAlpha;
}

/// 设置导航栏按钮
- (void)setupNavigationItems {
    [super setupNavigationItems];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.tintColor = self.config.HUM_Color_Nav_BarTintColor;
    if (self.config.HUM_Image_Nav_BackImage) {
        if (self.config.HUM_Color_Nav_BarTintColor) {
            self.navigationController.navigationBar.backIndicatorImage = [self.config.HUM_Image_Nav_BackImage qmui_imageWithTintColor:self.config.HUM_Color_Nav_BarTintColor];
            self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [self.config.HUM_Image_Nav_BackImage qmui_imageWithTintColor:self.config.HUM_Color_Nav_BarTintColor];
        } else {
            self.navigationController.navigationBar.backIndicatorImage = [self.config.HUM_Image_Nav_BackImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [self.config.HUM_Image_Nav_BackImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
    }
    if (self.config.HUM_String_Nav_BackText) {
        backItem.title = self.config.HUM_String_Nav_BackText;
    }
    if (!self.config.HUM_Image_Nav_BackImage && !self.config.HUM_String_Nav_BackText) {
        return;
    } else {
        self.navigationItem.backBarButtonItem = backItem;
    }
}

/// 设置scrollView自动调整
/// @param scrollView scrollView description
/// @param isOn 是否开启
- (void)setScrollViewContentInsetAdjustmentBehaviorWithScrollView:(UIScrollView *)scrollView isOn:(BOOL)isOn {
    if (@available(iOS 13.0, *)) {
        scrollView.automaticallyAdjustsScrollIndicatorInsets = isOn;
    } else {
        scrollView.contentInsetAdjustmentBehavior = isOn ? UIScrollViewContentInsetAdjustmentAutomatic : UIScrollViewContentInsetAdjustmentNever;
    }
}

/// 设置状态栏隐藏
- (BOOL)prefersStatusBarHidden {
    if (@available(iOS 13.0, *)) {
        return self.config.isHiddenStatusBar;
    } else {
        return NO;
    }
}

@end
