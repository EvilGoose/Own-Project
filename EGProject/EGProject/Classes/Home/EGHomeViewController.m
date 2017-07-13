//
//  EGHomeViewController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGHomeViewController.h"
#import "EGGoodsPresentController.h"
#import "UIBarButtonItem+BarButtonItemWithButton.h"

@interface EGHomeViewController ()

@end

@implementation EGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    item.title = @"HOME";
    item.leftBarButtonItem = [UIBarButtonItem barButtonItemWithCustomImageName:@"" hightlightedImage:nil forTarget:self WithAction:@selector(scanAction)];
    item.rightBarButtonItem = [UIBarButtonItem barButtonItemWithCustomImageName:@"homepage_messages_ic_18x18_" hightlightedImage:nil forTarget:self WithAction:@selector(reviewMessageAction)];
    
}

- (void)scanAction {

}

- (void)reviewMessageAction {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[EGGoodsPresentController new] animated:YES];
}

@end
