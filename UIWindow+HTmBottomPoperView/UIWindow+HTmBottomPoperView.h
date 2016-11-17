//
//  UIWindow+HTmBottomPoperView.h
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 16/04/01.
//  Copyright (c) 2016年 OYXJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HTmPopSelectView.h"//可选面板视图


NS_ASSUME_NONNULL_BEGIN


/*! @brief  从Window底部弹出View，效果类似UIActionSheet。
 *  @author OuYangXiaoJin 2016.04.01
 */
@interface UIWindow (HTmBottomPoperView)

/**
 *  根据参数弹出按钮列表
 *
 *  @param headTitle          头标题
 *  @param titles             按钮名称数组
 *  @param popItemStyles      按钮类型数组，元素是：用NSNumber包装的 HTmPopItemStyle。
 *  @param selectItemCallBack 点击事件回调
 *  @param isDismiss          点击背景，是否关闭当前弹出视图
 */
- (void)popBottomViewWithHeadTitle:(NSString * _Nullable)headTitle
                            titles:(NSArray<__kindof NSString*>  *)titles
                            styles:(NSArray<__kindof NSNumber*>  *)popItemStyles
                      onSelectItem:(nullable HTmPopItemSelectBlock)selectItemCallBack
dismissBottomViewWhenTapBackGround:(BOOL)isDismiss;

/**
 *  根据参数弹出按钮列表
 *
 *  @param attributedHeadTitle  头标题(富文本)
 *  @param titles               按钮名称数组
 *  @param popItemStyles        按钮类型数组，元素是：用NSNumber包装的 HTmPopItemStyle。
 *  @param selectItemCallBack   点击事件回调
 *  @param isDismiss            点击背景，是否关闭当前弹出视图
 */
- (void)popBottomViewWithAttributedHeadTitle:(NSAttributedString * _Nullable)attributedHeadTitle
                                      titles:(NSArray<__kindof NSString*>  *)titles
                                      styles:(NSArray<__kindof NSNumber*>  *)popItemStyles
                                onSelectItem:(nullable HTmPopItemSelectBlock)selectItemCallBack
          dismissBottomViewWhenTapBackGround:(BOOL)isDismiss;

/**
 *  根据参数弹出按钮列表
 *
 *  @param headTitle          头标题
 *  @param titles             按钮名称数组
 *  @param popItemStyles      按钮类型数组，元素是：用NSNumber包装的 HTmPopItemStyle。
 *  @param selectItemCallBack 点击事件回调
 */
- (void)popBottomViewWithHeadTitle:(NSString * _Nullable)headTitle
                            titles:(NSArray<__kindof NSString*>  *)titles
                            styles:(NSArray<__kindof NSNumber*>  *)popItemStyles
                      onSelectItem:(nullable HTmPopItemSelectBlock)selectItemCallBack;

/**
 弹回底部视图
 */
- (void)dismissBottomView;

@end


NS_ASSUME_NONNULL_END
