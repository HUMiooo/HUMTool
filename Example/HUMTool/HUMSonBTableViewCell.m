//
//  HUMSonBTableViewCell.m
//  HUMTool_Example
//
//  Created by Humioo on 2021/8/10.
//  Copyright © 2021 HUMiooo. All rights reserved.
//

#import "HUMSonBTableViewCell.h"
@interface HUMSonBTableViewCell ()
/// 订单编号
@property (nonatomic, strong) QMUILabel *top_orderNumLabel;
@end

@implementation HUMSonBTableViewCell
- (void)createRootLayout {
    self.contentView.backgroundColor = UIColor.clearColor;
    self.rootLayout = MyRelativeLayout.new;
    self.rootLayout.cacheEstimatedRect = YES;
    self.rootLayout.padding = UIEdgeInsetsMake(20, 20, 20, 20);
    self.rootLayout.contentMode = UIViewContentModeTopLeft;
    self.rootLayout.heightSize.equalTo(@(MyLayoutSize.wrap));
    self.rootLayout.backgroundColor = UIColor.clearColor;
    [self.contentView addSubview:self.rootLayout];

    [self.rootLayout addSubview:self.top_orderNumLabel];
}

/// 订单编号
- (QMUILabel *)top_orderNumLabel {
    if (!_top_orderNumLabel) {
        _top_orderNumLabel = [[QMUILabel alloc] qmui_initWithFont:[HUMFontTool HUM_fontSize:15 fontType:HUMFontTypeMedium] textColor:UIColor.qmui_randomColor];
        _top_orderNumLabel.backgroundColor = UIColor.qmui_randomColor;
        _top_orderNumLabel.text = @"AAÀAAAAAAAAAA";
        _top_orderNumLabel.textAlignment = NSTextAlignmentCenter;
        _top_orderNumLabel.myLeft = _top_orderNumLabel.myTop = 0;
        _top_orderNumLabel.mySize = CGSizeMake(MyLayoutSize.fill, MyLayoutSize.wrap);
    }
    return _top_orderNumLabel;
}

@end
