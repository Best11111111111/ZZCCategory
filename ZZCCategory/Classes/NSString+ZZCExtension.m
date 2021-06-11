//
//  NSString+ZZCExtension.m
//  ZZCCategory_Example
//
//  Created by zzc on 2021/6/11.
//  Copyright © 2021 1414818015@qq.com. All rights reserved.
//

#import "NSString+ZZCExtension.h"
#import <CommonCrypto/CommonDigest.h>

#define kURLEncodeCharters @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| "

@implementation NSString (ZZCExtension)

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)URLEncode {
    NSString *encodedString = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:kURLEncodeCharters]];
    if (!encodedString) encodedString = @"";
    return encodedString;
}

- (NSString *)URLDecode {
    NSString *decodedString = [self stringByRemovingPercentEncoding];
    return decodedString;
}

- (NSString *)md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[32];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
    ];
}

- (NSData *)base64Decode {
    unsigned long ixtext, lentext;
    unsigned char ch, inbuf[4], outbuf[4];
    short i, ixinbuf;
    Boolean flignore, flendtext = false;
    const unsigned char *tempcstring;
    NSMutableData *theData;
    ixtext = 0;
    tempcstring = (const unsigned char *)[self UTF8String];
    lentext = [self length];
    theData = [NSMutableData dataWithCapacity:lentext];
    ixinbuf = 0;
    while (true) {
        if (ixtext >= lentext) {
            break;
        }
        ch = tempcstring [ixtext++];
        flignore = false;
        if ((ch >= 'A') && (ch <= 'Z')) {
            ch = ch - 'A';
        }
        else if ((ch >= 'a') && (ch <= 'z')) {
            ch = ch - 'a' + 26;
        }
        else if ((ch >= '0') && (ch <= '9')) {
            ch = ch - '0' + 52;
        }
        else if (ch == '+') {
            ch = 62;
        }
        else if (ch == '=') {
            flendtext = true;
        }
        else if (ch == '/') {
            ch = 63;
        }
        else {
            flignore = true;
        }
        if (!flignore) {
            short ctcharsinbuf = 3;
            Boolean flbreak = false;
            if (flendtext) {
                if (ixinbuf == 0) {
                    break;
                }
                if ((ixinbuf == 1) || (ixinbuf == 2)) ctcharsinbuf = 1;
                else ctcharsinbuf = 2;
                ixinbuf = 3;
                flbreak = true;
            }
            inbuf [ixinbuf++] = ch;
            if (ixinbuf == 4) {
                ixinbuf = 0;
                outbuf[0] = (inbuf[0] << 2) | ((inbuf[1] & 0x30) >> 4);
                outbuf[1] = ((inbuf[1] & 0x0F) << 4) | ((inbuf[2] & 0x3C) >> 2);
                outbuf[2] = ((inbuf[2] & 0x03) << 6) | (inbuf[3] & 0x3F);
                for (i = 0; i < ctcharsinbuf; i++) {
                    [theData appendBytes:&outbuf[i] length:1];
                }
            }
            if (flbreak) {
                break;
            }
        }
    }
    return theData;
}

- (CGSize)boundingRectWithWidth:(CGSize)size Font:(UIFont *)font {
    CGSize titleSize = [self boundingRectWithSize:size
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{ NSFontAttributeName: font }
                                          context:nil].size;
    return titleSize;
}

@end
