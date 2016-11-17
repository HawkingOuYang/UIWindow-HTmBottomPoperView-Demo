//
//  HTmDarkBackgroundView.h
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 16/04/01.
//  Copyright (c) 2016年 OYXJ. All rights reserved.
//

#import <UIKit/UIKit.h>

/*! @brief 黑色蒙板
 *  @author OuYangXiaoJin on 2016.04.01
 */
@interface HTmDarkBackgroundView : UIView
+ (instancetype)sharedInstance;
/**
 点击背景，是否关闭当前弹出视图，默认值 YES
 */
@property (nonatomic, assign) BOOL isDismissBottomViewWhenTapBackGround;
@end
