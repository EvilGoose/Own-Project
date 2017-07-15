//
//  EGControllerTransitionGestureHelper.h
//  EGProject
//
//  Created by EG on 2017/7/14.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EGControllerTransitionManager.h"

typedef enum : NSUInteger {
    GestureDirectionLeft,
    GestureDirectionRight,
    GestureDirectionUp,
    GestureDirectionDown
} GestureDirectionType;

typedef void(^callGestureBlock)();

@interface EGControllerTransitionGestureHelper : UIPercentDrivenInteractiveTransition

/**手势生效方向*/
@property (assign, nonatomic)GestureDirectionType gestureDirection;

/**Present*/
@property (copy, nonatomic)callGestureBlock callPresentBlock;

/**Dismiss*/
@property (copy, nonatomic)callGestureBlock callDismissBlock;

/**Push*/
@property (copy, nonatomic)callGestureBlock callPushBlock;

/**Pop*/
@property (copy, nonatomic)callGestureBlock callPopBlock;

- (instancetype)initHelperWithDirection:(GestureDirectionType)gestureDirection ForType:(ControllerTransitionType)transitionType;

- (void)addPanGestureToViewController:(UIViewController *)controller;

@end
