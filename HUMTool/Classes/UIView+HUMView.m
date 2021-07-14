//
//  UIView+HUMView.m
//

#import "UIView+HUMView.h"

@implementation UIView (HUMView)
/**
 设置阴影
 */
- (void)setShadowCornerRadius:(CGFloat)cornerRadius withColor:(UIColor *)color withOffset:(CGFloat)offset{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowRadius = 5.0f;
    self.layer.shadowOffset = CGSizeMake(0,offset);
    self.layer.cornerRadius = cornerRadius;
}

/**
 设置渐变色
 */
- (void)setGradientRampWithStartColor:(UIColor *)startColor withEndColor:(UIColor *)endColor withFrame:(CGRect)frame needRadius:(BOOL)need{
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    if (need) {
        gradientLayer.cornerRadius = frame.size.height/2;
    }
    gradientLayer.frame = frame;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.locations = @[@(0.4),@(1.0)];//渐变点
    [gradientLayer setColors:@[(id)[startColor CGColor],(id)[endColor CGColor]]];//渐变数组
    [self.layer addSublayer:gradientLayer];
}



@end
