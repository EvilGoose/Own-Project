//
//  EGHomeViewController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGHomeViewController.h"
#import "EGGoodsPresentController.h"
#import "EGScanViewController.h"
#import "EGMessagesViewController.h"
#import "EGSearchViewController.h"

#import "EGOptionsView.h"

#import "UIView+Extension.h"
#import "UIBarButtonItem+BarButtonItemWithButton.h"

#define OPTIONS_VIEW_HEIGHT 30

@interface EGHomeViewController ()

/**选项板*/
@property (strong, nonatomic)EGOptionsView *optionsView;

/**容器*/
@property (strong, nonatomic)UIScrollView *containerView;

@end

@implementation EGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubviews];
}

- (void)initSubviews {
    [self.view addSubview:self.optionsView];
    [self.view addSubview:self.containerView];
 }

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    UIButton *leftItemButton = [self setUpNavigationBarItemButton:@"扫一扫" fontSize:9
                                                        imageName:@"homepage_scanning_ic_18x18_"];
    UIButton *rightItemButton = [self setUpNavigationBarItemButton:@"消息" fontSize:10
                                                         imageName:@"homepage_messages_ic_18x18_"];

    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftItemButton];
    UIBarButtonItem *rightItem= [[UIBarButtonItem alloc]initWithCustomView:rightItemButton];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -20;
    
    item.leftBarButtonItems = @[spaceItem,leftItem];
    item.rightBarButtonItems = @[spaceItem, rightItem];
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setTitle:@"search" forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(presentSearchControllerAction) forControlEvents:UIControlEventTouchUpInside];
    item.titleView = searchButton;
    
    self.bottomSeperator.hidden = YES;
}

#pragma mark - private

- (UIButton *)setUpNavigationBarItemButton:(NSString *)title fontSize:(NSInteger)fontSize imageName:(NSString *)imageName {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 50, 50);
    button.center = self.view.center;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:SUB_TEXT_MAIN_COLOR forState:UIControlStateNormal];
    button.titleLabel.font = SYSTEM_FONT(fontSize);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, - button.imageView.width, - button.imageView.height, 0);
    button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.height - 5, 0, 0, - button.titleLabel.width);
    button.titleLabel.textColor= NSTextAlignmentLeft;

    [button addTarget:self action:@selector(navigationItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.highlighted = NO;
    [button setNeedsLayout];
    return button;
}

- (void)navigationItemClicked:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"扫一扫"]) {
         [self.navigationController pushViewController:[EGScanViewController new] animated:YES];

    }else {
         [self.navigationController pushViewController:[EGMessagesViewController new] animated:YES];
    }
}

- (void)presentSearchControllerAction {
    [self presentViewController:[EGSearchViewController new] animated:NO completion:nil];
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
        _containerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT + OPTIONS_VIEW_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - OPTIONS_VIEW_HEIGHT - TAB_BAR_HEIGHT)];
        _containerView.backgroundColor = DEBUG_COLOR;
    }
    return _containerView;
}

- (EGOptionsView *)optionsView {
    if (!_optionsView) {
        _optionsView = [[EGOptionsView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, OPTIONS_VIEW_HEIGHT)];
        _optionsView.backgroundColor = DEBUG_COLOR;
    }
    return _optionsView;
}

@end
