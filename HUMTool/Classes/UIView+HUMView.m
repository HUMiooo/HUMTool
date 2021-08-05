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
- (void)setGradientRampWithStartColor:(UIColor *)startColor withEndColor:(UIColor *)endColor withFrame:(CGRect)frame needRadius:(BOOL)need directions:(HUMGradientRampDirectionsType)type {
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    if (need) {
        gradientLayer.cornerRadius = frame.size.height/2;
    }
    gradientLayer.frame = frame;
    //（0，0）：左上角
    CGPoint L_T = CGPointMake(0, 0);
    //（0，1）：左下角
    CGPoint L_B = CGPointMake(0, 1);
    //（1，0）：右上角
    CGPoint R_T = CGPointMake(1, 0);
    //（1，1）：右下角
    CGPoint R_B = CGPointMake(1, 1);
    switch (type) {
        case TypeTop_Bottom:
        {
            gradientLayer.startPoint = L_T;
            gradientLayer.endPoint = L_B;
        }
            break;
        case TypeBottom_Top:
        {
            gradientLayer.startPoint = L_B;
            gradientLayer.endPoint = L_T;
        }
            break;
        case TypeLeft_Right:
        {
            gradientLayer.startPoint = L_T;
            gradientLayer.endPoint = R_T;
        }
            break;
        case TypeRight_Left:
        {
            gradientLayer.startPoint = R_T;
            gradientLayer.endPoint = L_T;
        }
            break;
            
        case TypeLeftTop_RightBottom:
        {
            gradientLayer.startPoint = L_T;
            gradientLayer.endPoint = R_B;
        }
            break;
        case TypeLeftBottom_RightTop:
        {
            gradientLayer.startPoint = L_B;
            gradientLayer.endPoint = R_T;
        }
            break;
        case TypeRightTop_LeftBottom:
        {
            gradientLayer.startPoint = R_T;
            gradientLayer.endPoint = L_B;
        }
            break;
        case TypeRightBottom_LeftTop:
        {
            gradientLayer.startPoint = R_B;
            gradientLayer.endPoint = R_T;
        }
            break;
            
        default:
        {
            gradientLayer.startPoint = L_T;
            gradientLayer.endPoint = L_B;
        }
            break;
    }
    gradientLayer.locations = @[@(0.4),@(1.0)];//渐变点
    [gradientLayer setColors:@[(id)[startColor CGColor],(id)[endColor CGColor]]];//渐变数组
    [self.layer addSublayer:gradientLayer];
    [self.layer insertSublayer:gradientLayer atIndex:0];//注意添加顺序
}

@end
