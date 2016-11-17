//
//  UIColor+Extra.h
//  TemplatesProject
//
//  Created by OYXJ on 14-5-30.
//  Copyright (c) 2014年 OYXJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor (xj_Hex)

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*)colorWithHex:(NSInteger)hexValue;
+ (UIColor*)whiteColorWithAlpha:(CGFloat)alphaValue;
+ (UIColor*)blackColorWithAlpha:(CGFloat)alphaValue;

+ (UIColor *)colorWithHexColorString:(NSString *)hexColor alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString;

@end
