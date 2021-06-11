//
//  UIButton+ZZCExtension.h
//  ZZCCategory_Example
//
//  Created by zzc on 2021/6/11.
//  Copyright © 2021 zhengzhicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZZCImagePosition) {
    ZZCImagePositionLeft = 0,              // 图片在左，文字在右，默认
    ZZCImagePositionRight = 1,             // 图片在右，文字在左
    ZZCImagePositionTop = 2,               // 图片在上，文字在下
    ZZCImagePositionBottom = 3,            // 图片在下，文字在上
};

@interface UIButton (ZZCExtension)

@property(nonatomic, assign) UIEdgeInsets hitTestEdgeInsets;

///  UIButton 倒计时category
/// @param startTime  倒计时时间
/// @param title  倒计时结束按钮显示的文字
/// @param unitTitle 倒计时的时间单位（默认s）
/// @param mColor 按钮背景颜色
/// @param color 倒计时中按钮的背景颜色
- (void)countDownFromTime:(NSInteger)startTime title:(NSString *)title unitTitle:(NSString *)unitTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;
/**
 *  利用 UIButton 的 titleEdgeInsets 和 imageEdgeInsets 来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且 button 的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)zzc_setImagePosition:(ZZCImagePosition)postion spacing:(CGFloat)spacing;
@end

NS_ASSUME_NONNULL_END
