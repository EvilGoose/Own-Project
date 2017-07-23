//
//  EGSpecialController.m
//  EGProject
//
//  Created by EG on 2017/7/14.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGSpecialController.h"

#import "EGSpecialTopCollectionTableViewCell.h"
#import "EGSpecialTableViewCell.h"

 @interface EGSpecialController ()
 <
 UITableViewDelegate,
 UITableViewDataSource
 >

 /**table view*/
@property (strong, nonatomic)UITableView *tableView;

@end

@implementation EGSpecialController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(NAVIGATION_BAR_HEIGHT);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT);
    }];
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    item.title = @"专题";
}

#pragma mark - table view height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    }
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 11;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [[EGSpecialTopCollectionTableViewCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    }
    EGSpecialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[EGSpecialTableViewCell cellReusedID]];
    return cell;
}

#pragma mark - lazy

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        [_tableView registerClass:EGSpecialTableViewCell.class forCellReuseIdentifier:[EGSpecialTableViewCell cellReusedID]];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate= self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
 
