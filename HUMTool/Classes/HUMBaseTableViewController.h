//
//  HUMBaseTableViewController.h
//
//

#import <QMUIKit/QMUIKit.h>
#import "HUMFrameworkHeader.h"//FrameworkHeader
#import "HUMBaseVCConfig.h"
@interface HUMBaseTableViewController : QMUICommonTableViewController
/// VC配置
@property (nonatomic, strong) HUMBaseVCConfig *config;

@end
