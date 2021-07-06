//
//  HUMBaseTableViewCell.h
//
//  Created by HUMioo on 2020/11/14.
//

#import <UIKit/UIKit.h>
#import "HUMFrameworkHeader.h"//FrameworkHeader
NS_ASSUME_NONNULL_BEGIN

@interface HUMBaseTableViewCell : UITableViewCell
@property (nonatomic, strong) MyBaseLayout *rootLayout;
- (void)createRootLayout;
@end

NS_ASSUME_NONNULL_END
