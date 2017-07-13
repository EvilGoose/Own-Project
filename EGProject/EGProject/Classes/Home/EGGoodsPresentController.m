//
//  EGGoodsPresentController.m
//  EGProject
//
//  Created by EG on 2017/7/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGGoodsPresentController.h"
#import "EGTestFunctionsController.h"

#import <Masonry.h>

@interface EGGoodsPresentController ()

/**返回上一级*/
@property (strong, nonatomic)UIButton *backButton;

/**返回顶层*/
@property (strong, nonatomic)UIButton *backTopButton;

/**分享*/
@property (strong, nonatomic)UIButton *shareButton;

@end

@implementation EGGoodsPresentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubviews];
}

- (void)initSubviews {
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.backTopButton];
    [self.view addSubview:self.shareButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.left.equalTo(self.view).offset(12);
     }];
    
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-12);
     }];
    
    [self.backTopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.right.equalTo(self.shareButton.mas_left).offset(-12);
     }];

}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    bar.hidden = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    EGTestFunctionsController *new = [[EGTestFunctionsController alloc]init];
    [self presentViewController:new animated:YES completion:nil];
}

- (void)userAction:(UIButton *)sender {
    if (sender == self.backButton) {
        [self.navigationController popViewControllerAnimated:YES];
    }else if (sender == self.backTopButton) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else {
        NSLog(@"Share action")
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
        [_shareButton addTarget:self action:@selector(userAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareButton;
}

@end
