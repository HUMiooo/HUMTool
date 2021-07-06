//
//  HUMBaseViewController.m
//
//

#import "HUMBaseViewController.h"
@interface HUMBaseViewController ()
@end

@implementation HUMBaseViewController

- (MyFrameLayout *)frameLayout {
    if (!_frameLayout) {
        _frameLayout = [MyFrameLayout new];
        _frameLayout.backgroundColor = [HUM_ColorTool colorWithCustomColor:HUMColor_VCBG];
        _frameLayout.insetsPaddingFromSafeArea = ~UIRectEdgeBottom;  //默认情况下底部的安全区会和布局视图的底部padding进行叠加，当这样设置后底部安全区将不会叠加到底部的padding上去。
    }
    return _frameLayout;
}

- (void)initSubviews {
    [super initSubviews];
    [self setDefaultConfig];
}

/// 设置页面默认Config
- (void)setDefaultConfig {
    self.view.backgroundColor = [HUM_ColorTool colorWithCustomColor:HUMColor_VCBG];
    self.edgesForExtendedLayout = UIRectEdgeNone;  //设置视图控制器中的视图尺寸不延伸到导航条或者工具条下面
    self.view = self.frameLayout;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)backClick {
    self.backBtnClickBlock == nil ? : self.backBtnClickBlock();
    if (self.isBackToRootVC) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else if (self.isfromPresentVC) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)preferredNavigationBarHidden {
    return NO;
}

- (BOOL)shouldCustomizeNavigationBarTransitionIfHideable {
    return YES;
}

- (void)dealloc {
    NSLog(@"dealloc");
}
@end
