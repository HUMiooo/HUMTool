//
//  HUMBaseTableViewController.h
//
//

#import <QMUIKit/QMUIKit.h>
#import "HUMFrameworkHeader.h"//FrameworkHeader
@interface HUMBaseTableViewController : QMUICommonTableViewController
/// 点击返回按钮
@property (nonatomic, copy) void(^backBtnClickBlock)(void);

/// 是否需要返回rootVC 默认NO
@property (nonatomic, assign) BOOL isBackToRootVC;
/// 是否presentViewController跳转 默认NO
@property (nonatomic, assign) BOOL isfromPresentVC;

- (void)backClick;
@end
