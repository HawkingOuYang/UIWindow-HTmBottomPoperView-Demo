//
//  HTmPopSelectView.m
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 16/04/01.
//  Copyright (c) 2016年 OYXJ. All rights reserved.
//

#import "HTmPopSelectView.h"

#import "HTmItemBoardView.h"//选项面板，上面有多个按钮，可供选择。

#import "UIButton+HTmButtonStyle.h"//按钮样式
#import "UIWindow+HTmBottomPoperView.h"//从window弹出和关闭视图


// 选项面板（HTmItemBoardView缩写HTmIBV）
#define HTmIBV_PADDING_LEFT       0
#define HTmIBV_PADDING_RIGHT      0
#define HTmIBV_PADDING_TOP        0
#define HTmIBV_PADDING_BOTTOM     0


// 选项面板 headTitle 标题 top方向间隙
#define HTmIBV_HeadTitle_MARGIN_TOP     R(21)
// 选项面板 headTitle 标题 bottom方向间隙
#define HTmIBV_HeadTitle_MARGIN_BOTTOM  R(21)
// 选项面板 headTitle 标题内容 最大高度(不包括MARGIN_TOP、MARGIN_BOTTOM)
#define HTmIBV_HeadTitle_MAX_HEIGHT     R(250)
// 选项面板 headTitle 标题内容 高度(不包括MARGIN_TOP、MARGIN_BOTTOM)
#define HTmIBV_HeadTitle_HEIGHT         R(14+2)


// 选项面板 按钮高度
#define HTmIBV_BUTTON_HEIGHT      R(39)
// 选项面板 按钮top方向间隙
#define HTmIBV_BUTTON_MARGIN_TOP  0.5



#define HTmIBV_BUTTON_BASE_TAG    2016



static HTmPopSelectView *sharedInstance = nil;
@implementation HTmPopSelectView

#pragma mark - PUBLIC

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    if (self = [super init]) {
//        self.backgroundColor = [UIColor colorWithRed:245.0f / 255.0f green:245.0f / 255.0f blue:245.0f / 255.0f alpha:1.0f];
        self.backgroundColor = [UIColor whiteColor];
        
        _itemBoardView = [[HTmItemBoardView alloc] init];
        _itemBoardView.frame = CGRectMake(HTmIBV_PADDING_LEFT,
                                          HTmIBV_PADDING_TOP,
                                          kScreenWidth - (HTmIBV_PADDING_LEFT + HTmIBV_PADDING_RIGHT),
                                          0);//高度 由_itemBoardView上面 头标题 ＋ 按钮的个数 决定
//        _itemBoardView.backgroundColor = [UIColor colorWithRed:245.0f / 255.0f green:245.0f / 255.0f blue:245.0f / 255.0f alpha:1.0f];
        _itemBoardView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview: _itemBoardView];
    }
    return self;
}

/**
 *  根据参数配置弹出视图
 *
 *  @param headTitle    头标题，可以为nil
 *  @param titles       按钮标题数组，不能为nil。
 *  @param styles       样式数组，元素是 用NSNumber包装的HTmPopItemStyle。
 */
- (void)configureItemsWithHeadTitle:(NSString * _Nullable)headTitle
                             titles:(NSArray<__kindof NSString*>  *)titles
                             styles:(NSArray<__kindof NSNumber*>  *)styles
{
    [self private_configureItemsWithHeadTitle: headTitle
                                       titles: titles
                                       styles: styles];
}

/**
 *  根据参数配置弹出视图
 *
 *  @param attributedHeadTitle  头标题（富文本），可以为nil
 *  @param titles               按钮标题数组，不能为nil。
 *  @param styles               样式数组，元素是 用NSNumber包装的HTmPopItemStyle。
 */
- (void)configureItemsWithAttributedHeadTitle:(NSAttributedString * _Nullable)attributedHeadTitle
                                       titles:(NSArray<__kindof NSString*>  *)titles
                                       styles:(NSArray<__kindof NSNumber*>  *)styles
{
    [self private_configureItemsWithHeadTitle: attributedHeadTitle
                                       titles: titles
                                       styles: styles];
}


#pragma mark - private

/**
 *  根据参数配置弹出视图
 *  @note  为了避免崩溃，请确保 aHeadTitle 的类型是：NSAttributedString 或者 NSString
 *
 *  @param aHeadTitle   头标题，可以为nil
 *  @param titles       按钮标题数组，不能为nil。
 *  @param styles       样式数组，元素是 用NSNumber包装的HTmPopItemStyle。
 */
- (void)private_configureItemsWithHeadTitle:(id)aHeadTitle
                                     titles:(NSArray *)titles
                                     styles:(NSArray *)styles
{
    id headTitle = nil; //为了避免崩溃，请确保 aHeadTitle 的类型是：NSAttributedString 或者 NSString
    if ([aHeadTitle isKindOfClass:[NSAttributedString class]]) {
        headTitle = (NSAttributedString *)aHeadTitle;
    }
    else {
        headTitle = (NSString *)aHeadTitle;
    }
    
    BOOL isHeadTitleExist = [headTitle length] > 0 ? YES : NO;
    
    NSMutableArray *absoluteArray = [[NSMutableArray alloc] init];
    if (isHeadTitleExist) {
        [absoluteArray addObject:headTitle];
    }
    [absoluteArray addObjectsFromArray:titles];
    /*
     由 调用者 自己添加 "取消" 按钮
    [absoluteArray addObject:@"取消"];//这里将是“取消”按钮
     */
    
    int titleCount = (int)absoluteArray.count;
    CGFloat btnWidth = kScreenWidth - (HTmIBV_PADDING_LEFT + HTmIBV_PADDING_RIGHT);
    CGRect buttonItemFrame = CGRectMake(0, 0, btnWidth, HTmIBV_BUTTON_HEIGHT);
    CGRect headTitleFrame  = CGRectMake(0, 0, btnWidth,
                                        HTmIBV_HeadTitle_MARGIN_TOP+HTmIBV_HeadTitle_HEIGHT+HTmIBV_HeadTitle_MARGIN_BOTTOM);
    CGFloat viewHeight = 0;
    if (isHeadTitleExist) {
        // 有 头标题
        viewHeight =  (HTmIBV_PADDING_TOP + HTmIBV_PADDING_BOTTOM)
                        + HTmIBV_HeadTitle_MARGIN_TOP+HTmIBV_HeadTitle_HEIGHT+HTmIBV_HeadTitle_MARGIN_BOTTOM
                        + ((titleCount - 1 - 1) * HTmIBV_BUTTON_MARGIN_TOP)
                        + ((titleCount - 1) * HTmIBV_BUTTON_HEIGHT);
    }else{
        // 没有 头标题
        viewHeight =  (HTmIBV_PADDING_TOP + HTmIBV_PADDING_BOTTOM)
                        //+ HTmIBV_HeadTitle_MARGIN_TOP+HTmIBV_HeadTitle_HEIGHT+HTmIBV_HeadTitle_MARGIN_BOTTOM
                        //+ ((titleCount - 1 - 1) * HTmIBV_BUTTON_MARGIN_TOP)
                        + ((titleCount - 1      ) * HTmIBV_BUTTON_MARGIN_TOP)
                        //+ ((titleCount - 1) * HTmIBV_BUTTON_HEIGHT);
                        + ((titleCount    ) * HTmIBV_BUTTON_HEIGHT);
    }
    [self setFrame:CGRectMake(0, 0, kScreenWidth, viewHeight)];
    
    __block CGFloat viewHeightDelta = 0;//头标题headTitle可能是长文本，所以有高度差。
    
    NSMutableArray *itemArray = [[NSMutableArray alloc] init];
    [absoluteArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *titleString = obj;
        
        if (isHeadTitleExist && idx == 0) { // 头标题
            
            UILabel *headLabel = [[UILabel alloc] init];
            headLabel.textColor = [UIColor colorWithHex:0x000000 alpha:0.80];
            headLabel.textAlignment = NSTextAlignmentCenter;
            headLabel.font = [UIFont systemFontOfSize:R(15.0f)];
            
            CGSize txtSize = CGSizeZero;
            
            headLabel.numberOfLines = 0;
            if ([headTitle isKindOfClass:[NSAttributedString class]]) {
                
                headLabel.attributedText = (NSAttributedString *)headTitle;
                
                /**
                 How to calculate the height of an NSAttributedString with given width in iOS 6
                 http://stackoverflow.com/questions/14409897/how-to-calculate-the-height-of-an-nsattributedstring-with-given-width-in-ios-6
                 */
                NSAttributedString *attrStr = (NSAttributedString *)headTitle;
                CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(headTitleFrame.size.width, HTmIBV_HeadTitle_MAX_HEIGHT)
                                                    options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                    context:nil];
                //头标题headTitle可能是长文本
                txtSize = rect.size;
                
            }else if ([headTitle isKindOfClass:[NSString class]]){
                
                headLabel.text = (NSString *)headTitle;
                
                //头标题headTitle可能是长文本
//                txtSize = [StringUtil customTextSize:headLabel.font
//                                                text:headLabel.text
//                                                size:CGSizeMake(headTitleFrame.size.width, HTmIBV_HeadTitle_MAX_HEIGHT)];
                
            }else{
                
                NSLog(@"方法：private_configureItemsWithHeadTitle，忽略此项title");
                return;
            }
            
            headLabel.frame = headTitleFrame;
            
            viewHeightDelta = txtSize.height - HTmIBV_HeadTitle_HEIGHT;//头标题headTitle可能是长文本，所以有高度差。
            viewHeightDelta = MAX(0, viewHeightDelta);
            
            CGRect f = headLabel.frame;
            f.size.height = MAX(headTitleFrame.size.height,  headTitleFrame.size.height + viewHeightDelta);
            headLabel.frame = f;
            
            [itemArray addObject:headLabel];
            
        } else {
            
            NSInteger headTitleIndex = isHeadTitleExist ? 1 : 0;
            
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            item.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            
            [item setTitle:titleString forState:UIControlStateNormal];
            
            item.frame = buttonItemFrame;
            
            /*
             由 调用者 自己添加 "取消" 按钮
            if (idx == absoluteArray.count - 1) {
                
                [item cancelStyle];
                
            } else {
             */
                
                [self setButtonStyle:[styles[idx - headTitleIndex] integerValue] forButton:item];
            /*
             }
             */
            
            item.tag = HTmIBV_BUTTON_BASE_TAG + (idx - headTitleIndex);
            [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
            [itemArray addObject:item];
        }
        
    }];
    [_itemBoardView setViews:itemArray marginTop:HTmIBV_BUTTON_MARGIN_TOP showSeparatorLine:YES];
    
    //头标题headTitle可能是长文本，所以有高度差。
    [self setFrame:CGRectMake(0, 0, kScreenWidth, viewHeight + viewHeightDelta)];
}



#pragma mark - Action

/**
 按钮点击事件
 */
- (void)itemAction:(UIButton *)sender
{
    int itemIndex = (int)sender.tag - HTmIBV_BUTTON_BASE_TAG;
    
    if (_popItemSelectBlock) {
        _popItemSelectBlock(itemIndex);
    }
    [self.window dismissBottomView];
}


#pragma mark - helpers

/**
 设置按钮样式
 */
- (void)setButtonStyle:(HTmPopItemStyle)style forButton:(UIButton *)button
{
    switch (style) {
       
        case HTmPopItemStyle_CancelStyle:
            [button cancelStyle];
            break;
            
        case HTmPopItemStyle_BlackTextStyle:    //黑色文字
            [button systemBlackTextStyle];
            break;
        
        case HTmPopItemStyle_BlackDigitStyle:   //黑色数字
            [button systemBlackDigitStyle];
            break;
            
        case HTmPopItemStyle_BlueBackgroundStyle:
            [button systemBlueBackgroundStyle];
            break;
            
        case HTmPopItemStyle_HighLightSuffixStyle:
            [button highLightMailSuffixStyleWithString:button.titleLabel.text];
            break;
            
        case HTmPopItemStyle_BlueTextStyle:
            [button systemBlueTextStyle];
            break;
        
        case HTmPopItemStyle_GreenTextStyle:
            [button systemGreenTextStyle];
            break;
            
        case HTmPopItemStyle_RedTextStyle:
            [button systemRedTextStyle];
            break;
            
//  状态机，不需要 default 。
//        default:
//            break;

    }
}

@end
