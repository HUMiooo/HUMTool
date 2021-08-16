//
//  HUMTool.m
//

#import "HUMTool.h"
#import <CommonCrypto/CommonDigest.h>
@implementation HUMTool
+ (BOOL)validateWithInputStr:(NSString *)inputStr regularStr:(NSString *)regularStr {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regularStr];
    BOOL match = [predicate evaluateWithObject:[HUMTool isNull:inputStr]];
    return match;
}

+ (NSString *)isNull:(NSString *)getString {
    NSString * str = [NSString stringWithFormat:@"%@",getString];
    if ((str == nil) || [str isEqual:[NSNull class]] ||str.length<1 || [str isEqualToString:@"(null)"] || [str isEqualToString:@"<null>"] || [str isEqualToString:@"null"]) {
        return @"";
    }
    return str;
}

+ (BOOL)inputShouldNumber:(NSString *)inputString {
    if (inputString.length == 0) return NO;
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:inputString];
}

+ (NSString *)removeSpaceAndNewline:(NSString *)str{
    NSString *temp = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    //ios11 从通讯录复制手机号码 前后有特殊符号
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSCharacterSet *specCharacterSet = [characterSet invertedSet];
    NSArray * strArr = [temp componentsSeparatedByCharactersInSet:specCharacterSet];
    return [strArr componentsJoinedByString:@""];
}

/// 手机号码脱敏
/// @param number 手机号码
+ (NSString *)phoneNumToDensenessWithNumber:(NSString *)number {
    if (number.length > 7) {
        number = [number stringByReplacingCharactersInRange:NSMakeRange(number.length - 8, 4) withString:@"****"];//防止号码有前缀所以使用倒数第8位开始替换
    }
    return number;
}

/// 验证手机号
/// @param mobile mobile description
+ (BOOL)valiMobile:(NSString *)mobile {
    if (mobile.length != 11) {
        return NO;
    }
    
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[0, 1, 6, 7, 8], 18[0-9]
     * 移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     * 联通号段: 130,131,132,145,155,156,170,171,175,176,185,186
     * 电信号段: 133,149,153,170,173,177,180,181,189
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$";
    
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     */
    NSString *CM = @"^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$";
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,155,156,170,171,175,176,185,186
     */
    NSString *CU = @"^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$";
    
    /**
     * 中国电信：China Telecom
     * 133,149,153,170,173,177,180,181,189
     */
    NSString *CT = @"^1(3[3]|4[9]|53|7[037]|8[019]|9[9])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobile] == YES) ||
        ([regextestcm evaluateWithObject:mobile] == YES) ||
        ([regextestct evaluateWithObject:mobile] == YES) ||
        ([regextestcu evaluateWithObject:mobile] == YES)) {
        return YES;
    } else {
        return NO;
    }
}

+ (CGFloat)heightWithString:(NSString *)text withWidth:(CGFloat)width withFont:(UIFont *)font {
    CGSize textSize = CGSizeMake(width, 0);
    NSDictionary *fontDic = @{NSFontAttributeName : font};
    CGRect rect = [text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:fontDic context:nil];
    return rect.size.height;
}

#pragma mark 视图处理
+ (void)setLeftViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName{
    UIImageView *leftView = [[UIImageView alloc]init];
    leftView.image = [UIImage imageNamed:imageName];
    leftView.bounds = CGRectMake(0, 0, 17, 17);
    leftView.contentMode = UIViewContentModeCenter;
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

+ (void)setRightViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName{
    UIImageView *rightView = [[UIImageView alloc]init];
    rightView.image = [UIImage imageNamed:imageName];
    rightView.bounds = CGRectMake(0, 0, 17, 17);
    rightView.contentMode = UIViewContentModeCenter;
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
}

/// 压缩图片
/// @param sourceImage 原图
/// @param maxSize maxSize description
+ (NSData *)resetSizeOfImageData:(UIImage *)sourceImage maxSize:(NSInteger)maxSize {
    //先判断当前质量是否满足要求，不满足再进行压缩
    __block NSData *finallImageData = UIImageJPEGRepresentation(sourceImage, 1.0);
    NSUInteger sizeOrigin   = finallImageData.length;
    NSUInteger sizeOriginKB = sizeOrigin / 1000;
    
    if (sizeOriginKB <= maxSize) {
        return finallImageData;
    }
    
    //获取原图片宽高比
    CGFloat sourceImageAspectRatio = sourceImage.size.width / sourceImage.size.height;
    //先调整分辨率
    CGSize defaultSize = CGSizeMake(1024, 1024 / sourceImageAspectRatio);
    UIImage * newImage = [self newSizeImage:defaultSize image:sourceImage];
    finallImageData    = UIImageJPEGRepresentation(newImage, 1.0);
    
    //保存压缩系数
    NSMutableArray *compressionQualityArr = [NSMutableArray array];
    CGFloat avg   = 1.0 / 250;
    CGFloat value = avg;
    for (int i = 250; i >= 1; i --) {
        value = i * avg;
        [compressionQualityArr addObject:@(value)];
    }
    
    /*
     调整大小
     说明：压缩系数数组compressionQualityArr是从大到小存储。
     */
    //思路：使用二分法搜索
    finallImageData = [self halfFuntion:compressionQualityArr image:newImage sourceData:finallImageData maxSize:maxSize];
    //如果还是未能压缩到指定大小，则进行降分辨率
    while (finallImageData.length == 0) {
        //每次降100分辨率
        CGFloat reduceWidth  = 100.0;
        CGFloat reduceHeight = 100.0 / sourceImageAspectRatio;
        if (defaultSize.width - reduceWidth <= 0 || defaultSize.height - reduceHeight <= 0) {
            break;
        }
        defaultSize = CGSizeMake(defaultSize.width - reduceWidth, defaultSize.height - reduceHeight);
        UIImage *image = [self newSizeImage:defaultSize
                                      image:[UIImage imageWithData:UIImageJPEGRepresentation(newImage, [[compressionQualityArr lastObject] floatValue])]];
        finallImageData = [self halfFuntion:compressionQualityArr image:image sourceData:UIImageJPEGRepresentation(image,1.0) maxSize:maxSize];
    }
    return finallImageData;
}

#pragma mark 调整图片分辨率/尺寸（等比例缩放）
+ (UIImage *)newSizeImage:(CGSize)size image:(UIImage *)sourceImage {

    CGSize newSize     = CGSizeMake(sourceImage.size.width, sourceImage.size.height);
    CGFloat tempHeight = newSize.height / size.height;
    CGFloat tempWidth  = newSize.width / size.width;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempWidth, sourceImage.size.height / tempWidth);
    } else if (tempHeight > 1.0 && tempWidth < tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempHeight, sourceImage.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [sourceImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark 二分法
+ (NSData *)halfFuntion:(NSArray *)arr image:(UIImage *)image sourceData:(NSData *)finallImageData maxSize:(NSInteger)maxSize {

    NSData *tempData = [NSData data];
    NSUInteger start = 0;
    NSUInteger end   = arr.count - 1;
    NSUInteger index = 0;
    NSUInteger difference = NSIntegerMax;

    while(start <= end) {
        index = start + (end - start) / 2;
        finallImageData = UIImageJPEGRepresentation(image, [arr[index] floatValue]);
        NSUInteger sizeOrigin   = finallImageData.length;
        NSUInteger sizeOriginKB = sizeOrigin / 1024;
        NSLog(@"当前降到的质量：%ld", (unsigned long)sizeOriginKB);
        NSLog(@"\nstart：%zd\nend：%zd\nindex：%zd\n压缩系数：%lf", start, end, (unsigned long)index, [arr[index] floatValue]);
        
        if (sizeOriginKB > maxSize) {
            start = index + 1;
        } else if (sizeOriginKB < maxSize) {
            if (maxSize - sizeOriginKB < difference) {
                difference = maxSize - sizeOriginKB;
                tempData   = finallImageData;
            }
            if (index <= 0) {
                break;
            }
            end = index - 1;
        } else {
            break;
        }
    }
    return tempData;
}

#pragma mark 视频
+ (void)getThumbnailImage:(NSURL *)videoURL atTime:(Float64)seconds completion:(MyImageBlock)handler {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
        
        AVAssetImageGenerator *generator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
        
        generator.appliesPreferredTrackTransform = YES;
        generator.requestedTimeToleranceBefore = kCMTimeZero;
        generator.requestedTimeToleranceAfter = kCMTimeZero;
        
        CMTime time = CMTimeMakeWithSeconds(seconds, 600);
        
        NSError *error = nil;
        
        CMTime actualTime;
        
        CGImageRef imageRef = [generator copyCGImageAtTime:time actualTime:&actualTime error:&error];
        
        UIImage *thumb = [[UIImage alloc] initWithCGImage:imageRef];
        
        CGImageRelease(imageRef);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(thumb);
        });
    });
}

+ (NSURL *)getVideoCoverImageWithVideoUrlStr:(NSString *)videoUrlStr {
    if ([self isNull:videoUrlStr].length > 0) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"%@?x-oss-process=video/snapshot,t_10000,m_fast", videoUrlStr]];
    } else {
        return [NSURL URLWithString:@""];
    }
}

#pragma mark 其他工具
+ (NSString*)getCurrentTimesOfyyyyMMdd {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    //    NSLog(@"currentTimeString =  %@",currentTimeString);
    return currentTimeString;
}

+ (NSString *)getyyyyMMddHHmmssToyyyyMMddTimeStr:(NSString *)str {
    // 实例化NSDateFormatter
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    // 设置日期格式
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // 要转换的日期字符串
    NSString *dateString1 = str;
    // NSDate形式的日期
    NSDate *date =[formatter1 dateFromString:dateString1];
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"yyyy.MM.dd"];
    NSString *dateString2 = [formatter2 stringFromDate:date];
    return dateString2;
}

+ (NSString *)getTimeWithOldDateFormat:(NSString *)oldDateFormat newDateFormat:(NSString *)newDateFormat timeStr:(NSString *)oldTime {
    NSDateFormatter *oldFormatter = [[NSDateFormatter alloc] init];
    [oldFormatter setDateFormat:oldDateFormat];
    NSDate *date = [oldFormatter dateFromString:oldTime];
    NSDateFormatter *newFormatter = [[NSDateFormatter alloc] init];
    [newFormatter setDateFormat:newDateFormat];
    NSString *newTime = [newFormatter stringFromDate:date];
    return newTime;
}

// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
+ (NSString *)getTimeToCurrentTimesWithTimestamp:(NSString *)str{
    NSTimeInterval time = [str doubleValue]/1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    return currentDateStr;
}

+ (NSString *)getTimeToCurrentTimesWithSeconds:(NSString *)yyyyMMddHHmmss {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";//日期格式化类
    NSDate *thatDate = [formatter dateFromString:yyyyMMddHHmmss];
    NSTimeZone *thatZone = [NSTimeZone systemTimeZone];
    NSInteger thatSeconds = [thatZone secondsFromGMTForDate:thatDate];
    NSDate *thatDate8 = [thatDate dateByAddingTimeInterval:thatSeconds];//目标日期 东八区

    NSDate *thisDate = [NSDate date];//当前日期 0区
    NSTimeZone *thisZone = [NSTimeZone systemTimeZone];
    NSTimeInterval thitInterval = [thisZone secondsFromGMTForDate:thisDate];//获取时间间隔
    NSDate *thisDate8 = [thisDate dateByAddingTimeInterval:thitInterval];//当前日期 东八区
    //计算时间间隔（单位是秒）
    NSTimeInterval time = [thisDate8 timeIntervalSinceDate:thatDate8];
    NSString *timeStr = [NSString stringWithFormat:@"%.f", time];
//    NSString *showStr = [NSString stringWithFormat:@"%@--%@ 时间间隔%.f秒", thatDate8, thisDate8, time];
    
    //计算天数、时、分、秒
//    int days = ((int)time)/(3600*24);
//
//    int hours = ((int)time)%(3600*24)/3600;
//
//    int minutes = ((int)time)%(3600*24)%3600/60;
//    int seconds = ((int)time)%(3600*24)%3600%60;
//
//    NSString *dateContent = [[NSString alloc] initWithFormat:@"%i", seconds];
    
    return timeStr;
}

// 2020-09-09 18:42:13
+ (NSString *)getTimeToCurrentTimesWithCustomType:(NSString *)yyyyMMddHHmmss {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";//日期格式化类
    NSDate *thatDate = [formatter dateFromString:yyyyMMddHHmmss];
    NSTimeZone *thatZone = [NSTimeZone systemTimeZone];
    NSInteger thatSeconds = [thatZone secondsFromGMTForDate:thatDate];
    NSDate *thatDate8 = [thatDate dateByAddingTimeInterval:thatSeconds];//目标日期 东八区

    NSDate *thisDate = [NSDate date];//当前日期 0区
    NSTimeZone *thisZone = [NSTimeZone systemTimeZone];
    NSTimeInterval thitInterval = [thisZone secondsFromGMTForDate:thisDate];//获取时间间隔
    NSDate *thisDate8 = [thisDate dateByAddingTimeInterval:thitInterval];//当前日期 东八区
    //计算时间间隔（单位是秒）
//    NSTimeInterval time = [thisDate8 timeIntervalSinceDate:thatDate8];
    NSTimeInterval time = [thatDate8 timeIntervalSinceDate:thisDate8];
    
    if (time <= 0) {
        return @"0";
    }
    
    NSString *timeStr = [NSString stringWithFormat:@"%.f", time];
    return timeStr;
}

+ (UIWindow *)getKeyWindow {
    return [UIApplication sharedApplication].keyWindow;
}

+ (UIViewController *)getCurrentVC {
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentShowVC = [self recursiveFindCurrentShowViewControllerFromViewController:rootVC];
    return currentShowVC;
}

+ (UIViewController *)recursiveFindCurrentShowViewControllerFromViewController:(UIViewController *)fromVC {
    if ([fromVC isKindOfClass:[UINavigationController class]]) {
        return [self recursiveFindCurrentShowViewControllerFromViewController:[((UINavigationController *)fromVC) visibleViewController]];
    } else if ([fromVC isKindOfClass:[UITabBarController class]]) {
        return [self recursiveFindCurrentShowViewControllerFromViewController:[((UITabBarController *)fromVC) selectedViewController]];
    } else {
        if (fromVC.presentedViewController) {
            return [self recursiveFindCurrentShowViewControllerFromViewController:fromVC.presentedViewController];
        } else {
            return fromVC;
        }
    }
}

@end
