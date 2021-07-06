//
//  HUMTool.h
//

#import <Foundation/Foundation.h>
#import "HUMFrameworkHeader.h"//FrameworkHeader
typedef void(^MyImageBlock)(UIImage * _Nullable image);
NS_ASSUME_NONNULL_BEGIN

@interface HUMTool : NSObject
/// 转换空字符串为“”
/// @param getString 返回结果
+ (NSString *)isNull:(NSString *)getString;

/// 检验纯数字
+ (BOOL)inputShouldNumber:(NSString *)inputString;

/// 去除字符串中所有的空格和换行
+ (NSString *)removeSpaceAndNewline:(NSString *)str;

/// 计算文本高度
/// @param text text description
/// @param width width description
/// @param font font description
+ (CGFloat)heightWithString:(NSString *)text withWidth:(CGFloat)width withFont:(UIFont *)font;

#pragma mark 视图处理
/// UITextField设置左侧的图片
+ (void)setLeftViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName;

/// UITextField设置右侧的图片
+ (void)setRightViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName;

/// 压缩图片
/// @param sourceImage 原图
/// @param maxSize maxSize description
+ (NSData *)resetSizeOfImageData:(UIImage *)sourceImage maxSize:(NSInteger)maxSize;

/// 异步获取视频的任一帧图片
/// @param videoURL videoURL description
/// @param seconds seconds description
/// @param handler handler description
+ (void)getThumbnailImage:(NSURL *)videoURL atTime:(Float64)seconds completion:(MyImageBlock)handler;

/// 获取视频封面
/// @param videoUrlStr videoURL description
+ (NSURL *)getVideoCoverImageWithVideoUrlStr:(NSString *)videoUrlStr;

#pragma mark 其他工具
/// 获取当前时间
+ (NSString*)getCurrentTimesOfYYYYMMdd;
/// 时间戳转yyyyMMddHHmmss字符串
/// @param str 13位时间戳
+ (NSString *)getTimeToCurrentTimesWithTimestamp:(NSString *)str;
/// YYYY-MM-dd HH-mm-ss To yyyy-MM-dd
+ (NSString *)getyyyyMMddHHmmssToyyyyMMddTimeStr:(NSString *)str;
/// 时间格式化输出type
+ (NSString *)getTimeWithOldDateFormat:(NSString *)oldDateFormat newDateFormat:(NSString *)newDateFormat timeStr:(NSString *)oldTime;

/// 获取目标日期距现在多少秒
/// @param yyyyMMddHHmmss 目标日期
+ (NSString *)getTimeToCurrentTimesWithSeconds:(NSString *)yyyyMMddHHmmss;

/// 获取目标日期距现在多少秒 目标时间比现在晚
/// @param yyyyMMddHHmmss 2020-09-09 18:42:13
+ (NSString *)getTimeToCurrentTimesWithCustomType:(NSString *)yyyyMMddHHmmss;

/// 获得Keywindow 适配iOS13
+ (UIWindow *)getKeyWindow;

/// 获取当前VC
+ (UIViewController *)getCurrentVC;
@end

NS_ASSUME_NONNULL_END
