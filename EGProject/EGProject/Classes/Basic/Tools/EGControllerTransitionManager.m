//
//  EGControllerTransitionManager.m
//  EGProject
//
//  Created by EG on 2017/7/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#define CARD_HEIGHT SCREEN_HEIGHT * .5

#import "EGControllerTransitionManager.h"
#import "UIView+Extension.h"

@interface EGControllerTransitionManager()

/**type*/
@property (assign, nonatomic)ControllerTransitionType type;

@end

@implementation EGControllerTransitionManager

+ (EGControllerTransitionManager *)transmisionWithTransisionType:(ControllerTransitionType)type {
    EGControllerTransitionManager *manager = [EGControllerTransitionManager new];
    manager.type = type;
    return manager;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case ControllerTransitionTypePresent:
            [self presentAnimation:transitionContext];
            break;
            
        case ControllerTransitionTypeDismiss:
            [self dismissAnimation:transitionContext];
            break;
            
        default:
            break;
    }
    
}

    //present动画逻辑代码
- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController * targetController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController * presentController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
        //snapshotViewAfterScreenUpdates可以对某个视图截图，我们采用对这个截图做动画代替直接对vc1做动画，因为在手势过渡中直接使用vc1动画会和手势有冲突，    如果不需要实现手势的话，就可以不是用截图视图了，大家可以自行尝试一下
    UIView *tempView = [presentController.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame =   presentController.view.frame;
    presentController.view.hidden = YES;
    
        //containerView管理着所有做转场动画的视图
    UIView *containerView = [transitionContext containerView];
        //将截图视图和vc2的view都加入ContainerView中
    [containerView addSubview:tempView];
    [containerView addSubview:targetController.view];
    
      targetController.view.frame = CGRectMake(0, containerView.height, containerView.width, CARD_HEIGHT);
 
    
        //开始动画 (transform)
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1.0 / 0.55 options:0 animations:^{
 
        targetController.view.transform = CGAffineTransformMakeTranslation(0, - CARD_HEIGHT);
        tempView.transform = CGAffineTransformMakeScale(0.85, 0.85);
        
    } completion:^(BOOL finished) {
            //必须标记转场的状态，系统才知道处理转场后的操作，否者认为一直转场
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
        if ([transitionContext transitionWasCancelled]) {
            presentController.view.hidden = NO;
            [tempView removeFromSuperview];
        }
        
    }];
}

    //dismiss动画逻辑代码
- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *presentController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *targetController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *tempView = [transitionContext containerView].subviews.firstObject;

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        presentController.view.transform = CGAffineTransformIdentity;
        tempView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
             [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
            targetController.view.hidden = NO;
            [tempView removeFromSuperview];
        }
    }];
}

@end
