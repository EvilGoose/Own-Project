//
//  EGShoppingCarController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGShoppingCarController.h"

#import "EGShoppingCarRecommendCell.h"

#import "EGGoodsPresentController.h"

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
    
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(editShoppingCar) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc]initWithCustomView:editButton];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -20;
    
    item.rightBarButtonItems = @[spaceItem,editItem];


}

- (void)editShoppingCar {
//    NSLog(@"编辑购物车")
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[EGGoodsPresentController new] animated:YES];
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
        [_presentTableView registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
        _presentTableView.delegate = self;
        _presentTableView.dataSource = self;
    }
    return _presentTableView;
}

@end
