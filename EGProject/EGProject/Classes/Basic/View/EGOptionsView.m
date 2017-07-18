//
//  EGOptionsView.m
//  EGProject
//
//  Created by EG on 2017/7/18.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGOptionsView.h"
#import "UIView+Extension.h"
#import <Masonry.h>

@interface EGTextCollectionViewCell ()

/**标题*/
@property (strong, nonatomic)UILabel *titleLabel;

@end

@implementation EGTextCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
    }
    return self;
}

#pragma mark - lazy

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    }
    return _titleLabel;
}

@end



@interface EGOptionsView ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>
/**选项板*/
@property (strong, nonatomic)UICollectionView *optionsPad;

/**底部指示条*/
@property (strong, nonatomic)UIImageView *bottomIndicator;

@end

static NSString *cellID = @"optionsCellReuseIdentifier";
@implementation EGOptionsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.optionsPad];
        [self addSubview:self.bottomIndicator];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.optionsPad mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(self);
    }];
    
    [self.bottomIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(40, 2));
    }];
}

#pragma mark - delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = DEBUG_COLOR;
    return cell;
}

#pragma mark - lazy

- (UICollectionView *)optionsPad {
    if (!_optionsPad) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(60, self.height);
        
        _optionsPad = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.height) collectionViewLayout:flowLayout];
        _optionsPad.backgroundColor = CLEAR_COLOR;
        _optionsPad.showsHorizontalScrollIndicator = NO;
        [_optionsPad registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
        _optionsPad.dataSource = self;
        _optionsPad.delegate = self;
    }
    return _optionsPad;
}

- (UIImageView *)bottomIndicator {
    if (!_bottomIndicator) {
        _bottomIndicator = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 2)];
        _bottomIndicator.backgroundColor = [UIColor redColor];
    }
    return _bottomIndicator;
}

@end
