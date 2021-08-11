//
//  HUMAppDelegate.m
//  HUMTool
//
//  Created by HUMiooo on 07/06/2021.
//  Copyright (c) 2021 HUMiooo. All rights reserved.
//

#import "HUMAppDelegate.h"
#import <HUMTool.h>
#import "HUMTabBarViewController.h"

@implementation HUMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initAppColorConfig];
    [self initWindow];
    return YES;
}

- (void)initWindow {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    self.window.rootViewController = HUMTabBarViewController.new;
    [self.window makeKeyAndVisible];
}

- (void)initAppColorConfig {
    HUMAppColorManager.defaultManager.HUM_Color_App_ThemeMain = [HUMAppColorManager colorWithLightHex:@"0000FF" darkHex:@"#00FFFF" defaultHex:@"0000FF"];
    
    HUMAppColorManager.defaultManager.HUM_Color_Tab_Normal = [HUMAppColorManager colorWithLightHex:@"00FFFF" darkHex:@"#FF00FF" defaultHex:@"00FFFF"];
    HUMAppColorManager.defaultManager.HUM_Color_Tab_Selected = [HUMAppColorManager colorWithLightHex:@"FF00FF" darkHex:@"#00FFFF" defaultHex:@"FF00FF"];

    HUMAppColorManager.defaultManager.HUM_Color_View_BG = [HUMAppColorManager colorWithLightHex:@"0000FF" darkHex:@"#00FFFF" defaultHex:@"0000FF"];
    HUMAppColorManager.defaultManager.HUM_Color_View_Line = [HUMAppColorManager colorWithLightHex:@"0000FF" darkHex:@"#00FFFF" defaultHex:@"0000FF"];
    HUMAppColorManager.defaultManager.HUM_Color_View_Shadow = [HUMAppColorManager colorWithLightRGBA:HUMColorA(0, 0, 0, 0.5) darkRGBA:HUMColorA(0, 0, 0, 0.2) defaultRGBA:HUMColorA(0, 0, 0, 0.5)];

    HUMAppColorManager.defaultManager.HUM_Color_Cell_BG = [HUMAppColorManager colorWithLightHex:@"0000FF" darkHex:@"#00FFFF" defaultHex:@"0000FF"];
    HUMAppColorManager.defaultManager.HUM_Color_Cell_Line = [HUMAppColorManager colorWithLightHex:@"0000FF" darkHex:@"#00FFFF" defaultHex:@"0000FF"];
    HUMAppColorManager.defaultManager.HUM_Color_Cell_Shadow = [HUMAppColorManager colorWithLightRGBA:HUMColorA(0, 0, 0, 0.5) darkRGBA:HUMColorA(0, 0, 0, 0.2) defaultRGBA:HUMColorA(0, 0, 0, 0.5)];

    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_A = [HUMAppColorManager colorWithLightHex:@"0000FF" darkHex:@"#00FFFF" defaultHex:@"0000FF"];
    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_B = [HUMAppColorManager colorWithLightHex:@"0000FF" darkHex:@"#00FFFF" defaultHex:@"0000FF"];
    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_C = [HUMAppColorManager colorWithLightHex:@"0000FF" darkHex:@"#00FFFF" defaultHex:@"0000FF"];
    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_D = [HUMAppColorManager colorWithLightHex:@"0000FF" darkHex:@"#00FFFF" defaultHex:@"0000FF"];
    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_E = [HUMAppColorManager colorWithLightHex:@"0000FF" darkHex:@"#00FFFF" defaultHex:@"0000FF"];
    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_F = [HUMAppColorManager colorWithLightHex:@"0000FF" darkHex:@"#00FFFF" defaultHex:@"0000FF"];
}

@end
