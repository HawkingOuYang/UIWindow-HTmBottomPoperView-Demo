//
//  HTmDarkBackgroundView.m
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 16/04/01.
//  Copyright (c) 2016年 OYXJ. All rights reserved.
//

#import "HTmDarkBackgroundView.h"

#import "UIWindow+HTmBottomPoperView.h"//从Window底部弹出View


static HTmDarkBackgroundView *sharedInstance = nil;
@implementation HTmDarkBackgroundView

#pragma mark - life cycle

+ (HTmDarkBackgroundView *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    if (self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)]) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.f;
        
        _isDismissBottomViewWhenTapBackGround = YES;
    }
    return self;
}


#pragma mark - touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*
    HTmPopSelectView *popView = [HTmPopSelectView sharedInstance];
    if (popView.popItemSelectBlock) {
        
        //取消
        int idx = (int)popView.titles.count - 1;
        
        popView.popItemSelectBlock(idx);
    }
    */
    
    if (_isDismissBottomViewWhenTapBackGround) {
        
        [self.window dismissBottomView];
    }
    
}

@end
