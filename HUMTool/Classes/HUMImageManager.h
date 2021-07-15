//
//  HUMImageManager.h
//
//  Created by Humioo on 2021/7/5.
//

#import <Foundation/Foundation.h>
#import "HUMFrameworkHeader.h"//FrameworkHeader
typedef void(^HUMImageManagerSingleBlock)(UIImage *image);
typedef void(^HUMImageManagerMultipleBlock)(NSArray *urlArray);
typedef NS_ENUM(NSUInteger, HUMImageManagerNumType) {
    HUMImageManagerNumTypeNormal, //都可
    HUMImageManagerNumTypeSingle, //单选
    HUMImageManagerNumTypeMultiple, //多选
};

@interface HUMImageManager : NSObject
+ (instancetype)manager;

/// 弹出图片选择视图
/// @param title 弹出视图标题
/// @param kAlbumContentType 类型
/// @param kImageManagerNumType 数量类型
/// @param currentVC currentVC description
/// @param maxSelectedImageCount 最大选择数量
/// @param singleFinishBlock singleFinishBlock description
/// @param multipleFinishBlock multipleFinishBlock description
- (void)authorizationPresentAlbumViewControllerWithTitle:(NSString *)title
                                        albumContentType:(QMUIAlbumContentType)kAlbumContentType
                                     imageManagerNumType:(HUMImageManagerNumType)kImageManagerNumType
                                               currentVC:(UIViewController *)currentVC
                                   maxSelectedImageCount:(NSInteger)maxSelectedImageCount
                                             singleBlock:(HUMImageManagerSingleBlock)singleFinishBlock
                                           multipleBlock:(HUMImageManagerMultipleBlock)multipleFinishBlock;
@end
