//
//  EGUserController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//
#define CELL_ID @"UserControllerCellID"
#define TITLE_VIEW_HEIGHT 60
#define OPTIONS_SINGLE_ROW_HEIGHT 80

#import "EGUserController.h"
#import "EGAccountInfoView.h"
#import "EGOrderViewController.h"
#import "EGOrderOptionsTableViewCell.h"

@interface EGUserController ()
<
UITableViewDelegate,
UITableViewDataSource,
EGOrderOptionsTableViewCellDelegate
>

/**用户信息*/
@property (strong, nonatomic)EGAccountInfoView *infoView;

/**tableView*/
@property (strong, nonatomic)UITableView *tableView;

/**选中cell*/
@property (weak, nonatomic)__kindof UITableViewCell *selectedCell;


@end

@implementation EGUserController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.infoView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView).offset(-200);
        make.left.equalTo(self.tableView);
        make.width.equalTo(@SCREEN_WIDTH);
        make.height.equalTo(@200);
    }];
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    bar.hidden = YES;
}

- (void)orderOptionsTableViewCell:(EGOrderOptionsTableViewCell *)cell didSelected:(OrderCellActionStyle)type {
    self.selectedCell = cell;

}

#pragma mark - tableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self.navigationController pushViewController:[EGOrderViewController new] animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return TITLE_VIEW_HEIGHT;
    }else   {
        return OPTIONS_SINGLE_ROW_HEIGHT;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

#pragma mark - tableView data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else {
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[UITableViewCell cellReusedID]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        if (indexPath.section == 0) {
            cell.textLabel.text = @"我的订单";
        }else if (indexPath.row == 0) {
            cell.textLabel.text = @"我的服务";
        }
        return cell;
    }else {
        EGOrderOptionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[EGOrderOptionsTableViewCell cellReusedID]];
        cell.delegate = self;
        return cell;
    }
}

#pragma mark - lazy

- (EGAccountInfoView *)infoView {
    if (!_infoView) {
        _infoView = [[EGAccountInfoView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        _infoView.backgroundColor = DEBUG_COLOR;
//        __weak typeof(self) weakSelf = self;
        _infoView.callBack = ^(AccountInfoViewCallBackType type) {
            if (type == KGoToUserDetailInfoController) {
                NSLog(@"KGoToUserDetailInfoController")
            }else {
                NSLog(@"KGoToQRCodeController")
            }
        };
    }
    return _infoView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [_tableView registerClass:[EGOrderOptionsTableViewCell class] forCellReuseIdentifier:[EGOrderOptionsTableViewCell cellReusedID]];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:[UITableViewCell cellReusedID]];
        _tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
        _tableView.contentOffset = CGPointMake(0, -200);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
