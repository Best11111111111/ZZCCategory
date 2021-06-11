//
//  CALayer+ZZCExtension.m
//  ZZCCategory_Example
//
//  Created by zzc on 2021/6/11.
//  Copyright © 2021 1414818015@qq.com. All rights reserved.
//

#import "CALayer+ZZCExtension.h"

@implementation CALayer (ZZCExtension)

- (void)backgroundColorGradientFromColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)start endPoint:(CGPoint)end {
    CAGradientLayer *gradlayer = [CAGradientLayer layer];
    NSMutableArray *cs = [NSMutableArray array];
    for(UIColor *col in colors) {
        [cs addObject:(__bridge id)col.CGColor];
    }
    gradlayer.colors = cs;
    gradlayer.locations = locations;
    gradlayer.startPoint = start;
    gradlayer.endPoint = end;
    gradlayer.frame = self.bounds;
    [self addSublayer:gradlayer];
}

@end
