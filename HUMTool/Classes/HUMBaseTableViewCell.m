//
//  HUMBaseTableViewCell.m
//
//  Created by HUMioo on 2020/11/14.
//

#import "HUMBaseTableViewCell.h"
@implementation HUMBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        [self createRootLayout];
    
        _rootLayout.translatesAutoresizingMaskIntoConstraints = NO;
        
        //设置布局视图的autolayout约束，这里是用iOS9提供的约束设置方法，您也可以用低级版本设置，以及用masonry来进行设置。
        [_rootLayout.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
        [_rootLayout.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
        //目前MyLayout和AutoLayout相结合并且高度根据宽度自适应时只能通过明确设置宽度约束，暂时不支持同时设置左右约束来确定宽度的能力。
        [_rootLayout.widthAnchor constraintEqualToAnchor:self.contentView.widthAnchor].active = YES;
        //这句代码很关键，表明self.contentView的高度随着子视图_rootLayout的高度自适应。
        [self.contentView.bottomAnchor constraintEqualToAnchor:_rootLayout.bottomAnchor constant:0].active = YES;
    }
    return self;
}

- (void)createRootLayout {

}
@end
