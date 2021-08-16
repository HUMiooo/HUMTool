//
//  HUMDatePickerView.h
//  BaseFrame
//
//  Created by Humioo on 2021/7/19.
//  Copyright © 2021 合肥皮诺客科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HUMTool/HUMTool.h>
typedef NS_ENUM(NSInteger) {
    DateType_yyyyMMddHHmmss,
    DateType_yyyyMMddHHmm,
    DateType_yyyyMMddHH,
    DateType_yyyyMMdd,
} HUMDatePickerType;
typedef void(^DatePickerBlock)(NSString *dateString);
@interface HUMDatePickerView : UIView
@property (nonatomic ,weak) UIDatePicker *datePicker;
@property (nonatomic, copy) DatePickerBlock DatePickerBlock;
/// 初始值
@property (nonatomic, copy) NSString *dateStr;

- (instancetype)initWithType:(HUMDatePickerType)type minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate headerTitle:(NSString *)headerTitle;
- (void)show;
@end
