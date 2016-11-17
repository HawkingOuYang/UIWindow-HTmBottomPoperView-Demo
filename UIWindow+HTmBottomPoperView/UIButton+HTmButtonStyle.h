//
//  UIButton+HTmButtonStyle.h
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 16/04/01.
//  Copyright (c) 2016年 OYXJ. All rights reserved.
//

#import <UIKit/UIKit.h>

/*! @brief  按钮样式：主要是 按钮的背景颜色，按钮的标题颜色
 *  @author OuYangXiaoJin 2016.04.01
 */
@interface UIButton (HTmButtonStyle)


#pragma mark - 背景颜色

/**
 白色背景
 */
- (void)systemWhiteBackgroundStyle;

/**
 灰色背景
 */
- (void)systemGrayBackgroundStyle;

/**
 蓝色背景
 */
- (void)systemBlueBackgroundStyle;

/**
 红色背景
 */
- (void)systemRedBackgroundStyle;

/**
 绿色背景
 */
- (void)systemGreenBackgroundStyle;

/**
 紫色背景
 */
- (void)systemPurpleBackgroundStyle;



#pragma mark - 标题颜色

/**
 黑色标题（文字）
 */
- (void)systemBlackTextStyle;

/**
 黑色标题 (数字)
 */
- (void)systemBlackDigitStyle;

/**
 灰色标题
 */
- (void)systemGrayTextStyle;

/**
 蓝色标题
 */
- (void)systemBlueTextStyle;

/**
 红色标题
 */
- (void)systemRedTextStyle;

/**
 绿色标题
 */
- (void)systemGreenTextStyle;

/**
 紫色标题
 */
- (void)systemPurpleTextStyle;



#pragma mark - 特殊样式

/**
 高亮邮箱后缀
 */
- (void)highLightMailSuffixStyleWithString:(NSString *)mailAccount;


#pragma mark - 取消样式

/**
 取消
 */
- (void)cancelStyle;



#pragma mark - helpers

/**
 根据颜色返回图片
 */
- (UIImage *)buttonImageFromColor:(UIColor *)color;


@end
