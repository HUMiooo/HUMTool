//
//  HUMFontTool.m
//
//  Created by Humioo on 2020/7/29.
//

#import "HUMFontTool.h"

@implementation HUMFontTool
+ (UIFont *)HUM_fontSize:(NSInteger)size fontType:(HUMFontType)fontType {
    switch (fontType) {
        case HUMFontTypeUltralight:
            return [UIFont fontWithName:@"PingFangSC-Ultralight" size:size];
            break;
            
        case HUMFontTypeThin:
            return [UIFont fontWithName:@"PingFangSC-Thin" size:size];
            break;
            
        case HUMFontTypeLight:
            return [UIFont fontWithName:@"PingFangSC-Light" size:size];
            break;
            
        case HUMFontTypeRegular:
            return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
            break;
            
        case HUMFontTypeMedium:
            return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
            break;
            
        case HUMFontTypeSemibold:
            return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
            break;
            
        default:
            return [UIFont systemFontOfSize:size];
            break;
    }
}
@end
