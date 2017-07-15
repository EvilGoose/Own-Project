//
//  EGControllerTransitionManager.h
//  EGProject
//
//  Created by EG on 2017/7/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ControllerTransitionTypePresent,
    ControllerTransitionTypeDismiss,
    ControllerTransitionTypePush,
    ControllerTransitionTypePop
} ControllerTransitionType;

@interface EGControllerTransitionManager : NSObject
<UIViewControllerAnimatedTransitioning>

/**展示时间*/
@property (assign, nonatomic)CGFloat presentDuration;

/**消失时间*/
@property (assign, nonatomic)CGFloat dismissDuration;

+ (EGControllerTransitionManager *)transmisionWithTransisionType:(ControllerTransitionType)type;

@end
