//
//  EGNavigationController.m
//  EGProject
//
//  Created by EG on 2017/7/6.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGNavigationController.h"
#import "EGBasicViewController.h"

@interface EGNavigationController ()
<
UIGestureRecognizerDelegate
>

@end

@implementation EGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
        // 如果不是第一个push进来的子控制器，需要设置返回键
    if (self.childViewControllers.count > 0) {
        if ([viewController isKindOfClass:[EGBasicViewController class]]) {
            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [backButton setImage:[UIImage imageNamed:@"commoditydetail_detail_ic_back_2_nor_31x31_"] forState:UIControlStateNormal];
            [backButton sizeToFit];
            backButton.exclusiveTouch = YES;
            [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
            
            UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
            spaceItem.width = - 8;
            
            ((EGBasicViewController *)viewController).customNavigationItem.leftBarButtonItems = @[spaceItem, [[UIBarButtonItem alloc] initWithCustomView:backButton]];
        }
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)backAction {
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
        // 当子控制器的个数 > 1时手势生效
    return self.childViewControllers.count > 1;
}

    //支持旋转
-(BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

    //支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return self.topViewController.preferredStatusBarStyle;
}

@end
