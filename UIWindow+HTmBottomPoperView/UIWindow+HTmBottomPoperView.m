//
//  UIWindow+HTmBottomPoperView.m
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 15/2/5.
//  Copyright (c) 2015年 OYXJ. All rights reserved.
//

#import "UIWindow+HTmBottomPoperView.h"
#import "HTmDarkBackgroundView.h"//黑色蒙板

#import <objc/runtime.h>


#pragma mark - Constants
//! 关联属性 KEY  isHasPopBottomView --- 是否 已经从Window弹出底部视图
static const char *kPropertyKey_isHasPopBottomView      ="kPropertyKey_isHasPopBottomView";



#pragma mark - implementation
@implementation UIWindow (HTmBottomPoperView)

#pragma mark - PUBLIC

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
dismissBottomViewWhenTapBackGround:(BOOL)isDismiss
{
    [self private_popBottomViewWithHeadTitle: headTitle
                                      titles: titles
                                      styles: popItemStyles
                                onSelectItem: selectItemCallBack
          dismissBottomViewWhenTapBackGround: isDismiss];
}

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
          dismissBottomViewWhenTapBackGround:(BOOL)isDismiss
{
    [self private_popBottomViewWithHeadTitle: attributedHeadTitle
                                      titles: titles
                                      styles: popItemStyles
                                onSelectItem: selectItemCallBack
          dismissBottomViewWhenTapBackGround: isDismiss];
}


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
                      onSelectItem:(nullable HTmPopItemSelectBlock)selectItemCallBack
{
    [self popBottomViewWithHeadTitle:headTitle
                              titles:titles
                              styles:popItemStyles
                        onSelectItem:selectItemCallBack
  dismissBottomViewWhenTapBackGround:YES];//点击背景，是否关闭当前弹出视图，默认值 YES
}


/**
 弹回底部视图
 */
- (void)dismissBottomView
{
    if ([self isHasPopBottomView] == nil){
        
        return;
    }
    if ([self isHasPopBottomView] && [[self isHasPopBottomView] boolValue] == NO){
        
        return;
    }
    [self setIsHasPopBottomView:@(NO)];
    
    
    [UIView animateWithDuration:0.25f animations:^{
        
        [HTmPopSelectView sharedInstance].frame = CGRectMake(0, kScreenHeight,
                                                             CGRectGetWidth([HTmPopSelectView sharedInstance].frame),
                                                             CGRectGetHeight([HTmPopSelectView sharedInstance].frame));
        [HTmDarkBackgroundView sharedInstance].alpha = 0 ;
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            [[HTmDarkBackgroundView sharedInstance] removeFromSuperview];
            [[HTmPopSelectView sharedInstance] removeFromSuperview];
       
            [self setIsHasPopBottomView:nil];
        }
    }];
    
}


#pragma mark - private

/**
 *  根据参数弹出按钮列表
 *  @note  为了避免崩溃，请确保 aHeadTitle 的类型是：NSAttributedString 或者 NSString
 *
 *  @param aHeadTitle         头标题
 *  @param titles             按钮名称数组
 *  @param popItemStyles      按钮类型数组，元素是：用NSNumber包装的 HTmPopItemStyle。
 *  @param selectItemCallBack 点击事件回调
 *  @param isDismiss          点击背景，是否关闭当前弹出视图
 */
- (void)private_popBottomViewWithHeadTitle:(id)aHeadTitle
                                    titles:(NSArray<__kindof NSString*>  *)titles
                                    styles:(NSArray<__kindof NSNumber*>  *)popItemStyles
                              onSelectItem:(nullable HTmPopItemSelectBlock)selectItemCallBack
        dismissBottomViewWhenTapBackGround:(BOOL)isDismiss
{
    dispatch_block_t popViewBlock = ^{//弹出层的block
    
        //为了避免崩溃，请确保 aHeadTitle 的类型是：NSAttributedString 或者 NSString
        
        HTmPopSelectView *popSelectView = [HTmPopSelectView sharedInstance];
        
        if (    titles.count == popItemStyles.count
            &&
                popSelectView != nil
            )
        {
            HTmDarkBackgroundView *darkGlassView = [HTmDarkBackgroundView sharedInstance];
            darkGlassView.isDismissBottomViewWhenTapBackGround = isDismiss;
            [darkGlassView removeFromSuperview];
            [self addSubview:darkGlassView];
            
            popSelectView.popItemSelectBlock = selectItemCallBack;//block被copy
            
            //步骤一
            [popSelectView removeFromSuperview];
            //步骤二
            // 为了避免崩溃，请确保 aHeadTitle 的类型是：NSAttributedString 或者 NSString
            id headTitle = aHeadTitle;
            if ([headTitle isKindOfClass:[NSAttributedString class]]) {
                headTitle = (NSAttributedString *)aHeadTitle;
                [popSelectView configureItemsWithAttributedHeadTitle: headTitle
                                                              titles: titles
                                                              styles: popItemStyles];
            }
            else {
                headTitle = (NSString *)aHeadTitle;
                [popSelectView configureItemsWithHeadTitle: headTitle
                                                    titles: titles
                                                    styles: popItemStyles];
            }
            //步骤三
            [self private_showBottomView:popSelectView];
        }
    
    };//弹出层的block//
    
    
    if ([self isHasPopBottomView] && [[self isHasPopBottomView] boolValue] == YES) {//已经有一个弹出层
        [self dismissBottomView];//关闭，已经有的一个弹出层
        
        float delayInSeconds = 0.3;//关闭，已有的弹出层，需要时间0.25f；所以这里0.3 。
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            popViewBlock();//弹出层的block
        });
        
    }else{//没有 弹出层
        
        popViewBlock();//弹出层的block
    }
}

/**
 弹出底部视图
 */
- (void)private_showBottomView:(UIView *)bottomView
{
    [self setIsHasPopBottomView:@(YES)];
    
    
    [self addSubview:bottomView];
    [bottomView setFrame:CGRectMake(0, kScreenHeight, CGRectGetWidth(bottomView.frame), CGRectGetHeight(bottomView.frame))];
    [UIView animateWithDuration:0.25f animations:^{
        
        [HTmDarkBackgroundView sharedInstance].alpha = 0.4;
        [bottomView setFrame:CGRectMake(0, kScreenHeight -  CGRectGetHeight(bottomView.frame),
                                        CGRectGetWidth(bottomView.frame), CGRectGetHeight(bottomView.frame))];
        
    }];
}



#pragma mark - 关联对象

//!  关联 isHasPopBottomView 这个property。
- (NSNumber *)isHasPopBottomView
{
    return objc_getAssociatedObject(self,
                                    kPropertyKey_isHasPopBottomView);
}
//!  关联 isHasPopBottomView 这个property。
- (void)setIsHasPopBottomView:(NSNumber *)isHasPopBottomView
{
    objc_setAssociatedObject(self,
                             kPropertyKey_isHasPopBottomView,
                             isHasPopBottomView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
