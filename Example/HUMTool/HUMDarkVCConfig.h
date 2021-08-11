//
//  HUMDarkVCConfig.h
//  HUMTool_Example
//
//  Created by Humioo on 2021/8/6.
//  Copyright © 2021 HUMiooo. All rights reserved.
//

#import <HUMTool/HUMTool.h>

NS_ASSUME_NONNULL_BEGIN

@interface HUMDarkVCConfig : HUMBaseVCConfig
+ (HUMDarkVCConfig *)defaultConfig;
/// 恢复初始设置
+ (void)reloadDefaultConfig;
@end

NS_ASSUME_NONNULL_END
