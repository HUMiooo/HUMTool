//
//  HUMDatePickerView.m
//  BaseFrame
//
//  Created by Humioo on 2021/7/19.
//  Copyright © 2021 合肥皮诺客科技. All rights reserved.
//

#import "HUMDatePickerView.h"
@interface HUMDatePickerView ()
@property (nonatomic, strong) NSDate *minimumDate;
@property (nonatomic, strong) NSDate *maximumDate;
@property (nonatomic, copy) NSString *headerTitle;


@property (nonatomic, copy) NSString *pickerDateStr;
@property (nonatomic, assign) HUMDatePickerType type;
@end

@implementation HUMDatePickerView
- (instancetype)init {
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithType:(HUMDatePickerType)type minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate headerTitle:(NSString *)headerTitle {
    if (self = [super init]) {
        self.type = type;
        self.minimumDate = minimumDate;
        self.maximumDate = maximumDate;
        self.headerTitle = headerTitle;
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.frame = CGRectMake(0, 0, HUMSCRW, HUMSCRH - HUMTouchButtonHeight);
    self.backgroundColor = HUMColorA(0, 0, 0, 0.2);

    MyRelativeLayout *rootLayout = MyRelativeLayout.new;
    rootLayout.backgroundColor = UIColor.clearColor;
    rootLayout.frame = self.frame;
    [self addSubview:rootLayout];
    
    //创建UIDatePicker
    UIDatePicker *picker = UIDatePicker.new;
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    if (@available(iOS 13.4, *)) {
        picker.preferredDatePickerStyle = UIDatePickerStyleWheels;
    }
    picker.backgroundColor = UIColor.whiteColor;
    switch (self.type) {
        case DateType_yyyyMMddHHmmss:
        case DateType_yyyyMMddHHmm:
        case DateType_yyyyMMddHH:
            picker.datePickerMode = UIDatePickerModeDateAndTime;
            break;
        case DateType_yyyyMMdd:
            picker.datePickerMode = UIDatePickerModeDate;
            break;
        default:
            break;
    }
    picker.myBottom = 0;
    picker.myLeft = picker.myRight = 0;
    picker.minimumDate = self.minimumDate;
    picker.maximumDate = self.maximumDate;
    [picker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    [rootLayout addSubview:picker];
    
    self.datePicker = picker;
    [self dateChange:self.datePicker];
    
    //headerView
    MyRelativeLayout *headerLayout = MyRelativeLayout.new;
    headerLayout.backgroundColor = UIColor.whiteColor;
    headerLayout.bottomBorderline = [[MyBorderline alloc] initWithColor:HUMAppColorManager.defaultManager.HUM_Color_View_Line thick:1 headIndent:0 tailIndent:0];
    headerLayout.bottomPos.equalTo(picker.topPos);
    headerLayout.myLeft = headerLayout.myRight = 0;
    headerLayout.myHeight = 44;
    [rootLayout addSubview:headerLayout];

    QMUIButton *cancelBtn = [QMUIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitleColor:HUMAppColorManager.defaultManager.HUM_Color_App_ThemeMain forState:UIControlStateNormal];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [HUMFontTool HUM_fontSize:15 fontType:HUMFontTypeRegular];
    cancelBtn.mySize = CGSizeMake(80, 30);
    cancelBtn.myLeft = cancelBtn.myCenterY = 0;
    [cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [headerLayout addSubview:cancelBtn];

    QMUIButton *sureBtn = [QMUIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:HUMAppColorManager.defaultManager.HUM_Color_App_ThemeMain forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [HUMFontTool HUM_fontSize:15 fontType:HUMFontTypeRegular];
    sureBtn.mySize = CGSizeMake(80, 30);
    sureBtn.myRight = sureBtn.myCenterY = 0;
    [sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    [headerLayout addSubview:sureBtn];
    
    QMUILabel *headerTitleLabel = [[QMUILabel alloc] qmui_initWithFont:[HUMFontTool HUM_fontSize:16 fontType:HUMFontTypeRegular] textColor:HUMAppColorManager.defaultManager.HUM_Color_Text_Color_A];
    headerTitleLabel.text = self.headerTitle;
    headerTitleLabel.textAlignment = NSTextAlignmentCenter;
    headerTitleLabel.leftPos.equalTo(cancelBtn.rightPos).offset(5);
    headerTitleLabel.rightPos.equalTo(sureBtn.leftPos).offset(5);
    headerTitleLabel.myCenterY = 0;
    headerTitleLabel.myHeight = MyLayoutSize.wrap;
    headerTitleLabel.numberOfLines = 1;
    [headerLayout addSubview:headerTitleLabel];
}

- (void)dateChange:(UIDatePicker *)picker{
    // 创建时格式化
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置时间格式
    switch (self.type) {
        case DateType_yyyyMMddHHmmss:
        {
            formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        }
            break;
        case DateType_yyyyMMddHHmm:
        {
            formatter.dateFormat = @"yyyy-MM-dd HH:mm";
        }
            break;
        case DateType_yyyyMMddHH:
        {
            formatter.dateFormat = @"yyyy-MM-dd HH";
        }
            break;
        case DateType_yyyyMMdd:
        {
            formatter.dateFormat = @"yyyy-MM-dd";
        }
            break;
        default:
            break;
    }
    
    //把NSDate类型转换为字符串类型 picker.date属性就是当前UIDatePicker显示的时间
    self.pickerDateStr = [formatter stringFromDate:picker.date];
}

- (void)setDateStr:(NSString *)dateStr{
    _dateStr = dateStr;
    // 日期格式化类
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    switch (self.type) {
        case DateType_yyyyMMddHHmmss:
        {
            formatter.dateFormat = @"yyyy年MM月dd日 HH时mm分ss秒";
        }
            break;
        case DateType_yyyyMMddHHmm:
        {
            formatter.dateFormat = @"yyyy年MM月dd日 HH时mm分";
        }
            break;
        case DateType_yyyyMMddHH:
        {
            formatter.dateFormat = @"yyyy年MM月dd日 HH时";
        }
            break;
        case DateType_yyyyMMdd:
        {
            formatter.dateFormat = @"yyyy年MM月dd日";
        }
            break;
        default:
            break;
    }
    
    NSDate *date = [formatter dateFromString:dateStr];
    [self.datePicker setDate:date];
    self.pickerDateStr = dateStr;
}

- (void)cancelAction {
    [self removeFromSuperview];
}

- (void)sureAction {
    if (self.DatePickerBlock) {
        _DatePickerBlock(self.pickerDateStr);
    }
    [self cancelAction];
}

- (void)show {
    [[HUMTool getCurrentVC].view addSubview:self];
}
@end
