//
//  EGOptionTextCollectionViewCell.m
//  EGProject
//
//  Created by EG on 2017/7/19.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGOptionTextCollectionViewCell.h"
#import <Masonry.h>

@implementation EGOptionTextCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(self);
    }];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

#pragma mark - lazy

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLabel.font = SYSTEM_FONT(10);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = GRAY_COLOR;
    }
    return _titleLabel;
}

@end
