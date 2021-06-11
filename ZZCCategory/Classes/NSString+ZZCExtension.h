//
//  NSString+ZZCExtension.h
//  ZZCCategory_Example
//
//  Created by zzc on 2021/6/11.
//  Copyright © 2021 1414818015@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZZCExtension)

///去除所有空格和回车
- (NSString *)trim;
///URL 编码 */
- (NSString *)URLEncode;
///URL 解码 *
- (NSString *)URLDecode;
///使用MD5编码
- (NSString *)md5;
///使用Base64编码
- (NSData *)base64Decode;
///计算文本大小
- (CGSize)boundingRectWithWidth:(CGSize)size Font:(UIFont *)font;


@end

NS_ASSUME_NONNULL_END
