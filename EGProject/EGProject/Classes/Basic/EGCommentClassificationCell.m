//
//  EGCommentClassificationCell.m
//  EGProject
//
//  Created by EG on 2017/7/21.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGCommentClassificationCell.h"
#import <Masonry.h>

@interface EGCommentClassificationCell ()

/**标题*/
@property (strong, nonatomic)UILabel *mainTitleLabel;

/**副标题*/
@property (strong, nonatomic)UILabel *subTitleLabel;

@end

@implementation EGCommentClassificationCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.mainTitleLabel];
        [self addSubview:self.subTitleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.top.width.mas_equalTo(self);
        make.height.mas_equalTo(@20);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.bottom.width.mas_equalTo(self);
        make.height.mas_equalTo(@20);
    }];
}

#pragma mark - lazy

- (UILabel *)mainTitleLabel {
    if (!_mainTitleLabel) {
        _mainTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _mainTitleLabel.textAlignment = NSTextAlignmentCenter;
        _mainTitleLabel.font = SYSTEM_FONT(14);
        _mainTitleLabel.text = @"标题";
    }
    return _mainTitleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.font = SYSTEM_FONT(10);
        _subTitleLabel.text = @"副标题";
    }
    return _subTitleLabel;
}

@end
