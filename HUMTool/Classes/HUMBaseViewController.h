//
//  HUMBaseViewController.h
//
//

#import <QMUIKit/QMUIKit.h>
#import "HUMFrameworkHeader.h"//FrameworkHeader
@interface HUMBaseViewController : QMUICommonViewController
@property (nonatomic, strong) MyFrameLayout *frameLayout;
/// 点击返回按钮
@property (nonatomic, copy) void(^backBtnClickBlock)(void);
/// 是否需要返回rootVC 默认NO
@property (nonatomic, assign) BOOL isBackToRootVC;
/// 是否presentViewController跳转 默认NO
@property (nonatomic, assign) BOOL isfromPresentVC;

/// 设置页面默认Config
- (void)setDefaultConfig;

- (void)backClick;

@end
