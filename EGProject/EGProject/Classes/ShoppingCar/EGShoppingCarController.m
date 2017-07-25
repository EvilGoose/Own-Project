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
#import "EGOrderBar.h"

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

/**编辑按钮*/
@property (weak, nonatomic)UIButton *editShoppingCarButton;

/**下单bar*/
@property (strong, nonatomic)EGOrderBar *orderBar;

@end

@implementation EGShoppingCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self.view addSubview:self.presentTableView];
    [self.view addSubview:self.orderBar];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.presentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(NAVIGATION_BAR_HEIGHT);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
    }];
    
    [self.orderBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(ORDER_BAR_HEIGHT);
    }];
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    item.title = @"购物车";
    
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(editShoppingCar) forControlEvents:UIControlEventTouchUpInside];
    editButton.hidden = YES;
    self.editShoppingCarButton = editButton;
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
//    return self.choosedGoods.count + self.relatedGoods.count + 1;
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
//    if (indexPath.section < self.choosedGoods.count) {
//        
//    }else if (indexPath.section < self.choosedGoods.count + self.recommendGoods.count) {
//    
//    }else {
//    
//    }
    
    return cell;
}

#pragma mark - lazy

- (UITableView *)presentTableView {
    if (!_presentTableView) {
        _presentTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_presentTableView registerClass:EGShoppingCarRecommendCell.class forCellReuseIdentifier:NSStringFromClass(EGShoppingCarRecommendCell.class)];
        [_presentTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cellID"];
        _presentTableView.delegate = self;
        _presentTableView.dataSource = self;
    }
    return _presentTableView;
}

- (EGOrderBar *)orderBar {
    if (!_orderBar) {
        _orderBar = [[EGOrderBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ORDER_BAR_HEIGHT)];
        _orderBar.backgroundColor = DEBUG_COLOR;
    }
    return _orderBar;
}

@end
