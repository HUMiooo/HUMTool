//
//  HUMTabBarViewController.m
//  HUMTool_Example
//
//  Created by Humioo on 2021/7/22.
//  Copyright © 2021 HUMiooo. All rights reserved.
//

#import "HUMTabBarViewController.h"
#import <HUMTool.h>
#import "HUMNavigationController.h"
#import "HUMFirstViewController.h"
#import "HUMSecondViewController.h"
#import "HUMThirdViewController.h"
#import "HUMForthViewController.h"
#import "HUMDarkVCConfig.h"
#import "HUMLightVCConfig.h"
@interface HUMTabBarViewController ()

@end

@implementation HUMTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HUMFirstViewController *firstVC = HUMFirstViewController.new;
    firstVC.config = HUMDarkVCConfig.defaultConfig;
    
    HUMSecondViewController *secondVC = HUMSecondViewController.new;
    secondVC.config = HUMDarkVCConfig.defaultConfig;
    
    HUMThirdViewController *thirdVC = HUMThirdViewController.new;
    thirdVC.config = HUMDarkVCConfig.defaultConfig;
    
    HUMForthViewController *forthVC = HUMForthViewController.new;
    forthVC.config = HUMDarkVCConfig.defaultConfig;
    
    NSArray *array = [NSArray arrayWithObjects:
                      [self createChildVCWithVC:firstVC title:@"First" image:@"tabBar_custom_default" selectedImage:@"tabBar_custom_click"],
                      [self createChildVCWithVC:secondVC title:@"Second" image:@"tabBar_project_default" selectedImage:@"tabBar_project_click"],
                      [self createChildVCWithVC:thirdVC title:@"Third" image:@"tabBar_work_default" selectedImage:@"tabBar_work_click"],
                      [self createChildVCWithVC:forthVC title:@"Forth" image:@"tabBar_my_default" selectedImage:@"tabBar_my_click"],
                      nil];
    
    self.viewControllers = array;
    
    //设置tabbar背景
    if (@available(iOS 13, *)) {
        UITabBarAppearance *appearance = [self.tabBar.standardAppearance copy];
        appearance.backgroundImage = [UIImage qmui_imageWithColor:UIColor.clearColor];
        appearance.shadowImage = [UIImage qmui_imageWithColor:UIColor.clearColor];
        //设置半透明
        self.tabBar.translucent = NO;
        //设置完全透明 此时translucent 设置无论如何设置都为完全透明
//        [appearance configureWithTransparentBackground];
        self.tabBar.standardAppearance = appearance;
    } else {
        self.tabBar.backgroundImage = [UIImage qmui_imageWithColor:UIColor.qmui_randomColor];
        self.tabBar.shadowImage = UIImage.new;
    }
}

- (UINavigationController *)createChildVCWithVC:(UIViewController *)VC title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName {
    VC.tabBarItem.title = title;
    VC.title = title;
    VC.tabBarItem.image = [[UIImageMake(imageName) qmui_imageWithTintColor:HUMAppColorManager.defaultManager.HUM_Color_Tab_Normal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.selectedImage = [[UIImageMake(selectedImageName) qmui_imageWithTintColor:HUMAppColorManager.defaultManager.HUM_Color_Tab_Selected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self setCustomAppearanceWithVc:VC];
    
    HUMNavigationController *NavVC = [[HUMNavigationController alloc] initWithRootViewController:VC];
    NavVC.title = title;
    
    return NavVC;
}

- (void)setCustomAppearanceWithVc:(UIViewController *)vc {
    //normal
    NSMutableDictionary *normalDic = [NSMutableDictionary dictionary];
    normalDic[NSForegroundColorAttributeName] = HUMAppColorManager.defaultManager.HUM_Color_Tab_Normal;
    normalDic[NSFontAttributeName] = [HUMFontTool HUM_fontSize:10 fontType:HUMFontTypeMedium];
    
    //selected
    NSMutableDictionary *selectedDic = [NSMutableDictionary dictionary];
    selectedDic[NSForegroundColorAttributeName] = HUMAppColorManager.defaultManager.HUM_Color_Tab_Selected;
    selectedDic[NSFontAttributeName] = [HUMFontTool HUM_fontSize:10 fontType:HUMFontTypeMedium];
    
    //iOS13 后设置有改变
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = UITabBarAppearance.new;
        UITabBarItemStateAppearance *normal = appearance.stackedLayoutAppearance.normal;
        if (normal) {
            normal.titleTextAttributes = normalDic;
        }
        UITabBarItemStateAppearance *selected = appearance.stackedLayoutAppearance.selected;
        if (selected) {
            selected.titleTextAttributes = selectedDic;
        }
        self.tabBar.standardAppearance = appearance;
    } else {
        [vc.tabBarItem setTitleTextAttributes:normalDic forState:UIControlStateNormal];
        [vc.tabBarItem setTitleTextAttributes:selectedDic forState:UIControlStateSelected];
    }
}

/// 根据暗黑模式改变tabbaritem图片
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            for (HUMNavigationController *navVC in self.childViewControllers) {
                if ([navVC.childViewControllers.firstObject isKindOfClass:[HUMFirstViewController class]]) {
                    HUMFirstViewController *VC = navVC.childViewControllers.firstObject;
                    VC.tabBarItem.image = [[UIImageMake(@"tabBar_custom_default") qmui_imageWithTintColor:HUMAppColorManager.defaultManager.HUM_Color_Tab_Normal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                    VC.tabBarItem.selectedImage = [[UIImageMake(@"tabBar_custom_click") qmui_imageWithTintColor:HUMAppColorManager.defaultManager.HUM_Color_Tab_Selected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                }
                
                if ([navVC.childViewControllers.firstObject isKindOfClass:[HUMSecondViewController class]]) {
                    HUMSecondViewController *VC = navVC.childViewControllers.firstObject;
                    VC.tabBarItem.image = [[UIImageMake(@"tabBar_project_default") qmui_imageWithTintColor:HUMAppColorManager.defaultManager.HUM_Color_Tab_Normal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                    VC.tabBarItem.selectedImage = [[UIImageMake(@"tabBar_project_click") qmui_imageWithTintColor:HUMAppColorManager.defaultManager.HUM_Color_Tab_Selected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                }
                
                if ([navVC.childViewControllers.firstObject isKindOfClass:[HUMThirdViewController class]]) {
                    HUMThirdViewController *VC = navVC.childViewControllers.firstObject;
                    VC.tabBarItem.image = [[UIImageMake(@"tabBar_work_default") qmui_imageWithTintColor:HUMAppColorManager.defaultManager.HUM_Color_Tab_Normal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                    VC.tabBarItem.selectedImage = [[UIImageMake(@"tabBar_work_click") qmui_imageWithTintColor:HUMAppColorManager.defaultManager.HUM_Color_Tab_Selected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                }
                
                if ([navVC.childViewControllers.firstObject isKindOfClass:[HUMForthViewController class]]) {
                    HUMForthViewController *VC = navVC.childViewControllers.firstObject;
                    VC.tabBarItem.image = [[UIImageMake(@"tabBar_my_default") qmui_imageWithTintColor:HUMAppColorManager.defaultManager.HUM_Color_Tab_Normal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                    VC.tabBarItem.selectedImage = [[UIImageMake(@"tabBar_my_click") qmui_imageWithTintColor:HUMAppColorManager.defaultManager.HUM_Color_Tab_Selected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                }
            }
        }
    }
}

@end
