//
//  HUMBaseTableViewController.m
//
//

#import "HUMBaseTableViewController.h"
@interface HUMBaseTableViewController ()

@end

@implementation HUMBaseTableViewController

- (void)initTableView {
    [super initTableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)layoutTableView {
    //使tableView.frame生效
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
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

- (UIImage *)navigationBarShadowImage {
    return [UIImage qmui_imageWithColor:HUMAppColorManager.defaultManager.HUM_Color_Nav_LineColor];
}

- (UIColor *)titleViewTintColor {
    return HUMAppColorManager.defaultManager.HUM_Color_Nav_TitleViewTintColor;
}

- (UIColor *)navigationBarTintColor {
    return HUMAppColorManager.defaultManager.HUM_Color_Nav_BarTintColor;
}

- (UIColor *)navigationBarBarTintColor {
    return HUMAppColorManager.defaultManager.HUM_Color_Nav_BarBarTintColor;
}

- (NSString *)backBarButtonItemTitleWithPreviousViewController:(UIViewController *)viewController {
    return @"";
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
