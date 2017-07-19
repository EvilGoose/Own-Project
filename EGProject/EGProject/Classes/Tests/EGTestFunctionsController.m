//
//  EGTestFunctionsController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGTestFunctionsController.h"

#import "EGControllerTransitionManager.h"
#import "EGControllerTransitionGestureHelper.h"

@interface EGTestFunctionsController ()
<
UIViewControllerTransitioningDelegate
>
/**Present*/
@property (strong, nonatomic)EGControllerTransitionGestureHelper *dismissHelper;

@end

@implementation EGTestFunctionsController

- (instancetype)init {
    if (self = [super init]) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.context = [NSObject new];
    }
    return self;
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
//    bar.hidden = YES;
    item.title = @"测试控制器";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    KEY_WINDOW.backgroundColor = [UIColor grayColor];
    
    self.dismissHelper = [[EGControllerTransitionGestureHelper alloc] initHelperWithDirection:GestureDirectionUp ForType:ControllerTransitionTypeDismiss];
    [self.dismissHelper addPanGestureToViewController:self];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"self context %@", self.context)
}

#pragma mark - transition modal

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [EGControllerTransitionManager transmisionWithTransisionType:ControllerTransitionTypePresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [EGControllerTransitionManager transmisionWithTransisionType:ControllerTransitionTypeDismiss];
}

 @end
