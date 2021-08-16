//
//  HUMBaseTableViewController.h
//
//

#import <QMUIKit/QMUIKit.h>
#import "HUMFrameworkHeader.h"//FrameworkHeader
#import "HUMBaseVCConfig.h"
#import <HBDNavigationBar/UIViewController+HBD.h>
@interface HUMBaseTableViewController : QMUICommonTableViewController
/// VC配置
@property (nonatomic, strong) HUMBaseVCConfig *config;

/// 设置页面默认Config
- (void)setDefaultConfig;

/// 设置scrollView自动调整
/// @param scrollView scrollView description
/// @param isOn 是否开启
- (void)setScrollViewContentInsetAdjustmentBehaviorWithScrollView:(UIScrollView *)scrollView isOn:(BOOL)isOn;

@end
