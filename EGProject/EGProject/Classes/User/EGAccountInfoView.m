//
//  EGAccountInfoView.m
//  EGProject
//
//  Created by EG on 2017/7/19.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGAccountInfoView.h"

@interface EGAccountInfoView ()

/**头像*/
@property (strong, nonatomic)UIImageView *userIcon;

/**用户名*/
@property (strong, nonatomic)UILabel *nameLabel;

/**称号*/
@property (strong, nonatomic)UILabel *hornerLable;

/**二维码*/
@property (strong, nonatomic)UIButton *QRCodeButton;

@end

@implementation EGAccountInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.userIcon];
        [self addSubview:self.nameLabel];
        [self addSubview:self.hornerLable];
        [self addSubview:self.QRCodeButton];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userClickAction:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self).offset(CUSTOM_HORIZON_MARGIN);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self).offset(- CUSTOM_VERTICAL_MARGIN);
        make.left.mas_equalTo(self.userIcon.mas_right).offset(CUSTOM_HORIZON_MARGIN);
    }];
    
    [self.hornerLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self).offset(CUSTOM_VERTICAL_MARGIN);;
        make.left.mas_equalTo(self.userIcon.mas_right).offset(CUSTOM_HORIZON_MARGIN);
    }];
    
    [self.QRCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self).offset(- CUSTOM_HORIZON_MARGIN);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
}


#pragma mark - call back

- (void)userClickAction:(id)sender {
    if (!self.callBack) return;
    
    if (sender == self.QRCodeButton) {
        self.callBack(KGoToQRCodeController);
    }else {
        self.callBack(KGoToUserDetailInfoController);
    }
}

#pragma mark - lazy

- (UIImageView *)userIcon {
    if (!_userIcon) {
        _userIcon = [[UIImageView alloc]initWithFrame:CGRectZero];
        _userIcon.backgroundColor = DEBUG_COLOR;
    }
    return _userIcon;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _nameLabel.text = @"HELLO";
    }
    return _nameLabel;
}

- (UILabel *)hornerLable {
    if (!_hornerLable) {
        _hornerLable = [[UILabel alloc]initWithFrame:CGRectZero];
        _hornerLable.text = @"WORLD";
    }
    return _hornerLable;
}

- (UIButton *)QRCodeButton {
    if (!_QRCodeButton) {
        _QRCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_QRCodeButton setTitle:@"测试" forState:UIControlStateNormal];
        [_QRCodeButton addTarget:self action:@selector(userClickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _QRCodeButton;
}


@end
