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
} ControllerTransitionType;

@interface EGControllerTransitionManager : NSObject
<UIViewControllerAnimatedTransitioning>

+ (EGControllerTransitionManager *)transmisionWithTransisionType:(ControllerTransitionType)type;

@end
