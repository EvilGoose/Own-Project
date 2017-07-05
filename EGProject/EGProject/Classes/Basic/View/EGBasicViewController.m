//
//  EGBasicViewController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGBasicViewController.h"

@interface EGBasicViewController ()

@end

@implementation EGBasicViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Title";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RANDOM_COLOR;
    NSLog(@"%@ %s", self.class, __func__)
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"%@ %s", self.class, __func__)
}

- (void)dealloc {
    NSLog(@"%@ %s", self.class, __func__)
}

@end
