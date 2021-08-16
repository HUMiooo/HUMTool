//
//  HUMSecondSonTableViewController.h
//  HUMTool_Example
//
//  Created by Humioo on 2021/8/16.
//  Copyright © 2021 HUMiooo. All rights reserved.
//

#import <HUMTool/HUMTool.h>

NS_ASSUME_NONNULL_BEGIN

@interface HUMSecondSonTableViewController : HUMBaseTableViewController
/// 1 nav初始透明 2 nav初始不透明
@property (nonatomic, assign) NSInteger type;
@end

NS_ASSUME_NONNULL_END
