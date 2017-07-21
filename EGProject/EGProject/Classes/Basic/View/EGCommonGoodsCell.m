//
//  EGCommonGoodsCell.m
//  EGProject
//
//  Created by EG on 2017/7/21.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGCommonGoodsCell.h"
#import "EGGoodsModel.h"

@interface EGCommonGoodsCell ()

/**模型*/
@property (strong, nonatomic)EGGoodsModel *model;

/**商品图片*/
@property (strong, nonatomic)UIImageView *goodsImageView;

/**颜色*/
@property (strong, nonatomic)UILabel *avilableColorLabel;

/**介绍*/
@property (strong, nonatomic)UILabel *introduceLabel;

/**名称*/
@property (strong, nonatomic)UILabel *nameLabel;

/**限时*/
@property (strong, nonatomic)UILabel *limitReminder;

/**价格*/
@property (strong, nonatomic)UILabel *priceLabel;

@end

@implementation EGCommonGoodsCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self addSubview:self.goodsImageView];
    [self addSubview:self.avilableColorLabel];
    [self addSubview:self.introduceLabel];
    [self addSubview:self.nameLabel];
    [self addSubview:self.limitReminder];
    [self addSubview:self.priceLabel];
}

#pragma mark - setter

- (void)setModel:(EGGoodsModel *)model {
    _model = model;
    if (model.colorNumber > 0) {
        self.avilableColorLabel.hidden = NO;
    }
    
    if (model.reminder) {
        self.limitReminder.hidden = NO;
    }
}

#pragma mark - layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.width - 4, 130));
    }];

    [self.avilableColorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.goodsImageView).offset(2);
        make.size.mas_equalTo(CGSizeMake(20, 40));
    }];
    
    [self.introduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.goodsImageView);
    }];
 
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.introduceLabel.mas_bottom);
        make.left.right.mas_equalTo(self.goodsImageView);
        
    }];
    
        //    [self.limitReminder mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.goodsImageView.mas_bottom);
//        make.left.right.equalTo(self);
//    }];
//    
//
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom);
        make.left.right.equalTo(self.goodsImageView);
    }];
}

#pragma mark - lazy

- (UIImageView *)goodsImageView {
    if (!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        _goodsImageView.backgroundColor = DEBUG_COLOR;
    }
    return _goodsImageView;
}

- (UILabel *)avilableColorLabel {
    if (!_avilableColorLabel) {
        _avilableColorLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _avilableColorLabel.numberOfLines = 0;
        _avilableColorLabel.text = @"可选颜色";
        _avilableColorLabel.backgroundColor = DEBUG_COLOR;
    }
    return _avilableColorLabel;
}

- (UILabel *)introduceLabel {
    if (!_introduceLabel) {
        _introduceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _introduceLabel.numberOfLines = 1;
        _introduceLabel.text = @"介绍";
        _introduceLabel.backgroundColor = DEBUG_COLOR;
    }
    return _introduceLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _nameLabel.numberOfLines = 1;
        _nameLabel.text = @"名称";
        _nameLabel.backgroundColor = DEBUG_COLOR;
        _nameLabel.textColor = TEXT_MAIN_COLOR;
    }
    return _nameLabel;
}


- (UILabel *)limitReminder {
    if (!_nameLabel) {
        _limitReminder = [[UILabel alloc]initWithFrame:CGRectZero];
        _limitReminder.numberOfLines = 1;
        _limitReminder.backgroundColor = DEBUG_COLOR;
        _limitReminder.text = @"限时";
        _limitReminder.textColor = ORANGE_COLOR;
    }
    return _limitReminder;
}


- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _priceLabel.numberOfLines = 1;
        _priceLabel.text = @"价格";
        _priceLabel.backgroundColor = DEBUG_COLOR;
    }
    return _priceLabel;
}

@end
