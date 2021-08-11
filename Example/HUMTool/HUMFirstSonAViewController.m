//
//  HUMFirstSonAViewController.m
//  HUMTool_Example
//
//  Created by Humioo on 2021/8/6.
//  Copyright © 2021 HUMiooo. All rights reserved.
//

#import "HUMFirstSonAViewController.h"
#import "HUMFirstSonBViewController.h"

#import "HUMDarkVCConfig.h"
#import "HUMLightVCConfig.h"
@interface HUMFirstSonAViewController ()
@property (nonatomic, strong) QMUILabel *topLabel;
@property (nonatomic, strong) QMUILabel *bottomLabel;
@end

@implementation HUMFirstSonAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initSubviews {
    [super initSubviews];
    self.frameLayout.insetsPaddingFromSafeArea = UIRectEdgeNone;

    HUMWeak(self, weakSelf);
    QMUIButton *reloadUIRectEdge_Btn = [QMUIButton buttonWithType:UIButtonTypeCustom];
    [reloadUIRectEdge_Btn setTitle:@"切换UIRectEdge" forState:UIControlStateNormal];
    reloadUIRectEdge_Btn.mySize = CGSizeMake(MyLayoutSize.wrap, 44);
    reloadUIRectEdge_Btn.myBottom = 20 + 88;
    reloadUIRectEdge_Btn.myCenterX = 0;
    reloadUIRectEdge_Btn.qmui_tapBlock = ^(__kindof UIControl *sender) {
        [weakSelf handleSomething_reloadUIRectEdge_Btn:sender];
    };
    [self.view addSubview:reloadUIRectEdge_Btn];
        
    QMUIButton *nextVC_A_Btn = [QMUIButton buttonWithType:UIButtonTypeCustom];
    [nextVC_A_Btn setTitle:@"A_默认Nav透明_变色" forState:UIControlStateNormal];
    nextVC_A_Btn.mySize = CGSizeMake(MyLayoutSize.wrap, 44);
    nextVC_A_Btn.myTop = 20 + 88;
    nextVC_A_Btn.myCenterX = 0;
    nextVC_A_Btn.qmui_tapBlock = ^(__kindof UIControl *sender) {
        [weakSelf handleSomething_nextVC_A_Btn:sender];
    };
    [self.view addSubview:nextVC_A_Btn];
    
    QMUIButton *nextVC_B_Btn = [QMUIButton buttonWithType:UIButtonTypeCustom];
    [nextVC_B_Btn setTitle:@"B_默认Nav不透明_变色" forState:UIControlStateNormal];
    nextVC_B_Btn.mySize = CGSizeMake(MyLayoutSize.wrap, 44);
    nextVC_B_Btn.myTop = 20 + 88 + 64;
    nextVC_B_Btn.myCenterX = 0;
    nextVC_B_Btn.qmui_tapBlock = ^(__kindof UIControl *sender) {
        [weakSelf handleSomething_nextVC_B_Btn:sender];
    };
    [self.view addSubview:nextVC_B_Btn];
        
    [self.view addSubview:self.topLabel];
    [self.view addSubview:self.bottomLabel];
}

#pragma mark - Lazy UI -
- (QMUILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = [[QMUILabel alloc] qmui_initWithFont:[HUMFontTool HUM_fontSize:15 fontType:HUMFontTypeMedium] textColor:UIColor.qmui_randomColor];
        _topLabel.backgroundColor = UIColor.qmui_randomColor;
        _topLabel.text = @"位于frameLayout可使用位置顶部";
        _topLabel.mySize = CGSizeMake(MyLayoutSize.wrap, 88);
        _topLabel.textAlignment = NSTextAlignmentCenter;
        _topLabel.myTop = 0;
        _topLabel.myCenterX = 0;
    }
    return _topLabel;
}

- (QMUILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [[QMUILabel alloc] qmui_initWithFont:[HUMFontTool HUM_fontSize:15 fontType:HUMFontTypeMedium] textColor:UIColor.qmui_randomColor];
        _bottomLabel.backgroundColor = UIColor.qmui_randomColor;
        _bottomLabel.text = @"位于frameLayout可使用位置底部";
        _bottomLabel.mySize = CGSizeMake(MyLayoutSize.wrap, 88);
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.myBottom = 0;
        _bottomLabel.myCenterX = 0;
    }
    return _bottomLabel;
}

#pragma mark - handleSomething -
- (void)handleSomething_reloadUIRectEdge_Btn:(__kindof UIControl *)sender {
    if (self.frameLayout.insetsPaddingFromSafeArea == UIRectEdgeNone) {
        self.frameLayout.insetsPaddingFromSafeArea = UIRectEdgeAll;
    } else {
        self.frameLayout.insetsPaddingFromSafeArea = UIRectEdgeNone;
    }
}

- (void)handleSomething_nextVC_A_Btn:(__kindof UIControl *)sender {
    HUMFirstSonBViewController *vc = HUMFirstSonBViewController.new;
    vc.title = @"Light-default";
    vc.config = [self createConfigWithType:1];
    //nav由透明转为不透明需设置
    vc.extendedLayoutIncludesOpaqueBars = YES;
    vc.type = 1;
    [self.navigationController qmui_pushViewController:vc animated:YES completion:nil];
}

- (void)handleSomething_nextVC_B_Btn:(__kindof UIControl *)sender {
    HUMFirstSonBViewController *vc = HUMFirstSonBViewController.new;
    vc.title = @"Light-default";
    vc.config = [self createConfigWithType:2];
    vc.type = 2;
    [self.navigationController qmui_pushViewController:vc animated:YES completion:nil];
}

- (HUMBaseVCConfig *)createConfigWithType:(NSInteger)type {
    HUMBaseVCConfig *config = HUMBaseVCConfig.new;
    if (type == 1) {
        /// 导航栏样式
        config.HUM_Nav_BarStyle = UIBarStyleDefault;
        /// 是否隐藏nav
        config.isHiddenNav = NO;
        /// 是否隐藏navShadow
        config.isHiddenNavShadow = YES;
        /// nav背景图片 优先度最高
        config.HUM_Image_Nav_BGImage = [UIImage qmui_imageWithColor:UIColor.orangeColor];
        /// nav背景色 优先度低
        config.HUM_Color_Nav_BarBarTintColor = nil;
        /// nav返回按钮文字
        config.HUM_String_Nav_BackText = @"返回";
        /// nav返回按钮图片
        config.HUM_Image_Nav_BackImage = UIImageMake(@"nav_back_normal");
        /// nav按钮颜色
        config.HUM_Color_Nav_BarTintColor = UIColor.greenColor;
        /// nav标题属性
        config.HUM_Attributes_Nav_titleText = @{
            NSForegroundColorAttributeName: UIColor.blackColor
        };
        /// nav背景透明度
        config.HUM_Color_Nav_barAlpha = 0;
        
        /// 是否隐藏状态栏
        config.isHiddenStatusBar = NO;
        /// 状态栏样式
        config.HUM_statusBarStyle = QMUIStatusBarStyleDarkContent;
        
        /// VC背景色
        config.HUM_Color_VC_BG = UIColor.whiteColor;
        return config;
    } else if (type == 2) {
        /// 导航栏样式
        config.HUM_Nav_BarStyle = UIBarStyleDefault;
        /// 是否隐藏nav
        config.isHiddenNav = NO;
        /// 是否隐藏navShadow
        config.isHiddenNavShadow = YES;
        /// nav背景图片 优先度最高
        config.HUM_Image_Nav_BGImage = [UIImage qmui_imageWithColor:UIColor.orangeColor];
        /// nav背景色 优先度低
        config.HUM_Color_Nav_BarBarTintColor = nil;
        /// nav返回按钮文字
        config.HUM_String_Nav_BackText = @"返回";
        /// nav返回按钮图片
        config.HUM_Image_Nav_BackImage = UIImageMake(@"nav_back_normal");
        /// nav按钮颜色
        config.HUM_Color_Nav_BarTintColor = UIColor.greenColor;
        /// nav标题属性
        config.HUM_Attributes_Nav_titleText = @{
            NSForegroundColorAttributeName: UIColor.blackColor
        };
        /// nav背景透明度
        config.HUM_Color_Nav_barAlpha = 1;
        
        /// 是否隐藏状态栏
        config.isHiddenStatusBar = NO;
        /// 状态栏样式
        config.HUM_statusBarStyle = QMUIStatusBarStyleDarkContent;
        
        /// VC背景色
        config.HUM_Color_VC_BG = UIColor.whiteColor;
        return config;
    }
    return config;
}

@end
