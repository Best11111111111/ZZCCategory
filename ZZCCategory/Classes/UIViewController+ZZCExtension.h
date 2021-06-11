//
//  UIViewController+ZZCExtension.h
//  ZZCCategory_Example
//
//  Created by zzc on 2021/6/11.
//  Copyright © 2021 1414818015@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ZZCExtension)

///获取最上层视图
- (UIViewController *)topViewController;

@end

NS_ASSUME_NONNULL_END
