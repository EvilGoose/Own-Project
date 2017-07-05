//
//  EGRootTabController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGRootTabController.h"

#import "EGHomeViewController.h"
#import "EGSelectController.h"
#import "EGRecommendController.h"
#import "EGShoppingCarController.h"
#import "EGUserController.h"

@interface EGRootTabController ()

@end

@implementation EGRootTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubcontrollers];
}

- (void)initSubcontrollers {
    [self addChildViewController:[EGHomeViewController new]];
    [self addChildViewController:[EGSelectController new]];
    [self addChildViewController:[EGRecommendController new]];
    [self addChildViewController:[EGShoppingCarController new]];
    [self addChildViewController:[EGUserController new]];
}

@end
