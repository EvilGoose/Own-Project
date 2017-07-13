//
//  EGTestFunctionsController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGTestFunctionsController.h"
#import "EGControllerTransitionManager.h"

@interface EGTestFunctionsController ()
<
UIViewControllerTransitioningDelegate
>


@end

@implementation EGTestFunctionsController

- (instancetype)init {
    if (self = [super init]) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

#pragma mark - transition

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [EGControllerTransitionManager transmisionWithTransisionType:ControllerTransitionTypePresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [EGControllerTransitionManager transmisionWithTransisionType:ControllerTransitionTypeDismiss];
}

#pragma mark - touch

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
