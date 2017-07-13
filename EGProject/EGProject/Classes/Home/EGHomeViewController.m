//
//  EGHomeViewController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGHomeViewController.h"
#import "EGTestFunctionsController.h"

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
    EGTestFunctionsController *new = [[EGTestFunctionsController alloc]init];
    [self presentViewController:new animated:YES completion:nil];
 }

@end
