//
//  HUMNavigationController.m
//  HUMTool_Example
//
//  Created by Humioo on 2021/7/22.
//  Copyright © 2021 HUMiooo. All rights reserved.
//

#import "HUMNavigationController.h"
@interface HUMNavigationController ()

@end

@implementation HUMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        //如果push进来的不是第一个控制器 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
