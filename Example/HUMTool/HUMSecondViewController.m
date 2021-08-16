//
//  HUMSecondViewController.m
//  HUMTool_Example
//
//  Created by Humioo on 2021/7/22.
//  Copyright © 2021 HUMiooo. All rights reserved.
//

#import "HUMSecondViewController.h"
#import "HUMSonBTableViewCell.h"
#import "HUMSecondSonTableViewController.h"
#import "HUMLightVCConfig.h"
@interface HUMSecondViewController ()

@end
static NSString *HUMSonBTableViewCellID = @"HUMSonBTableViewCell";
@implementation HUMSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HUMSonBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HUMSonBTableViewCellID];
    if (!cell) {
        cell = [[HUMSonBTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HUMSonBTableViewCellID];
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
        vc.type = 2;
        [self.navigationController qmui_pushViewController:vc animated:YES completion:nil];
    }
}

#pragma mark - handleSomething -
- (void)handleSomething_hideEmptyView {
    [self hideEmptyView];
    self.tableView.scrollEnabled = YES;
}

- (BOOL)hidesBottomBarWhenPushed {
    return NO;
}

@end
