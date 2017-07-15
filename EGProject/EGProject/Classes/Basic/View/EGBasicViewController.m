//
//  EGBasicViewController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#define Navigation_Title_Font [UIFont systemFontOfSize:18]
#define Navigation_Title_Color [UIColor blackColor]
#define Navigation_Background_Color RGBA_COLOR(222, 222, 222, 1)

#import "EGBasicViewController.h"
#import <Masonry.h>

@interface EGBasicViewController ()
<
UINavigationControllerDelegate
>

@end

@implementation EGBasicViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureDefaults];
    self.view.backgroundColor = RANDOM_COLOR;
    NSLog(@"%@ %s", self.class, __func__)
}

- (void)configureDefaults {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
        // 需要设置点颜色，否则push时右上角会显示一段黑色
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    
        // 必须设置这两个属性，否则会导致pop手势失效
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.hidden = YES;
    
        // 自定义的导航栏
    [self.view addSubview:self.customNavigationBar];
    self.customNavigationBar.items = @[self.customNavigationItem];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view bringSubviewToFront:self.customNavigationBar];
    [self configureNavigationItem:self.customNavigationItem NavigationBar:self.customNavigationBar];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.customNavigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(@(NAVIGATION_BAR_HEIGHT));
    }];
    
    [self.bottomSeperator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.customNavigationBar);
        make.height.equalTo(@(0.5));
    }];
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"%@ %s", self.class, __func__)
}

- (void)dealloc {
    NSLog(@"%@ %s", self.class, __func__)
}

#pragma mark - navigation animation delegate



#pragma mark - lazy

- (UINavigationItem *)customNavigationItem {
    if (!_customNavigationItem) {
        _customNavigationItem = [[UINavigationItem alloc] init];
    }
    return _customNavigationItem;
}

- (UINavigationBar *)customNavigationBar {
    if (!_customNavigationBar) {
        _customNavigationBar = [[UINavigationBar alloc]init];
        [_customNavigationBar setShadowImage:[UIImage new]];
        [_customNavigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [_customNavigationBar addSubview:self.bottomSeperator];
        _customNavigationBar.backgroundColor = Navigation_Background_Color;
        [_customNavigationBar setTitleTextAttributes:@{
                                                       NSFontAttributeName : Navigation_Title_Font,
                                                       NSForegroundColorAttributeName : Navigation_Title_Color,
                                                    }];
    }
    return _customNavigationBar;
}

- (UIImageView *)bottomSeperator {
    if (!_bottomSeperator) {
        _bottomSeperator = [UIImageView new];
        _bottomSeperator.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    }
    return _bottomSeperator;
}


@end
