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
@property (copy, nonatomic)NSString *title;

/**标题栏*/
@property (strong, nonatomic)UILabel *titleLabel;

@end

@implementation EGTextCollectionViewCell

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



@interface EGOptionsView ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>
/**选项板*/
@property (strong, nonatomic)UICollectionView *optionsPad;

/**底部指示条*/
@property (strong, nonatomic)UIImageView *bottomIndicator;

/**data*/
@property (copy, nonatomic)NSArray<NSString *> *data;

/**选中的cell*/
@property (weak, nonatomic)EGTextCollectionViewCell *selectedCell;

@end

static NSString *cellID = @"optionsCellReuseIdentifier";
@implementation EGOptionsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.optionsPad];
        [self.optionsPad addSubview:self.bottomIndicator];
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

- (void)setSelectedCell:(EGTextCollectionViewCell *)selectedCell {
    if (_selectedCell) {
        _selectedCell.titleLabel.textColor = GRAY_COLOR;
    }

    _selectedCell = selectedCell;
    selectedCell.titleLabel.textColor = RED_COLOR;
}

#pragma mark - delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedCell = (EGTextCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [self.bottomIndicator mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.optionsPad).offset(indexPath.item * 40);
        make.bottom.mas_equalTo(self.selectedCell);
        make.width.mas_equalTo(self.selectedCell.titleLabel.width);
        make.height.mas_equalTo(2);
    }];

    if ([self.delegate respondsToSelector:@selector(optionsView:didSelected:)]) {
        [self.delegate optionsView:self didSelected:indexPath.item];
    }
}

#pragma mark - data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.delegate respondsToSelector:@selector(setDataSourceOptionView:)]) {
        self.data =  [self.dataSource setDataSourceOptionView:self];
        return self.data.count;
    }
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EGTextCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = DEBUG_COLOR;
    cell.title = self.data[indexPath.item];
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
        [_optionsPad registerClass:[EGTextCollectionViewCell class] forCellWithReuseIdentifier:cellID];
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
