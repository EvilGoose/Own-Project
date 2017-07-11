//
//  EGShoppingCarController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGShoppingCarController.h"

#import "EGShoppingCarRecommendCell.h"
#import "EGShoppingCarChoosedGoodsCell.h"

@interface EGShoppingCarController ()
<
UITableViewDataSource,
UITableViewDelegate
>

/**已购列表*/
@property (strong, nonatomic)NSMutableArray *choosedGoods;

/**相关列表*/
@property (strong, nonatomic)NSMutableArray *relatedGoods;

/**推荐列表*/
@property (strong, nonatomic)NSMutableArray *recommendGoods;

/**展示列表*/
@property (strong, nonatomic)UITableView *presentTableView;

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
//    NSLog(@"编辑购物车")
}

#pragma mark - request data

- (void)requestYouMayLikeList {
}

- (void)requestRelatedList {
    
}

#pragma mark - setter


#pragma mark - data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.choosedGoods.count + self.relatedGoods.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section < self.choosedGoods.count) {
        
    }else if (indexPath.section < self.choosedGoods.count + self.recommendGoods.count) {
    
    }else {
    
    }
    
    return nil;
}

#pragma mark - lazy

- (UITableView *)presentTableView {
    if (!_presentTableView) {
        _presentTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [_presentTableView registerClass:EGShoppingCarRecommendCell.class forCellReuseIdentifier:NSStringFromClass(EGShoppingCarRecommendCell.class)];
        [_presentTableView registerClass:EGShoppingCarChoosedGoodsCell.class forCellReuseIdentifier:NSStringFromClass(EGShoppingCarChoosedGoodsCell.class)];
        _presentTableView.delegate = self;
        _presentTableView.dataSource = self;
    }
    return _presentTableView;
}

@end
