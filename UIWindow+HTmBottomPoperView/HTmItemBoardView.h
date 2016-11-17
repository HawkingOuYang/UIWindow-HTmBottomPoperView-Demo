//
//  HTmItemBoardView.h
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 16/04/01.
//  Copyright (c) 2016年 OYXJ. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

/*! @brief  选项面板，上面有多个按钮，可供选择。
 *  @author OuYangXiaoJin on 2016.04.01
 *  @discussion 当前类主要用于放置按钮，并自动调整按钮的坐标。
 */
@interface HTmItemBoardView : UIView
/**
 当前面板上，多个按钮。
 */
@property (nonatomic, strong, readonly) NSMutableArray<__kindof UIView*>  *viewsArray;
/**
 当前面板上，多个按钮之间，在top方向的间隙。
 */
@property (nonatomic, assign, readonly) CGFloat marginTop;
/**
 当前面板上，多个按钮，最后一个按钮的最大Y坐标。
 */
@property (nonatomic, assign, readonly) CGFloat yFinalMaxBottomY;

/**
 *  在当前面板上 放置多个按钮，并自动调整按钮的Y坐标。
 *
 *  @param views     按钮们呀
 *  @param marginTop 按钮们在top方向间隙。
 *  @param flag      按钮们在之间的分割线。
 */
- (void)setViews:(NSArray<UIView *>  *)views marginTop:(float)marginTop showSeparatorLine:(BOOL)flag;
@end


NS_ASSUME_NONNULL_END
