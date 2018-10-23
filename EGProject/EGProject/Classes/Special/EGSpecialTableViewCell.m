//
//  EGSpecialTableViewCell.m
//  EGProject
//
//  Created by EG on 2017/7/22.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGSpecialTableViewCell.h"
#import <Masonry.h>

@interface EGSpecialTableViewCell ()

/**头像*/
@property (strong, nonatomic)UIImageView *icon;

/**名称*/
@property (strong, nonatomic)UILabel *nameLabel;

/**图片*/
@property (strong, nonatomic)UIImageView *contentImageView;

/**标题*/
@property (strong, nonatomic)UILabel *titleLabel;

/**正文预览*/
@property (strong, nonatomic)UILabel *previewLabel;

@end

@implementation EGSpecialTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.contentImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.previewLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.icon);
        make.left.mas_equalTo(self.icon.mas_right);
    }];
    
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.nameLabel.mas_bottom);
        make.height.mas_equalTo(130);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentImageView.mas_bottom);
        make.left.mas_equalTo(self.contentView);
    }];
    
    [self.previewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom);
        make.left.mas_equalTo(self.contentView);
    }];
}

#pragma mark - lazy

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _icon;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.text = @"名称";
    }
    return _nameLabel;
}

- (UIImageView *)contentImageView {
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _contentImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.text = @"主题";
    }
    return _titleLabel;
}

- (UILabel *)previewLabel {
    if (!_previewLabel) {
        _previewLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _previewLabel.numberOfLines = 2;
        _previewLabel.text = @"正文预览";
    }
    return _previewLabel;
}

@end
