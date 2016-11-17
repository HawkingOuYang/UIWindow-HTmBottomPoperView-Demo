//
//  HTmPopSelectView.h
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 16/04/01.
//  Copyright (c) 2016年 OYXJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HTmItemBoardView;


NS_ASSUME_NONNULL_BEGIN


#pragma mark - Types

typedef NS_OPTIONS(NSUInteger, HTmPopItemStyle) {
    HTmPopItemStyle_CancelStyle             = 1 << 0,
    HTmPopItemStyle_BlackTextStyle          = 1 << 1,   //黑色文字
    HTmPopItemStyle_BlackDigitStyle         = 1 << 2,   //黑色数字
    HTmPopItemStyle_BlueBackgroundStyle     = 1 << 3,
    HTmPopItemStyle_HighLightSuffixStyle    = 1 << 4,
    HTmPopItemStyle_BlueTextStyle           = 1 << 5,
    HTmPopItemStyle_GreenTextStyle          = 1 << 6,
    HTmPopItemStyle_RedTextStyle            = 1 << 7,
};

typedef void(^HTmPopItemSelectBlock)(int itemIndex);



#pragma mark - CLASS 

/*! @brief  可选面板视图
 *  @author OuYangXiaoJin on 2016.04.01
 */
@interface HTmPopSelectView : UIView
@property (nonatomic, strong, readonly) HTmItemBoardView *itemBoardView;
@property (nonatomic, strong, readonly) NSArray *titles;
@property (nonatomic, copy) HTmPopItemSelectBlock popItemSelectBlock;


/**
 *  根据参数配置弹出视图
 *
 *  @param headTitle    头标题，可以为nil
 *  @param titles       按钮标题数组，不能为nil。
 *  @param styles       样式数组，元素是 用NSNumber包装的HTmPopItemStyle。
 */
- (void)configureItemsWithHeadTitle:(NSString * _Nullable)headTitle
                             titles:(NSArray<__kindof NSString*>  *)titles
                             styles:(NSArray<__kindof NSNumber*>  *)styles;

/**
 *  根据参数配置弹出视图
 *
 *  @param attributedHeadTitle  头标题（富文本），可以为nil
 *  @param titles               按钮标题数组，不能为nil。
 *  @param styles               样式数组，元素是 用NSNumber包装的HTmPopItemStyle。
 */
- (void)configureItemsWithAttributedHeadTitle:(NSString * _Nullable)attributedHeadTitle
                                       titles:(NSArray<__kindof NSString*>  *)titles
                                       styles:(NSArray<__kindof NSNumber*>  *)styles;

/**
 单例实例
 */
+ (instancetype)sharedInstance;
@end


NS_ASSUME_NONNULL_END
