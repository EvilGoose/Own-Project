//
//  UIScrollView+Direction.h
//  GFlight
//
//  Created by EG on 2017/6/12.
//  Copyright © 2017年 GDU. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,Direction) {
    DirectionNon = 0,
    DirectionUp,//向上滚动
    DirectionDown,//向下滚动
};

@interface UIScrollView (Direction)

@property (nonatomic, assign)Direction direction;

@property (nonatomic, assign) BOOL enableDirection;

@end
