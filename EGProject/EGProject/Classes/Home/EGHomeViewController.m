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

#import "EGRecommendController.h"
#import "EGTimeLimitViewController.h"
#import "EGCommonViewController.h"

#import "EGOptionsView.h"
#import "EGPresentGoodsCollectionViewCell.h"

#import "UIView+Extension.h"
#import "UIBarButtonItem+BarButtonItemWithButton.h"

@interface EGHomeViewController ()
<
OptionsViewDelegate,
OptionsViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource
>

/**选项板*/
@property (strong, nonatomic)EGOptionsView *optionsView;

/**展示容器*/
@property (strong, nonatomic)UICollectionView *presentContainerView;

/**控制器选项组*/
@property (copy, nonatomic)NSArray *controllerTitles;

@end

@implementation EGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubviews];
    [self initSubControllers];
}

- (void)initSubviews {
    [self.view addSubview:self.optionsView];
    [self.view addSubview:self.presentContainerView];
 }

- (void)initSubControllers {
    EGRecommendController *recommendController = [EGRecommendController new];
    [self addChildViewController:recommendController];
    
    EGTimeLimitViewController *timeLimitController = [EGTimeLimitViewController new];
    [self addChildViewController:timeLimitController];
    
    EGCommonViewController *commonController1 = [EGCommonViewController new];
    [self addChildViewController:commonController1];
    
    EGCommonViewController *commonController2 = [EGCommonViewController new];
    [self addChildViewController:commonController2];
    
    EGCommonViewController *commonController3 = [EGCommonViewController new];
    [self addChildViewController:commonController3];
    
    EGCommonViewController *commonController4 = [EGCommonViewController new];
    [self addChildViewController:commonController4];
    
    EGCommonViewController *commonController5 = [EGCommonViewController new];
    [self addChildViewController:commonController5];
    
    EGCommonViewController *commonController6 = [EGCommonViewController new];
    [self addChildViewController:commonController6];
    
    EGCommonViewController *commonController7 = [EGCommonViewController new];
    [self addChildViewController:commonController7];
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

- (void)scanAction {
    
}

- (void)reviewMessageAction {
    
}

#pragma mark - options view delegate & data source

- (void)optionsView:(EGOptionsView *)optionsView didSelected:(NSInteger)index {
    NSLog(@"%ld", (long)index)
    NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
    [self.presentContainerView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (NSArray *)setDataSourceOptionView:(EGOptionsView *)optionsView {
    return self.controllerTitles;
}

#pragma mark - collection view data source

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.optionsView optionsViewDidScrollRate:scrollView.contentOffset.x / scrollView.contentSize.width];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.controllerTitles.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EGPresentGoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[EGPresentGoodsCollectionViewCell cellReusedID] forIndexPath:indexPath];
    cell.backgroundColor = DEBUG_COLOR;
    [cell setData:self.controllerTitles[indexPath.item]];
    return cell;
}

#pragma mark - lazy 

- (UICollectionView *)presentContainerView {
    if (!_presentContainerView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH,  SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - OPTIONS_VIEW_HEIGHT - TAB_BAR_HEIGHT );
        
        _presentContainerView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT + OPTIONS_VIEW_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - OPTIONS_VIEW_HEIGHT - TAB_BAR_HEIGHT) collectionViewLayout:flowLayout];
        _presentContainerView.backgroundColor = CLEAR_COLOR;
        _presentContainerView.showsHorizontalScrollIndicator = NO;
        [_presentContainerView registerClass:[EGPresentGoodsCollectionViewCell class] forCellWithReuseIdentifier:[EGPresentGoodsCollectionViewCell cellReusedID]];
        _presentContainerView.pagingEnabled = YES;
        _presentContainerView.bounces = NO;
        _presentContainerView.dataSource = self;
        _presentContainerView.delegate = self;
    }
    return _presentContainerView;
}

- (EGOptionsView *)optionsView {
    if (!_optionsView) {
        _optionsView = [[EGOptionsView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, OPTIONS_VIEW_HEIGHT)];
        _optionsView.backgroundColor = DEBUG_COLOR;
        _optionsView.delegate = self;
        _optionsView.dataSource = self;
    }
    return _optionsView;
}

- (NSArray *)controllerTitles {
    return @[@"标题1", @"标题2", @"标题3", @"标题4", @"标题5", @"标题6", @"标题7", @"标题8", @"标题9", @"标题10", @"标题11"];
}

@end
