//
//  UIButton+HTmButtonStyle.m
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 16/04/01.
//  Copyright (c) 2016年 OYXJ. All rights reserved.
//

#import "UIButton+HTmButtonStyle.h"

@implementation UIButton (HTmButtonStyle)


#pragma mark - 背景颜色

/**
 白色背景
 */
- (void)systemWhiteBackgroundStyle
{
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor whiteColor]]
                    forState:UIControlStateNormal];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateHighlighted];
}

/**
 灰色背景
 */
- (void)systemGrayBackgroundStyle
{}

/**
 蓝色背景
 */
- (void)systemBlueBackgroundStyle
{
    self.backgroundColor = SystemBlue;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    self.layer.borderColor = [SystemBlue CGColor];
    self.layer.borderWidth = 1.0f;
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor grayColor]] forState:UIControlStateHighlighted];
}

/**
 红色背景
 */
- (void)systemRedBackgroundStyle
{}

/**
 绿色背景
 */
- (void)systemGreenBackgroundStyle
{}

/**
 紫色背景
 */
- (void)systemPurpleBackgroundStyle
{}



#pragma mark - 标题颜色

/**
 黑色标题（文字）
 */
- (void)systemBlackTextStyle
{
    self.titleLabel.font = [UIFont boldSystemFontOfSize:R(16)];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:0.80] forState:UIControlStateNormal];
    
    //     当标题为黑色的时候，添加默认的背景颜色；
    //注意，当标题为黑色的时候，请调用者 使用NS_OPTIONS 自己设定背景颜色。
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor whiteColor]]
                    forState:UIControlStateNormal];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateSelected];
}

/**
 黑色标题 (数字)
 */
- (void)systemBlackDigitStyle
{
    self.titleLabel.font = [UIFont systemFontOfSize:R(16)];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:0.80] forState:UIControlStateNormal];
    
    //     当标题为黑色的时候，添加默认的背景颜色；
    //注意，当标题为黑色的时候，请调用者 使用NS_OPTIONS 自己设定背景颜色。
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor whiteColor]]
                    forState:UIControlStateNormal];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateSelected];
}

/**
 灰色标题
 */
- (void)systemGrayTextStyle
{
}

/**
 蓝色标题
 */
- (void)systemBlueTextStyle
{
    self.backgroundColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:R(16)];
    [self setTitleColor:SystemBlue forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    //self.layer.masksToBounds = YES;
    //self.layer.cornerRadius = 5;
    //self.layer.borderColor = [UIColor colorWithHexColorString:@"0xcccccc"].CGColor;
    //self.layer.borderWidth = 1.0f;
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor whiteColor]]
                    forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateHighlighted];
}

/**
 红色标题
 */
- (void)systemRedTextStyle
{
    self.backgroundColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:R(16)];
    [self setTitleColor:SystemDeepRed forState:UIControlStateNormal];
    //self.layer.masksToBounds = YES;
    //self.layer.cornerRadius = 5;
    //self.layer.borderColor = [UIColor colorWithHexColorString:@"0xcccccc"].CGColor;
    //self.layer.borderWidth = 1.0f;
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor whiteColor]]
                    forState:UIControlStateNormal];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateSelected];
}

/**
 绿色标题
 */
- (void)systemGreenTextStyle
{
    self.backgroundColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:R(16)];
    [self setTitleColor:SystemGreen forState:UIControlStateNormal];
    //self.layer.masksToBounds = YES;
    //self.layer.cornerRadius = 5;
    //self.layer.borderColor = [UIColor colorWithHexColorString:@"0xcccccc"].CGColor;
    //self.layer.borderWidth = 1.0f;
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor whiteColor]]
                    forState:UIControlStateNormal];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateSelected];
}

/**
 紫色标题
 */
- (void)systemPurpleTextStyle
{}



#pragma mark - 特殊样式

/**
 高亮邮箱后缀
 */
- (void)highLightMailSuffixStyleWithString:(NSString *)mailAccount
{
    NSRange rangeOfAt = [mailAccount rangeOfString:@"@"];
    NSRange range = NSMakeRange(rangeOfAt.location, mailAccount.length - rangeOfAt.location);
    
    NSMutableAttributedString *aAttributeString = [[NSMutableAttributedString alloc] initWithString:mailAccount];
    [aAttributeString addAttribute:NSForegroundColorAttributeName value:SystemBlue range:range];
    [aAttributeString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, range.location)];
    
    NSMutableAttributedString *highLightAttribute = [[NSMutableAttributedString alloc] initWithString:mailAccount];
    [highLightAttribute addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:range];
    [highLightAttribute addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, range.location)];
    
    
    
    self.backgroundColor = [UIColor whiteColor];
    [self setAttributedTitle:aAttributeString forState:UIControlStateNormal];
    [self setAttributedTitle:highLightAttribute forState:UIControlStateHighlighted];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    self.layer.borderColor = [UIColor colorWithHexColorString:@"0xcccccc"].CGColor;
    self.layer.borderWidth = 1.0f;
    [self setBackgroundImage:[self buttonImageFromColor:SystemBlue] forState:UIControlStateHighlighted];
}


#pragma mark - 取消样式

/**
 取消
 */
- (void)cancelStyle
{
    self.titleLabel.font = [UIFont boldSystemFontOfSize:R(16)];
    [self setTitleColor:[UIColor colorWithHex:0x000000 alpha:0.80] forState:UIControlStateNormal];
    
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor whiteColor]]
                    forState:UIControlStateNormal];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithHex:0x000000 alpha:0.10]]
                    forState:UIControlStateSelected];
}




#pragma mark - helpers

- (UIImage *)buttonImageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
