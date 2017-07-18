//
//  EGSearchViewController.m
//  EGProject
//
//  Created by EG on 2017/7/18.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGSearchViewController.h"

@interface EGSearchViewController ()

@end

@implementation EGSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    item.title = @"搜索";
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton.titleLabel setFont:SYSTEM_FONT(12)];
    [cancelButton setTitleColor:SUB_TEXT_MAIN_COLOR forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
    
    item.rightBarButtonItems = @[[[UIBarButtonItem alloc]initWithCustomView:cancelButton]];
    
}

- (void)dismissAction {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissAction];
}

@end
