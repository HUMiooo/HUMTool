//
//  HUMBaseTableViewController.m
//
//

#import "HUMBaseTableViewController.h"
@interface HUMBaseTableViewController ()

@end

@implementation HUMBaseTableViewController

- (HUMBaseVCConfig *)config {
    if (!_config) {
        _config = HUMBaseVCConfig.new;
    }
    return _config;
}

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

@end
