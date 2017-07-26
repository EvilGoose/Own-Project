//
//  EGOrderViewController.m
//  EGProject
//
//  Created by EG on 2017/7/19.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#define OPTIONS_VIEW_HEIGHT 30

#import "EGOrderViewController.h"
#import "EGOptionsView.h"

@interface EGOrderViewController ()
<
OptionsViewDataSource,
OptionsViewDelegate
>

/**选项板*/
@property (strong, nonatomic)EGOptionsView *optionsView;

@end

@implementation EGOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.bottomSeperator.hidden = YES;
    [self.view addSubview:self.optionsView];
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    item.title = @"我的订单";
}

- (NSArray *)setDataSourceOptionView:(EGOptionsView *)optionsView {
    return @[@"全部", @"待付款", @"待发货", @"已发货", @"待评价"];
}

#pragma mark - delegate

- (CGFloat)optionsViewSetItemWidth:(EGOptionsView *)optionsView {
    return SCREEN_WIDTH * .2;
}

#pragma mark - lazy

- (EGOptionsView *)optionsView {
    if (!_optionsView) {
        _optionsView = [[EGOptionsView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, OPTIONS_VIEW_HEIGHT) direction:UICollectionViewScrollDirectionHorizontal];
        _optionsView.backgroundColor = DEBUG_COLOR;
        _optionsView.dataSource = self;
        _optionsView.delegate = self;
    }
    return _optionsView;
}
@end
