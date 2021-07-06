//
//  HUMImageManager.m
//
//  Created by Humioo on 2021/7/5.
//

#import "HUMImageManager.h"
#import "QDSingleImagePickerPreviewViewController.h"
#import "QDMultipleImagePickerPreviewViewController.h"

#define NormalImagePickingTag   1045
#define MultipleImagePickingTag 1046
#define SingleImagePickingTag   1047

@interface HUMImageManager()<QMUIAlbumViewControllerDelegate, QMUIImagePickerViewControllerDelegate, QDMultipleImagePickerPreviewViewControllerDelegate, QDSingleImagePickerPreviewViewControllerDelegate>
@property (nonatomic, strong) UIViewController *currentVC;
/// 内容类型
@property (nonatomic, assign) QMUIAlbumContentType kAlbumContentType;
/// 数量类型
@property (nonatomic, assign) HUMImageManagerNumType imageManagerNumType;
/// 最大选择数量 >1
@property (nonatomic, assign) NSInteger maxSelectedImageCount;
@property (nonatomic, copy) HUMImageManagerSingleBlock singleFinishBlock;
@property (nonatomic, copy) HUMImageManagerMultipleBlock multipleFinishBlock;
@end
@implementation HUMImageManager
+ (instancetype)manager {
    static HUMImageManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HUMImageManager alloc] init];
    });
    return manager;
}
- (void)authorizationPresentAlbumViewControllerWithTitle:(NSString *)title
                                        albumContentType:(QMUIAlbumContentType)kAlbumContentType
                                     imageManagerNumType:(HUMImageManagerNumType)kImageManagerNumType
                                               currentVC:(nonnull UIViewController *)currentVC
                                   maxSelectedImageCount:(NSInteger)maxSelectedImageCount
                                             singleBlock:(HUMImageManagerSingleBlock)singleFinishBlock
                                           multipleBlock:(HUMImageManagerMultipleBlock)multipleFinishBlock{
    _kAlbumContentType = kAlbumContentType;
    _imageManagerNumType = kImageManagerNumType;
    _currentVC = currentVC;
    _maxSelectedImageCount = maxSelectedImageCount;
    _singleFinishBlock = singleFinishBlock;
    _multipleFinishBlock = multipleFinishBlock;
    if ([QMUIAssetsManager authorizationStatus] == QMUIAssetAuthorizationStatusNotDetermined) {
        [QMUIAssetsManager requestAuthorization:^(QMUIAssetAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentAlbumViewControllerWithTitle:title];
            });
        }];
    } else {
        [self presentAlbumViewControllerWithTitle:title];
    }
}

- (void)presentAlbumViewControllerWithTitle:(NSString *)title {
    // 创建一个 QMUIAlbumViewController 实例用于呈现相簿列表
    QMUIAlbumViewController *albumViewController = [[QMUIAlbumViewController alloc] init];
    albumViewController.albumViewControllerDelegate = self;
    albumViewController.contentType = _kAlbumContentType;
    albumViewController.title = title;
    albumViewController.edgesForExtendedLayout = UIRectEdgeNone;

    if (_imageManagerNumType == HUMImageManagerNumTypeSingle) {
        albumViewController.view.tag = SingleImagePickingTag;
    } else if (_imageManagerNumType == HUMImageManagerNumTypeMultiple) {
        albumViewController.view.tag = MultipleImagePickingTag;
    } else {
        albumViewController.view.tag = NormalImagePickingTag;
    }

    QMUINavigationController *navigationController = [[QMUINavigationController alloc] initWithRootViewController:albumViewController];

    // 获取最近发送图片时使用过的相簿，如果有则直接进入该相簿
    [albumViewController pickLastAlbumGroupDirectlyIfCan];
    [_currentVC presentViewController:navigationController animated:YES completion:NULL];
}

#pragma mark - <QMUIAlbumViewControllerDelegate>
- (QMUIImagePickerViewController *)imagePickerViewControllerForAlbumViewController:(QMUIAlbumViewController *)albumViewController {
    QMUIImagePickerViewController *imagePickerViewController = [[QMUIImagePickerViewController alloc] init];
    imagePickerViewController.imagePickerViewControllerDelegate = self;
    imagePickerViewController.view.tag = albumViewController.view.tag;
    if (albumViewController.view.tag == SingleImagePickingTag) {
        imagePickerViewController.allowsMultipleSelection = NO;
        imagePickerViewController.maximumSelectImageCount = 1;
    } else {
        imagePickerViewController.allowsMultipleSelection = YES;
        imagePickerViewController.maximumSelectImageCount = _maxSelectedImageCount;
    }
    return imagePickerViewController;
}

#pragma mark - <QMUIImagePickerViewControllerDelegate>
- (void)imagePickerViewController:(QMUIImagePickerViewController *)imagePickerViewController didFinishPickingImageWithImagesAssetArray:(NSMutableArray<QMUIAsset *> *)imagesAssetArray {
    // 储存最近选择了图片的相册，方便下次直接进入该相册
    [QMUIImagePickerHelper updateLastestAlbumWithAssetsGroup:imagePickerViewController.assetsGroup ablumContentType:_kAlbumContentType userIdentify:nil];
    
    [self sendImageWithImagesAssetArray:imagesAssetArray];
}

- (QMUIImagePickerPreviewViewController *)imagePickerPreviewViewControllerForImagePickerViewController:(QMUIImagePickerViewController *)imagePickerViewController {
    if (imagePickerViewController.view.tag == MultipleImagePickingTag) {
        QDMultipleImagePickerPreviewViewController *imagePickerPreviewViewController = [[QDMultipleImagePickerPreviewViewController alloc] init];
        imagePickerPreviewViewController.delegate = self;
        imagePickerPreviewViewController.maximumSelectImageCount = _maxSelectedImageCount;
        imagePickerPreviewViewController.assetsGroup = imagePickerViewController.assetsGroup;
        imagePickerPreviewViewController.view.tag = imagePickerViewController.view.tag;
        return imagePickerPreviewViewController;
    } else if (imagePickerViewController.view.tag == SingleImagePickingTag) {
        QDSingleImagePickerPreviewViewController *imagePickerPreviewViewController = [[QDSingleImagePickerPreviewViewController alloc] init];
        imagePickerPreviewViewController.delegate = self;
        imagePickerPreviewViewController.assetsGroup = imagePickerViewController.assetsGroup;
        imagePickerPreviewViewController.view.tag = imagePickerViewController.view.tag;
        return imagePickerPreviewViewController;
    } else {
        QMUIImagePickerPreviewViewController *imagePickerPreviewViewController = [[QMUIImagePickerPreviewViewController alloc] init];
        imagePickerPreviewViewController.delegate = self;
        imagePickerPreviewViewController.view.tag = imagePickerViewController.view.tag;
        return imagePickerPreviewViewController;
    }
}

#pragma mark - <QMUIImagePickerPreviewViewControllerDelegate>
- (void)imagePickerPreviewViewController:(QMUIImagePickerPreviewViewController *)imagePickerPreviewViewController didCheckImageAtIndex:(NSInteger)index {
    [self updateImageCountLabelForPreviewView:imagePickerPreviewViewController];
}

- (void)imagePickerPreviewViewController:(QMUIImagePickerPreviewViewController *)imagePickerPreviewViewController didUncheckImageAtIndex:(NSInteger)index {
    [self updateImageCountLabelForPreviewView:imagePickerPreviewViewController];
}

// 更新选中的图片数量
- (void)updateImageCountLabelForPreviewView:(QMUIImagePickerPreviewViewController *)imagePickerPreviewViewController {
    if (imagePickerPreviewViewController.view.tag == MultipleImagePickingTag) {
        QDMultipleImagePickerPreviewViewController *customImagePickerPreviewViewController = (QDMultipleImagePickerPreviewViewController *)imagePickerPreviewViewController;
        NSUInteger selectedCount = [imagePickerPreviewViewController.selectedImageAssetArray count];
        if (selectedCount > 0) {
            customImagePickerPreviewViewController.imageCountLabel.text = [[NSString alloc] initWithFormat:@"%@", @(selectedCount)];
            customImagePickerPreviewViewController.imageCountLabel.hidden = NO;
            [QMUIImagePickerHelper springAnimationOfImageSelectedCountChangeWithCountLabel:customImagePickerPreviewViewController.imageCountLabel];
        } else {
            customImagePickerPreviewViewController.imageCountLabel.hidden = YES;
        }
    }
}

#pragma mark - <QDMultipleImagePickerPreviewViewControllerDelegate>
- (void)imagePickerPreviewViewController:(QDMultipleImagePickerPreviewViewController *)imagePickerPreviewViewController sendImageWithImagesAssetArray:(NSMutableArray<QMUIAsset *> *)imagesAssetArray {
    // 储存最近选择了图片的相册，方便下次直接进入该相册
    [QMUIImagePickerHelper updateLastestAlbumWithAssetsGroup:imagePickerPreviewViewController.assetsGroup ablumContentType:_kAlbumContentType userIdentify:nil];
    
    [self sendImageWithImagesAssetArray:imagesAssetArray];
}

#pragma mark - <QDSingleImagePickerPreviewViewControllerDelegate>
- (void)imagePickerPreviewViewController:(QDSingleImagePickerPreviewViewController *)imagePickerPreviewViewController didSelectImageWithImagesAsset:(QMUIAsset *)imageAsset {
    // 储存最近选择了图片的相册，方便下次直接进入该相册
    [QMUIImagePickerHelper updateLastestAlbumWithAssetsGroup:imagePickerPreviewViewController.assetsGroup ablumContentType:_kAlbumContentType userIdentify:nil];
    // 显示 loading
    [self startLoading];
    [imageAsset requestImageData:^(NSData *imageData, NSDictionary<NSString *,id> *info, BOOL isGif, BOOL isHEIC) {
        UIImage *targetImage = nil;
        if (isGif) {
            targetImage = [UIImage qmui_animatedImageWithData:imageData];
        } else {
            targetImage = [UIImage imageWithData:imageData];
            if (isHEIC) {
                // iOS 11 中新增 HEIF/HEVC 格式的资源，直接发送新格式的照片到不支持新格式的设备，照片可能会无法识别，可以先转换为通用的 JPEG 格式再进行使用。
                // 详细请浏览：https://github.com/Tencent/QMUI_iOS/issues/224
                targetImage = [UIImage imageWithData:UIImageJPEGRepresentation(targetImage, 1)];
            }
            
            [self sendSingleImageWith:targetImage];
        }
    }];
}

/// 单选图片
/// @param image image description
- (void)sendSingleImageWith:(UIImage *)image {
    self.singleFinishBlock(image);
}

- (void)sendImageWithImagesAssetArray:(NSMutableArray<QMUIAsset *> *)imagesAssetArray {
    __weak __typeof(self)weakSelf = self;
    for (QMUIAsset *asset in imagesAssetArray) {
        [QMUIImagePickerHelper requestImageAssetIfNeeded:asset completion:^(QMUIAssetDownloadStatus downloadStatus, NSError *error) {
            if (downloadStatus == QMUIAssetDownloadStatusDownloading) {
                [weakSelf startLoadingWithText:@"从 iCloud 加载中"];
            } else if (downloadStatus == QMUIAssetDownloadStatusSucceed) {
                [weakSelf sendImageWithImagesAssetArrayIfDownloadStatusSucceed:imagesAssetArray];
            } else {
                [weakSelf showTipLabelWithText:@"iCloud 下载错误，请重新选图"];
            }
        }];
    }
}

/// 多选图片
/// @param imagesAssetArray imagesAssetArray description
- (void)sendImageWithImagesAssetArrayIfDownloadStatusSucceed:(NSMutableArray<QMUIAsset *> *)imagesAssetArray {
    if ([QMUIImagePickerHelper imageAssetsDownloaded:imagesAssetArray]) {
//        // 所有资源从 iCloud 下载成功，模拟发送图片到服务器
//        // 显示发送中
//        [self showTipLabelWithText:@"发送中"];
//        // 使用 delay 模拟网络请求时长
//        [self performSelector:@selector(showTipLabelWithText:) withObject:[NSString stringWithFormat:@"成功发送%@个资源", @([imagesAssetArray count])] afterDelay:1.5];
    }
}

#pragma mark - 业务方法
- (void)startLoading {
    [QMUITips showLoadingInView:_currentVC.view];
}

- (void)startLoadingWithText:(NSString *)text {
    [QMUITips showLoading:text inView:_currentVC.view];
}

- (void)stopLoading {
    [QMUITips hideAllToastInView:_currentVC.view animated:YES];
}

- (void)showTipLabelWithText:(NSString *)text {
    [self stopLoading];
    [QMUITips showWithText:text inView:_currentVC.view hideAfterDelay:1.0];
}

- (void)hideTipLabel {
    [QMUITips hideAllToastInView:_currentVC.view animated:YES];
}

@end
