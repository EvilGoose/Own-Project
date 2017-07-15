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
#import "EGCustomButton.h"

#define OPTIONS_VIEW_HEIGHT 30

@interface EGHomeViewController ()

/**容器*/
@property (strong, nonatomic)UIScrollView *containerView;

@end

@implementation EGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubviews];
}

- (void)initSubviews {
    [self.view addSubview:self.containerView];
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    item.title = @"HOME";
    
   UIBarButtonItem *leftBarButtonItem = [UIBarButtonItem barButtonItemWithCustomImageName:@"homepage_scanning_ic_18x18_" hightlightedImage:nil forTarget:self WithAction:@selector(scanAction)];
    [leftBarButtonItem setBarButtonItemName:@"扫一扫" forState:UIControlStateNormal];
    item.leftBarButtonItem = leftBarButtonItem;
    
    UIBarButtonItem *rightBarButtonItem = [UIBarButtonItem barButtonItemWithCustomImageName:@"homepage_messages_ic_18x18_" hightlightedImage:nil forTarget:self WithAction:@selector(reviewMessageAction)];
    item.rightBarButtonItem = rightBarButtonItem;
}

#pragma mark - user actions

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[EGGoodsPresentController new] animated:YES];
}

- (void)scanAction {
    
}

- (void)reviewMessageAction {
    
}

#pragma mark - lazy

- (UIScrollView *)containerView {
    if (!_containerView) {
        _containerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT + OPTIONS_VIEW_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - OPTIONS_VIEW_HEIGHT)];
        _containerView.backgroundColor = DEBUG_COLOR;
    }
    return _containerView;
}

@end
