//
//  HUMFirstViewController.m
//  HUMTool_Example
//
//  Created by Humioo on 2021/7/22.
//  Copyright © 2021 HUMiooo. All rights reserved.
//

#import "HUMFirstViewController.h"
#import "HUMFirstSonAViewController.h"
#import "HUMDarkVCConfig.h"
#import "HUMLightVCConfig.h"
@interface HUMFirstViewController ()
@property (nonatomic, strong) QMUILabel *topLabel;
@property (nonatomic, strong) QMUILabel *bottomLabel;
@end

@implementation HUMFirstViewController
- (BOOL)hidesBottomBarWhenPushed {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initSubviews {
    [super initSubviews];
    //frameLayout可适用范围设置 默认全屏
    self.frameLayout.insetsPaddingFromSafeArea = UIRectEdgeTop | UIRectEdgeBottom;
//    self.frameLayout.insetsPaddingFromSafeArea = UIRectEdgeNone;

    HUMWeak(self, weakSelf);
    QMUIButton *nextVCBtn = [QMUIButton buttonWithType:UIButtonTypeCustom];
    [nextVCBtn setTitle:@"下一页" forState:UIControlStateNormal];
    nextVCBtn.mySize = CGSizeMake(80, 44);
    nextVCBtn.myCenterY = 0;
    nextVCBtn.myCenterX = 0;
    nextVCBtn.qmui_tapBlock = ^(__kindof UIControl *sender) {
        [weakSelf handleSomething_nextVCBtn:sender];
    };
    [self.view addSubview:nextVCBtn];
    
    [self.view addSubview:self.topLabel];
    [self.view addSubview:self.bottomLabel];
}

#pragma mark - Lazy UI -
- (QMUILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = [[QMUILabel alloc] qmui_initWithFont:[HUMFontTool HUM_fontSize:15 fontType:HUMFontTypeMedium] textColor:UIColor.qmui_randomColor];
        _topLabel.backgroundColor = UIColor.qmui_randomColor;
        _topLabel.text = @"位于frameLayout可使用位置顶部";
        _topLabel.mySize = CGSizeMake(MyLayoutSize.wrap, 44);
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
        _bottomLabel.mySize = CGSizeMake(MyLayoutSize.wrap, 44);
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.myBottom = 0;
        _bottomLabel.myCenterX = 0;
    }
    return _bottomLabel;
}

#pragma mark - handleSomething -
- (void)handleSomething_nextVCBtn:(__kindof UIControl *)sender {
    HUMFirstSonAViewController *vc = HUMFirstSonAViewController.new;
    vc.title = @"FirstSonAVC_未使用配置";
    vc.config = HUMDarkVCConfig.defaultConfig;
    [self.navigationController qmui_pushViewController:vc animated:YES completion:nil];
}

@end
