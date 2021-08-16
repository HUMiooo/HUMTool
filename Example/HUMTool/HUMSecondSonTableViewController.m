//
//  HUMSecondSonTableViewController.m
//  HUMTool_Example
//
//  Created by Humioo on 2021/8/16.
//  Copyright © 2021 HUMiooo. All rights reserved.
//

#import "HUMSecondSonTableViewController.h"
#import "HUMDarkVCConfig.h"
#import "HUMLightVCConfig.h"

#import "HUMSonBTableViewCell.h"
@interface HUMSecondSonTableViewController ()

@end

@implementation HUMSecondSonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.type == 1) {
        [self setScrollViewContentInsetAdjustmentBehaviorWithScrollView:self.tableView isOn:NO];
    } else {
        [self setScrollViewContentInsetAdjustmentBehaviorWithScrollView:self.tableView isOn:YES];
    }
}

- (void)initSubviews {
    [super initSubviews];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:(UIBarButtonItemStylePlain) target:self action:@selector(pushToNext)];
}

- (void)pushToNext {
    HUMSecondSonTableViewController *vc = HUMSecondSonTableViewController.new;
    vc.title = @"Light-Random";
    vc.config = HUMLightVCConfig.defaultConfig;
    vc.type = 1;
    [self.navigationController qmui_pushViewController:vc animated:YES completion:nil];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HUMSonBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HUMSonBTableViewCell"];
    if (!cell) {
        cell = [[HUMSonBTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HUMSonBTableViewCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = UIColor.clearColor;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return 30;
    }
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return UIView.new;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return UIView.new;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row <= 5) {
        self.emptyView.backgroundColor = UIColor.qmui_randomColor;
        self.tableView.scrollEnabled = NO;
        [self showEmptyViewWithImage:UIImageMake(@"noData_icon_normal") text:@"暂无数据" detailText:nil buttonTitle:@"隐藏空视图" buttonAction:@selector(handleSomething_hideEmptyView)];
    } else {
        HUMSecondSonTableViewController *vc = HUMSecondSonTableViewController.new;
        vc.title = @"Light-Random";
        vc.config = HUMLightVCConfig.defaultConfig;
        vc.type = 1;
        [self.navigationController qmui_pushViewController:vc animated:YES completion:nil];
    }
}

#pragma mark - handleSomething -
- (void)handleSomething_hideEmptyView {
    [self hideEmptyView];
    self.tableView.scrollEnabled = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat progress = scrollView.contentOffset.y + scrollView.contentInset.top;
    NSLog(@"%.lf", progress);
    if (self.type == 1) {
        if (progress <= 0) {
            self.hbd_barAlpha = 0;
        } else if (progress <= 350) {
            self.hbd_barAlpha = progress/350.0;
        } else {
            self.hbd_barAlpha = 1;
        }
    } else {
        if (progress <= 0) {
            self.hbd_barAlpha = 1;
        } else if (progress <= 350) {
            self.hbd_barAlpha = 1 - progress/350.0;
        } else {
            self.hbd_barAlpha = 0;
        }
    }
    [self hbd_setNeedsUpdateNavigationBar];
}

@end
