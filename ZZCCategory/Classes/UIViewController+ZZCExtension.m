//
//  UIViewController+ZZCExtension.m
//  ZZCCategory_Example
//
//  Created by zzc on 2021/6/11.
//  Copyright © 2021 1414818015@qq.com. All rights reserved.
//

#import "UIViewController+ZZCExtension.h"

@implementation UIViewController (ZZCExtension)

- (UIViewController *)topViewController{
    UIViewController *topVC = [self getTopViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (topVC.presentedViewController) {
        topVC = [self getTopViewController:topVC.presentedViewController];
    }
    return topVC;
}

- (UIViewController *)getTopViewController:(UIViewController *)vc{
    if (![vc isKindOfClass:[UIViewController class]]) {
        return nil;
    }
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getTopViewController:[(UINavigationController *)vc topViewController]];
    }else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getTopViewController:[(UITabBarController *)vc selectedViewController]];
    }else{
        return vc;
    }
}

@end
