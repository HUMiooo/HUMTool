//
//  HUMFirstSonBViewController.m
//  HUMTool_Example
//
//  Created by Humioo on 2021/8/6.
//  Copyright © 2021 HUMiooo. All rights reserved.
//

#import "HUMFirstSonBViewController.h"
#import "HUMFirstSonAViewController.h"

#import "HUMDarkVCConfig.h"
#import "HUMLightVCConfig.h"

#import "HUMSonBTableViewCell.h"
static NSString *HUMSonBTableViewCellID = @"HUMSonBTableViewCell";
@interface HUMFirstSonBViewController ()<QMUITableViewDelegate, QMUITableViewDataSource>
@property (nonatomic, strong) QMUILabel *topLabel;
@property (nonatomic, strong) QMUILabel *bottomLabel;
@property (nonatomic, strong) QMUITableView *tableView;
@end

@implementation HUMFirstSonBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initSubviews {
    [super initSubviews];
    self.tableView.myMargin = 0;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.topLabel];
    [self.view addSubview:self.bottomLabel];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:(UIBarButtonItemStylePlain) target:self action:@selector(pushToNext)];
}

- (void)pushToNext {
    HUMFirstSonBViewController *vc = HUMFirstSonBViewController.new;
    vc.title = @"Light-Random";
    vc.config = HUMLightVCConfig.defaultConfig;
    vc.type = 1;
    [self.navigationController qmui_pushViewController:vc animated:YES completion:nil];
}

#pragma mark - Lazy UI -
- (QMUILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = [[QMUILabel alloc] qmui_initWithFont:[HUMFontTool HUM_fontSize:15 fontType:HUMFontTypeMedium] textColor:UIColor.qmui_randomColor];
        _topLabel.backgroundColor = UIColor.qmui_randomColor;
        _topLabel.text = @"位于frameLayout可使用位置顶部";
        _topLabel.mySize = CGSizeMake(MyLayoutSize.wrap, 88);
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
        _bottomLabel.mySize = CGSizeMake(MyLayoutSize.wrap, 88);
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.myBottom = 0;
        _bottomLabel.myCenterX = 0;
    }
    return _bottomLabel;
}

- (QMUITableView *)tableView {
    if (!_tableView) {
        _tableView = [[QMUITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = HUMAppColorManager.defaultManager.HUM_Color_App_ThemeMain;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        if (self.type == 1) {
            [self setScrollViewContentInsetAdjustmentBehaviorWithScrollView:_tableView isOn:NO];
        } else {
            [self setScrollViewContentInsetAdjustmentBehaviorWithScrollView:_tableView isOn:YES];
        }
        //是否从nav顶部计算
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[HUMSonBTableViewCell class] forCellReuseIdentifier:HUMSonBTableViewCellID];
    }
    return _tableView;
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
        [self showEmptyViewWithImage:UIImageMake(@"noData_icon_normal") text:@"暂无数据" detailText:nil buttonTitle:@"隐藏空视图" buttonAction:@selector(handleSomething_hideEmptyView)];
    } else {
        HUMFirstSonBViewController *vc = HUMFirstSonBViewController.new;
        vc.title = @"Light-Random";
        vc.config = HUMLightVCConfig.defaultConfig;
        vc.type = 1;
        [self.navigationController qmui_pushViewController:vc animated:YES completion:nil];
    }
}

#pragma mark - handleSomething -
- (void)handleSomething_hideEmptyView {
    [self hideEmptyView];
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
