//
//  UIView+HUMView.h
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger) {
    TypeTop_Bottom,
    TypeBottom_Top,
    TypeLeft_Right,
    TypeRight_Left,
    
    TypeLeftTop_RightBottom,
    TypeLeftBottom_RightTop,
    TypeRightTop_LeftBottom,
    TypeRightBottom_LeftTop,
} HUMGradientRampDirectionsType;

@interface UIView (HUMView)

/**
设置阴影
*/
- (void)setShadowCornerRadius:(CGFloat)cornerRadius withColor:(UIColor *)color withOffset:(CGFloat)offset;

/**
 设置渐变色
 */
- (void)setGradientRampWithStartColor:(UIColor *)startColor withEndColor:(UIColor *)endColor withFrame:(CGRect)frame needRadius:(BOOL)need directions:(HUMGradientRampDirectionsType)type;

@end

NS_ASSUME_NONNULL_END
