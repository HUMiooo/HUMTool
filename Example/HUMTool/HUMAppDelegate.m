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
    // Override point for customization after application launch.
    [self initAppColorConfig];
    
    [self initWindow];
    
    return YES;
}

- (void)initWindow {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = HUMAppColorManager.defaultManager.HUM_Color_VC_BG;
    self.window.rootViewController = HUMTabBarViewController.new;
    [self.window makeKeyAndVisible];
}

- (void)initAppColorConfig {
    HUMAppColorManager.defaultManager.HUM_Color_App_ThemeMain = [HUMAppColorManager colorWithCustomColorWithHex:@"#00A9A9"];
    
    HUMAppColorManager.defaultManager.HUM_Color_Nav_TitleViewTintColor = [HUMAppColorManager colorWithCustomColorWithHex:@"#000000"];
    HUMAppColorManager.defaultManager.HUM_Color_Nav_BarTintColor = [HUMAppColorManager colorWithCustomColorWithHex:@"#000000"];
    HUMAppColorManager.defaultManager.HUM_Color_Nav_BarBarTintColor = [HUMAppColorManager colorWithCustomColorWithHex:@"#FFFFFF"];
    HUMAppColorManager.defaultManager.HUM_Color_Nav_LineColor = [HUMAppColorManager colorWithCustomColorWithHex:@"#FFFFFF"];

    HUMAppColorManager.defaultManager.HUM_Color_VC_BG = [HUMAppColorManager colorWithCustomColorWithHex:@"#FFFFFF"];
    HUMAppColorManager.defaultManager.HUM_Color_VC_BG_Dark = [HUMAppColorManager colorWithCustomColorWithHex:@"#F7F7F7"];

    HUMAppColorManager.defaultManager.HUM_Color_View_BG = [HUMAppColorManager colorWithCustomColorWithHex:@"#FFFFFF"];
    HUMAppColorManager.defaultManager.HUM_Color_View_Line = [HUMAppColorManager colorWithCustomColorWithHex:@"#E5E5E5"];
    HUMAppColorManager.defaultManager.HUM_Color_View_Shadow = [HUMAppColorManager colorWithCustomColorWithRGBA:HUMColorA(0, 0, 0, 0.2)];

    HUMAppColorManager.defaultManager.HUM_Color_Cell_BG = [HUMAppColorManager colorWithCustomColorWithHex:@"#FFFFFF"];
    HUMAppColorManager.defaultManager.HUM_Color_Cell_Line = [HUMAppColorManager colorWithCustomColorWithHex:@"#E5E5E5"];
    HUMAppColorManager.defaultManager.HUM_Color_Cell_Shadow = [HUMAppColorManager colorWithCustomColorWithRGBA:HUMColorA(0, 0, 0, 0.2)];

    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_A = [HUMAppColorManager colorWithCustomColorWithHex:@"#222222"];
    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_B = [HUMAppColorManager colorWithCustomColorWithHex:@"#4D4D4D"];
    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_C = [HUMAppColorManager colorWithCustomColorWithHex:@"#666666"];
    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_D = [HUMAppColorManager colorWithCustomColorWithHex:@"#808080"];
    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_E = [HUMAppColorManager colorWithCustomColorWithHex:@"#B3B3B3"];
    HUMAppColorManager.defaultManager.HUM_Color_Text_Color_F = [HUMAppColorManager colorWithCustomColorWithHex:@"#CECECE"];
    
    //红色
    HUMAppColorManager.defaultManager.HUM_Color_Custom_A = [HUMAppColorManager colorWithCustomColorWithHex:@"#FF5F56"];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
