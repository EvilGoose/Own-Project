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
    switch (self.type) {
        case ControllerTransitionTypePresent:
            if (self.presentDuration) {
                return self.presentDuration;
            }
            
        case ControllerTransitionTypeDismiss:
            if (self.presentDuration) {
                return self.dismissDuration;
            }
            
        case ControllerTransitionTypePush:
            if (self.presentDuration) {
                return self.presentDuration;
            }
            
        case ControllerTransitionTypePop:
            if (self.presentDuration) {
                return self.dismissDuration;
            }
            
        default:
            return .5;
    }
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case ControllerTransitionTypePresent:
            [self presentAnimation:transitionContext];
            break;
            
        case ControllerTransitionTypeDismiss:
            [self dismissAnimation:transitionContext];
            break;
            
        case ControllerTransitionTypePush:
            [self pushAnimation:transitionContext];
            break;
            
        case ControllerTransitionTypePop:
            [self popAnimation:transitionContext];

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

    //Push动画逻辑
- (void)pushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
   
        //对tempView做动画，避免bug;
    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame = fromVC.view.frame;
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    fromVC.view.hidden = YES;
   
    [containerView insertSubview:toVC.view atIndex:0];
    
//    [tempView setAnchorPointTo:CGPointMake(0, 0.5)];
    CATransform3D transfrom3d = CATransform3DIdentity;
    transfrom3d.m34 = -0.002;
    containerView.layer.sublayerTransform = transfrom3d;
        //增加阴影
    CAGradientLayer *fromGradient = [CAGradientLayer layer];
    fromGradient.frame = fromVC.view.bounds;
    fromGradient.colors = @[(id)[UIColor blackColor].CGColor,
                            (id)[UIColor blackColor].CGColor];
    fromGradient.startPoint = CGPointMake(0.0, 0.5);
    fromGradient.endPoint = CGPointMake(0.8, 0.5);
    UIView *fromShadow = [[UIView alloc]initWithFrame:fromVC.view.bounds];
    fromShadow.backgroundColor = [UIColor clearColor];
    [fromShadow.layer insertSublayer:fromGradient atIndex:1];
    fromShadow.alpha = 0.0;
    [tempView addSubview:fromShadow];
    CAGradientLayer *toGradient = [CAGradientLayer layer];
    toGradient.frame = fromVC.view.bounds;
    toGradient.colors = @[(id)[UIColor blackColor].CGColor,
                          (id)[UIColor blackColor].CGColor];
    toGradient.startPoint = CGPointMake(0.0, 0.5);
    toGradient.endPoint = CGPointMake(0.8, 0.5);
    UIView *toShadow = [[UIView alloc]initWithFrame:fromVC.view.bounds];
    toShadow.backgroundColor = [UIColor clearColor];
    [toShadow.layer insertSublayer:toGradient atIndex:1];
    toShadow.alpha = 1.0;
    [toVC.view addSubview:toShadow];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        tempView.layer.transform = CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);
        fromShadow.alpha = 1.0;
        toShadow.alpha = 0.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            [tempView removeFromSuperview];
            fromVC.view.hidden = NO;
        }
    }];

}

    //Pop动画逻辑
- (void)popAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *presentController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *targetController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
 
    UIView *tempView = containerView.subviews.lastObject;
    [containerView addSubview:targetController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        tempView.layer.transform = CATransform3DIdentity;
        presentController.view.subviews.lastObject.alpha = 1.0;
        tempView.subviews.lastObject.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
            [tempView removeFromSuperview];
            targetController.view.hidden = NO;
        }
    }];
}

@end
