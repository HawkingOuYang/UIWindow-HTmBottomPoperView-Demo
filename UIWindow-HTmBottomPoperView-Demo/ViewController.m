//
//  ViewController.m
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 2016/11/17.
//  Copyright © 2016年 OYXJ. All rights reserved.
//

#import "ViewController.h"

#import "UIWindow+HTmBottomPoperView.h"


@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self demo];
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self demo];
}

- (void)demo
{
    NSArray *titles = @[NSLocalizedString(@"立即登录", nil), NSLocalizedString(@"暂不", nil)];
    NSArray *itemStyles = @[@(HTmPopItemStyle_BlackTextStyle),@(HTmPopItemStyle_CancelStyle)];
    
//    __weak __typeof(self) weakSelf = self;
    [self.view.window popBottomViewWithHeadTitle:NSLocalizedString(@"需要登录", nil) titles:titles styles:itemStyles onSelectItem:^(int itemIndex) {
//        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        if (itemIndex >= titles.count) {
            return;
        }
        
        if (itemIndex == titles.count - 1) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"点击了 按钮" message:@"暂不" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
            
        } else if (itemIndex == 0) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"点击了 按钮" message:@"立即登陆" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
            
        } else if (itemIndex == 1) {
            
        }
        
    } dismissBottomViewWhenTapBackGround:NO];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
