//
//  EGUserInfoCatalogueCell.m
//  EGProject
//
//  Created by EG on 2017/7/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGUserInfoCatalogueCell.h"

@interface EGUserInfoCatalogueCell()

/**头像*/
@property (strong, nonatomic)UIImageView *userIcon;

/**名称*/
@property (strong, nonatomic)UILabel *nameLabel;

/**等级*/
@property (strong, nonatomic)UIButton *stateButton;

/**二维码*/
@property (strong, nonatomic)UIImageView *codeImage;

/**订单*/
@property (strong, nonatomic)UILabel *listLable;

/**箭头*/
@property (strong, nonatomic)UIImageView *arrowImage;

/**选项板*/
@property (strong, nonatomic)UIView *optionsView;

@end

@implementation EGUserInfoCatalogueCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.userIcon];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.stateButton];
    [self.contentView addSubview:self.codeImage];
    [self.contentView addSubview:self.listLable];
    [self.contentView addSubview:self.arrowImage];
    [self.contentView addSubview:self.optionsView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark - lazy

- (UIImageView *)userIcon {
    if (!_userIcon) {
        _userIcon = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _userIcon;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    return _nameLabel;
}

- (UIButton *)stateButton {
    if (!_stateButton) {
        _stateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _stateButton;
}

- (UIImageView *)codeImage {
    if (!_codeImage) {
        _codeImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _codeImage;
}

- (UILabel *)listLable {
    if (!_listLable) {
        _listLable = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    return _listLable;
}

- (UIImageView *)arrowImage {
    if (!_arrowImage) {
        _arrowImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _arrowImage;
}

- (UIView *)optionsView {
    if (!_optionsView) {
        _optionsView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _optionsView;
}


@end
