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
    self.view.backgroundColor = [HUM_ColorTool colorWithCustomColor:HUMColor_VCBG];
}

- (void)backClick {
    self.backBtnClickBlock == nil ? : self.backBtnClickBlock();
    if (self.isBackToRootVC) {
        CocoaDebugWithStr(@"BackToRootVC");
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else if (self.isfromPresentVC) {
        CocoaDebugWithStr(@"NONav");
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        CocoaDebugWithStr(@"FromOther");
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
    CocoaDebugWithStr(@"dealloc");
}
@end
