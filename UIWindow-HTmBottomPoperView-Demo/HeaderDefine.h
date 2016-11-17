//
//  HeaderDefine.h
//  UIWindow-HTmBottomPoperView-Demo
//
//  Created by OYXJ on 2016/11/17.
//  Copyright © 2016年 OYXJ. All rights reserved.
//

#ifndef HeaderDefine_h
#define HeaderDefine_h


#define kScreenWidth        CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight       CGRectGetHeight([UIScreen mainScreen].bounds)


/*
 因为 此宏定义，可能影响 UI绘制性能，
 所以 改用 static变量，
 详见 PlatformUtil这个类， #define R(x)  ([PlatformUtil screenScaleForRetina])*(x)
*/
 //----- 根据屏幕宽度比例；按比例缩放坐标 --- begin -----//
 // 使用示范：R(20)
 // 含义：R 指 针对Retina进行缩放坐标； 20 指 坐标值。
 //----- 屏幕宽度，考虑到 屏幕旋转 -----//
 #define Rx_min_SCREEN_WIDTH        MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
 //----- 根据屏幕宽度比例；按比例缩放坐标 -----//
 #define Rx_SCREEN_SCALE        (Rx_min_SCREEN_WIDTH)>320?Rx_min_SCREEN_WIDTH/320.f:1.f
 #define R(x)  (Rx_SCREEN_SCALE)*(x)
 //----- 根据屏幕宽度比例；按比例缩放坐标 --- end -----//




#define SystemRed                [UIColor colorWithHexColorString:@"0xff717f"]
#define SystemGreen              [UIColor colorWithHexColorString:@"0x52cd9e"]
#define SystemDeepGreen          [UIColor colorWithHexColorString:@"0x42a47e"]
#define SystemBlue               [UIColor colorWithHexColorString:@"0x38bbcc"]
#define SystemGray               [UIColor colorWithHexColorString:@"0xcccccc"]
#define SystemBackGroundGray     [UIColor colorWithHexColorString:@"0xF9F9F9"]
// 辅助色
#define SystemLightGreen         [UIColor colorWithHexColorString:@"0x71f4c1"]
#define SystemDeepRed            [UIColor colorWithHexColorString:@"0xf93f52"]
#define SystemPressedRed         [UIColor colorWithHexColorString:@"0xcc5a66"]
#define SystemOrange             [UIColor colorWithHexColorString:@"0xfe8d2e"]
#define SystemYellow             [UIColor colorWithHexColorString:@"0xfc8d3c"]
#define SystemSkyBlue            [UIColor colorWithHexColorString:@"0x12cbdc"]





#endif /* HeaderDefine_h */
