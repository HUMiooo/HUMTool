//
//  UIView+HUMView.h
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HUMView)

/**
设置阴影
*/
- (void)setShadowCornerRadius:(CGFloat)cornerRadius withColor:(UIColor *)color withOffset:(CGFloat)offset;

/**
 设置渐变色
 */
- (void)setGradientRampWithStartColor:(UIColor *)startColor withEndColor:(UIColor *)endColor withFrame:(CGRect)frame needRadius:(BOOL)need;

@end

NS_ASSUME_NONNULL_END
