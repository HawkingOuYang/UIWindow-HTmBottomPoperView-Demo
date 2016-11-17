//
//  HTmItemBoardView.m
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 16/04/01.
//  Copyright (c) 2016年 OYXJ. All rights reserved.
//

#import "HTmItemBoardView.h"

@implementation HTmItemBoardView


#pragma mark - PUBLIC

/**
 *  在当前面板上 放置多个按钮，并自动调整按钮的Y坐标。
 *
 *  @param views     按钮们呀
 *  @param marginTop 按钮们在top方向间隙。
 *  @param flag      按钮们在之间的分割线。
 */
- (void)setViews:(NSArray<UIView *>  *)views marginTop:(float)marginTop showSeparatorLine:(BOOL)flag
{
    [self p_clearSubViews];
    
    
    _marginTop = marginTop ;
    _yFinalMaxBottomY = 0;
    
    // 按钮们之间的分割线。
    BOOL isShowSeparatorLine = flag;
    
    // 占位 0号
    UIView * zeroView = [[UIView alloc] initWithFrame:CGRectZero];
    _viewsArray = [[NSMutableArray alloc] init];
    
    [_viewsArray addObject:zeroView];
    for (UIView * v in views) {
        // 多个按钮
        [_viewsArray addObject:v];
        [self addSubview:v];
    }
    
    
    // 按钮 调整Y坐标
    UIView * view1 = nil;
    UIView * view2 = nil;
    for ( int i = 1 ; i< _viewsArray.count ; i++) {
        
         view1 = [_viewsArray objectAtIndex:i-1];
         view2 = [_viewsArray objectAtIndex:i];
        
        if (i == 1) {
            
            // 0号zeroView 很可能是 UILabel（相当于UIActionSheet的标题），可能有多行文字。
            CGFloat x = CGRectGetMinX(view1.frame);
            CGFloat y = CGRectGetMaxY(view1.frame);
            
            // 0号zeroView 下方的第一个按钮
            view2.frame = CGRectMake(x, y,
                                     CGRectGetWidth(view2.frame), CGRectGetHeight(view2.frame));
        } else {
            
            CGFloat x = CGRectGetMinX(view1.frame);
            CGFloat y = CGRectGetMaxY(view1.frame) + _marginTop;    // 多个按钮之间，在top方向的间隙。
            
            view2.frame = CGRectMake(x, y,
                                     CGRectGetWidth(view2.frame), CGRectGetHeight(view2.frame));
        }
        
        // 按钮们之间的分割线。
        if (isShowSeparatorLine) {
            CGRect lineFrame = view2.frame;
            lineFrame.origin.y = view2.frame.origin.y + view2.frame.size.height;
            lineFrame.size.height = 0.5;
            UIView *lineV = [[UIView alloc] initWithFrame:lineFrame];
            lineV.backgroundColor = [UIColor colorWithHexColorString:@"0x000000" alpha:0.10];
            [self addSubview:lineV];
        }
        
        
        _yFinalMaxBottomY = MAX(_yFinalMaxBottomY, CGRectGetMaxY(view2.frame)); // 选取最下面的位置Y
        
    }
    
    [self p_resizeSelfFrame];
}


#pragma mark - private

/**
 移除子视图
 */
- (void)p_clearSubViews
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

/**
 调整自身高度
 */
- (void)p_resizeSelfFrame{
    
    if(_viewsArray.count >1){
        
        CGRect tmpRect = self.frame;
        
        tmpRect.size.height = _yFinalMaxBottomY;
        
        self.frame = tmpRect;
        
    }else{
        
        CGRect tmpRect = self.frame;
        
        tmpRect.size.height = 0;
        
        self.frame = tmpRect;
    }
}

@end
