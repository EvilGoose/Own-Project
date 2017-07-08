//
//  EGShoppingCarController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGShoppingCarController.h"

@interface EGShoppingCarController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

/**已购列表*/
@property (strong, nonatomic)NSMutableArray *choosedGoods;

/**相关列表*/
@property (strong, nonatomic)NSMutableArray *relatedGoods;

/**推荐列表*/
@property (strong, nonatomic)NSMutableArray *recommendGoods;

/**展示列表*/
@property (strong, nonatomic)UICollectionView *presentTableView;

@end

@implementation EGShoppingCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    item.title = @"购物车";
    
    item.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editShoppingCar)];
}

- (void)editShoppingCar {
    NSLog(@"编辑购物车")
}

#pragma mark - setter


#pragma mark - data source


#pragma mark - lazy

@end
