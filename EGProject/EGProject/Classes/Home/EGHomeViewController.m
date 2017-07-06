//
//  EGHomeViewController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGHomeViewController.h"

@interface EGHomeViewController ()

@end

@implementation EGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    item.title = @"HOME";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    EGBasicViewController *new = [EGBasicViewController new];
    [self.navigationController pushViewController:new animated:YES];
}

@end
