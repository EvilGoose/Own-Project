//
//  UIConstants.h
//  EGProject
//
//  Created by EG on 2017/7/6.
//  Copyright © 2017年 EGMade. All rights reserved.
//  UI相关，形状，大小，颜色

#ifndef UIConstants_h
#define UIConstants_h

    //屏幕宽
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

    //屏幕高
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

    //屏幕bounds
#define SCREEN_BOUNDS ([UIScreen mainScreen].bounds)

    //RGBA 颜色
#define RGBA_COLOR(redNum, greenNum, blueNum, delta)  [UIColor colorWithRed:(redNum)/255.0 green:(greenNum)/255.0 blue:(blueNum)/255.0 alpha:(delta)]

    //随机色
#define RANDOM_COLOR [UIColor colorWithRed:(arc4random_uniform(256))/255.0 green:(arc4random_uniform(256))/255.0 blue:(arc4random_uniform(256))/255.0 alpha:1.0]

    //透明色
#define CLEAR_COLOR [UIColor clearColor]

    //导航栏高度
#define NAVIGATION_BAR_HEIGHT 64

#endif /* UIConstants_h */
