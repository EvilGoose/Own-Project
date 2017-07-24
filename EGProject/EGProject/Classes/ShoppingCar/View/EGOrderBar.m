//
//  EGOrderBar.m
//  EGProject
//
//  Created by EG on 2017/7/24.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGOrderBar.h"
#import "UIImage+Extension.h"

@interface EGOrderBar ()

/**全选按钮*/
@property (strong, nonatomic)UIButton *allSelectButton;

/**总价label*/
@property (strong, nonatomic)UILabel *totalLabel;

/**下单按钮*/
@property (strong, nonatomic)UIButton *orderButton;

@end

@implementation EGOrderBar


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.allSelectButton];
        [self addSubview:self.totalLabel];
        [self addSubview:self.orderButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.allSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(CUSTOM_HORIZON_MARGIN);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.height.mas_equalTo(self.height);
        make.width.mas_equalTo(80);
        
    }];
    
    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.orderButton.mas_left).offset(-CUSTOM_HORIZON_MARGIN);
        make.centerY.mas_equalTo(self);
    }];
    
}

#pragma mark - lazy

- (UIButton *)allSelectButton {
    if (!_allSelectButton) {
        _allSelectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_allSelectButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_allSelectButton setTitle:@"全选" forState:UIControlStateNormal];
        [_allSelectButton setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    }
    return _allSelectButton;
}

- (UILabel *)totalLabel {
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _totalLabel.textColor = [UIColor redColor];
        _totalLabel.text = @"¥ 0.00";
    }
    return _totalLabel;
}

- (UIButton *)orderButton {
    if (!_orderButton) {
        _orderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_orderButton setTitle:@"下单" forState:UIControlStateDisabled];
        [_orderButton setTitle:@"下单" forState:UIControlStateNormal];
        _orderButton.backgroundColor = [UIColor yellowColor];
        [_orderButton setBackgroundImage:[UIImage initImageWithColor:[UIColor lightGrayColor] size:_orderButton.bounds.size] forState:UIControlStateDisabled];
        [_orderButton setBackgroundImage:[UIImage initImageWithColor:[UIColor redColor] size:_orderButton.bounds.size] forState:UIControlStateNormal];
        [_orderButton addTarget:self action:@selector(orderAction:) forControlEvents:UIControlEventTouchUpInside];
        _orderButton.enabled = NO;
    }
    return _orderButton;
}

- (void)orderAction:(UIButton *)sender {
    
}

@end
