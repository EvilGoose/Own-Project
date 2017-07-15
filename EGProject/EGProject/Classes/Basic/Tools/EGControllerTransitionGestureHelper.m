//
//  EGControllerTransitionGestureHelper.m
//  EGProject
//
//  Created by EG on 2017/7/14.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGControllerTransitionGestureHelper.h"
#import "UIView+Extension.h"

@interface EGControllerTransitionGestureHelper()

/**控制器*/
@property (weak, nonatomic)UIViewController *controller;

/**手势触发标记*/
@property (assign, nonatomic)BOOL gestureActMark;

/**转场样式*/
@property (assign, nonatomic)ControllerTransitionType transitionType;

@end

@implementation EGControllerTransitionGestureHelper

- (instancetype)initHelperWithDirection:(GestureDirectionType)gestureDirection ForType:(ControllerTransitionType)transitionType {
    if (self = [super init]) {
        self.gestureDirection = gestureDirection;
        self.transitionType = transitionType;
    }
    return self;
}

- (void)addPanGestureToViewController:(UIViewController *)controller {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(getPanGestureAction:)];
    self.controller = controller;
    [controller.view addGestureRecognizer:pan];
}

- (void)getPanGestureAction:(UIPanGestureRecognizer *)panGesture {
    CGFloat percent = 0;
    CGFloat delta = 0;
    
    switch (self.gestureDirection) {
        case GestureDirectionLeft:
            delta = - [panGesture translationInView:panGesture.view].x;
            break;
            
        case GestureDirectionRight:
            delta = [panGesture translationInView:panGesture.view].x;
            break;
            
        case GestureDirectionUp:
            delta = - [panGesture translationInView:panGesture.view].y;
            break;
        
        case GestureDirectionDown:
            delta = [panGesture translationInView:panGesture.view].y;
            break;
      
        default:
            break;
    }
    
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            [self startGesture];
            break;
            
        case UIGestureRecognizerStateChanged: {
            percent = delta / panGesture.view.width;
            [self updateInteractiveTransition:percent];
        }
            break;

        case UIGestureRecognizerStateEnded: {
            if (percent > .5) {
                [self finishInteractiveTransition];
            }else {
                [self cancelInteractiveTransition];
            }
            self.gestureActMark = NO;
        }
             break;

        default:
            break;
    }
}

- (void)startGesture {
    self.gestureActMark = YES;
    switch (self.transitionType) {
        case ControllerTransitionTypePresent:
            if (self.callPresentBlock) {
                self.callPresentBlock();
            }
            break;
            
        case ControllerTransitionTypeDismiss:
            [self.controller dismissViewControllerAnimated:YES completion:nil];
            if (self.callDismissBlock) {
                self.callDismissBlock();
            }
            break;
            
        case ControllerTransitionTypePush:
            if (self.callPushBlock) {
                self.callPushBlock();
            }
            break;
            
        case ControllerTransitionTypePop:
            [self.controller.navigationController popViewControllerAnimated:YES];
            if (self.callPopBlock) {
                self.callPopBlock();
            }
            break;

        default:
            break;
    }
}

@end
