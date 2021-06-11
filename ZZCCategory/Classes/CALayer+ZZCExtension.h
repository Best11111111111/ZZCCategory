//
//  CALayer+ZZCExtension.h
//  ZZCCategory_Example
//
//  Created by zzc on 2021/6/11.
//  Copyright © 2021 1414818015@qq.com. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (ZZCExtension)

/// 增加渐变颜色
/// @param colors 渐变的颜色
/// @param locations 分割点 (0.0~1.0)
/// @param start 起始点 (x:0.0~1.0, y:0.0~1.0)
/// @param end 结束点 (x:0.0~1.0, y:0.0~1.0)
- (void)backgroundColorGradientFromColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)start endPoint:(CGPoint)end;

@end

NS_ASSUME_NONNULL_END
