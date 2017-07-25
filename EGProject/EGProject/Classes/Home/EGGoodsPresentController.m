//
//  EGGoodsPresentController.m
//  EGProject
//
//  Created by EG on 2017/7/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGGoodsPresentController.h"
#import "EGShareViewController.h"

@interface EGGoodsPresentController ()

/**顶部seg*/
@property (strong, nonatomic)UISegmentedControl *topSegmentedControl;

/**返回上一级*/
@property (strong, nonatomic)UIButton *backButton;

/**返回顶层*/
@property (strong, nonatomic)UIButton *backTopButton;

/**分享*/
@property (strong, nonatomic)UIButton *shareButton;

/**容器*/
@property (strong, nonatomic)UIScrollView *container;

@end

@implementation EGGoodsPresentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.container];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(NAVIGATION_BAR_HEIGHT);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    item.titleView = self.topSegmentedControl;
    item.backBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backButton];
    item.rightBarButtonItems = @[[[UIBarButtonItem alloc]initWithCustomView:self.shareButton],
                                 [[UIBarButtonItem alloc]initWithCustomView:self.backTopButton]];
}
 
- (void)userAction:(UIButton *)sender {
    if (sender == self.backButton) {
        [self.navigationController popViewControllerAnimated:YES];
    }else if (sender == self.backTopButton) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else {
        [self presentViewController:[EGShareViewController new] animated:NO completion:^{
            
        }];
    }
}


#pragma mark - lazy

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:
         [UIImage imageNamed:@"commoditydetail_detail_ic_back_nor_31x31_"]
                     forState:UIControlStateNormal];
        [_backButton setImage:
         [UIImage imageNamed:@"commoditydetail_detail_ic_back_pressed_31x31_"]
                     forState:UIControlStateHighlighted];
        
        [_backButton addTarget:self action:@selector(userAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UIButton *)backTopButton {
    if (!_backTopButton) {
        _backTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backTopButton setImage:
         [UIImage imageNamed:@"commoditydetail_ic_details_home_nor_31x31_"]
                        forState:UIControlStateNormal];
        [_backTopButton sizeToFit];
        [_backTopButton addTarget:self action:@selector(userAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backTopButton;
}

- (UIButton *)shareButton {
    if (!_shareButton) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setImage:
         [UIImage imageNamed:@"commoditydetail_detail_ic_share_nor_31x31_"]
                      forState:UIControlStateNormal];
        [_shareButton setImage:
         [UIImage imageNamed:@"commoditydetail_detail_ic_share_pressed_31x31_"]
                      forState:UIControlStateHighlighted];
        [_shareButton sizeToFit];
        [_shareButton addTarget:self action:@selector(userAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareButton;
}

- (UISegmentedControl *)topSegmentedControl {
    if (!_topSegmentedControl) {
        _topSegmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"商品", @"详情"]];
        _topSegmentedControl.tintColor = [UIColor grayColor];
        _topSegmentedControl.selectedSegmentIndex = 0;
        _topSegmentedControl.width = 100;
    }
    return _topSegmentedControl;
}

- (UIScrollView *)container {
    if (!_container) {
        _container = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _container.contentSize = CGSizeMake(SCREEN_WIDTH, self.view.height * 2);
        _container.backgroundColor = DEBUG_COLOR;
    }
    return _container;
}

@end
