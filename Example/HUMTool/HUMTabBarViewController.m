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
@interface HUMTabBarViewController ()

@end

@implementation HUMTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *array = [NSArray arrayWithObjects:
                      [self createChildVCWithVC:HUMFirstViewController.new title:@"First" image:@"tabBar_custom_default" selectedImage:@"tabBar_custom_click"],
                      [self createChildVCWithVC:HUMSecondViewController.new title:@"Second" image:@"tabBar_project_default" selectedImage:@"tabBar_project_click"],
                      [self createChildVCWithVC:HUMThirdViewController.new title:@"Third" image:@"tabBar_work_default" selectedImage:@"tabBar_work_click"],
                      [self createChildVCWithVC:HUMForthViewController.new title:@"Forth" image:@"tabBar_my_default" selectedImage:@"tabBar_my_click"],
                      nil];
    
    self.viewControllers = array;
}


- (UINavigationController *)createChildVCWithVC:(UIViewController *)VC title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName {
    VC.tabBarItem.title = title;
    VC.title = title;
    VC.tabBarItem.image = UIImageMake(imageName);;
    VC.tabBarItem.selectedImage = UIImageMake(selectedImageName);
    [self setCustomAppearanceWithVc:VC];

    HUMNavigationController *NavVC = [[HUMNavigationController alloc] initWithRootViewController:VC];
    NavVC.title = title;

    return NavVC;
}

- (void)setCustomAppearanceWithVc:(UIViewController *)vc{
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
    dic1[NSForegroundColorAttributeName] = HUMAppColorManager.defaultManager.HUM_Color_App_ThemeMain;
    dic1[NSFontAttributeName] = [HUMFontTool HUM_fontSize:10 fontType:HUMFontTypeMedium];
    
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
    dic2[NSForegroundColorAttributeName] = HUMAppColorManager.defaultManager.HUM_Color_Text_Color_A;
    dic2[NSFontAttributeName] = [HUMFontTool HUM_fontSize:10 fontType:HUMFontTypeMedium];
    
    //iOS13 后设置有改变
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = UITabBarAppearance.new;
        UITabBarItemStateAppearance *normal = appearance.stackedLayoutAppearance.normal;
        if (normal) {
            normal.titleTextAttributes = dic2;
        }
        UITabBarItemStateAppearance *selected = appearance.stackedLayoutAppearance.selected;
        if (selected) {
            selected.titleTextAttributes = dic1;
        }
        self.tabBar.standardAppearance = appearance;
    } else {
        [vc.tabBarItem setTitleTextAttributes:dic2 forState:UIControlStateNormal];
        [vc.tabBarItem setTitleTextAttributes:dic1 forState:UIControlStateSelected];
    }
}

@end
