//
//  EGSelectController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGSelectController.h"
#import "EGOfficialRecommendController.h"

#import "EGOptionsView.h"
#import "EGSearchBar.h"


@interface EGSelectController ()
<
OptionsViewDelegate,
OptionsViewDataSource,
UISearchBarDelegate
>
/**左边选项栏*/
@property (strong, nonatomic)EGOptionsView *leftVerticalOptionsView;

/**右边展示栏*/
@property (strong, nonatomic)UIScrollView *rightPresentSpecialView;

@end

@implementation EGSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view.
    [self.view addSubview:self.leftVerticalOptionsView];
    [self.view addSubview:self.rightPresentSpecialView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self configureNavigationTitleView];
}

- (void)configureNavigationTitleView {
    EGSearchBar *searchBar = [[EGSearchBar alloc]initWithFrame:CGRectMake(0, CUSTOM_VERTICAL_MARGIN, SCREEN_WIDTH - 2 * CUSTOM_HORIZON_MARGIN, SEARCH_BAR_HEIGHT)];
    searchBar.contentMode = UIViewContentModeBottom;
    searchBar.placeholder = @"点击搜索";
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
}

#pragma mark - search bar delegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    EGOfficialRecommendController *viewController = [EGOfficialRecommendController new];
    [self presentViewController:viewController animated:YES completion:^{
        [viewController testBlock:^{
            NSLog(@"Hello world")
        }];
    }];
}


#pragma mark - options view

- (CGFloat)optionsViewSetItemWidth:(EGOptionsView *)optionsView {
    return OPTIONS_VIEW_WIDTH;
}

- (CGFloat)optionsViewSetItemHeight:(EGOptionsView *)optionsView {
    return 40;
}

- (void)optionsView:(EGOptionsView *)optionsView didSelected:(NSInteger)index {
    NSLog(@"%ld", index)
}

- (NSArray *)setDataSourceOptionView:(EGOptionsView *)optionsView {
    return @[@"标题1", @"标题2", @"标题3", @"标题4", @"标题5", @"标题6", @"标题7", @"标题8", @"标题9", @"标题10", @"标题11" ,@"标题1", @"标题2", @"标题3", @"标题4", @"标题5", @"标题6", @"标题7", @"标题8", @"标题9", @"标题10"];
}

#pragma mark - lazy

- (EGOptionsView *)leftVerticalOptionsView {
    if (!_leftVerticalOptionsView) {
        _leftVerticalOptionsView = [[EGOptionsView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, OPTIONS_VIEW_WIDTH, SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT) direction:UICollectionViewScrollDirectionVertical];
        _leftVerticalOptionsView.backgroundColor = DEBUG_COLOR;
        _leftVerticalOptionsView.selectedBold = YES;
        _leftVerticalOptionsView.delegate = self;
        _leftVerticalOptionsView.dataSource = self;
    }
    return _leftVerticalOptionsView;
}

- (UIScrollView *)rightPresentSpecialView {
    if (!_rightPresentSpecialView) {
        _rightPresentSpecialView = [[UIScrollView alloc] initWithFrame:CGRectMake(OPTIONS_VIEW_WIDTH, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH - OPTIONS_VIEW_WIDTH, SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT)];
        _rightPresentSpecialView.contentSize = CGSizeMake(SCREEN_WIDTH - OPTIONS_VIEW_WIDTH, (SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT) * 21);
        _rightPresentSpecialView.backgroundColor = DEBUG_COLOR;
        _rightPresentSpecialView.pagingEnabled = YES;
    }
    return _rightPresentSpecialView;
}

@end
