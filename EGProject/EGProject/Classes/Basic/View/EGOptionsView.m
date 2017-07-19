//
//  EGOptionsView.m
//  EGProject
//
//  Created by EG on 2017/7/18.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGOptionsView.h"
#import "UIView+Extension.h"
#import "EGOptionTextCollectionViewCell.h"

#define BOTTOM_INDICATOR_HEIGHT 2
#define CELL_WIDTH 60

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
@property (weak, nonatomic)EGOptionTextCollectionViewCell *selectedCell;

@end

@implementation EGOptionsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.optionsPad addSubview:self.bottomIndicator];
        [self addSubview:self.optionsPad];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.optionsPad mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(self);
    }];
    
    [self.bottomIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.optionsPad).offset(self.height - BOTTOM_INDICATOR_HEIGHT);
        make.left.mas_equalTo(self.optionsPad);
        make.size.mas_equalTo(CGSizeMake(CELL_WIDTH, BOTTOM_INDICATOR_HEIGHT));
    }];
}

- (void)setSelectedCell:(EGOptionTextCollectionViewCell *)selectedCell {
    if (_selectedCell) {
        _selectedCell.titleLabel.textColor = GRAY_COLOR;
    }

    _selectedCell = selectedCell;
    selectedCell.titleLabel.textColor = RED_COLOR;
}

#pragma mark - delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedCell = (EGOptionTextCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [self.bottomIndicator mas_updateConstraints:^(MASConstraintMaker *make) {
         make.left.mas_equalTo(self.optionsPad).offset(CELL_WIDTH * indexPath.item);
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
    EGOptionTextCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[EGOptionTextCollectionViewCell cellResuedID] forIndexPath:indexPath];
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
        flowLayout.itemSize = CGSizeMake(CELL_WIDTH, self.height);
        
        _optionsPad = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.height - BOTTOM_INDICATOR_HEIGHT) collectionViewLayout:flowLayout];
        _optionsPad.backgroundColor = CLEAR_COLOR;
        _optionsPad.showsHorizontalScrollIndicator = NO;
        [_optionsPad registerClass:[EGOptionTextCollectionViewCell class] forCellWithReuseIdentifier:[EGOptionTextCollectionViewCell cellResuedID]];
        _optionsPad.dataSource = self;
        _optionsPad.delegate = self;
    }
    return _optionsPad;
}

- (UIImageView *)bottomIndicator {
    if (!_bottomIndicator) {
        _bottomIndicator = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CELL_WIDTH, BOTTOM_INDICATOR_HEIGHT)];
        _bottomIndicator.backgroundColor = [UIColor redColor];
    }
    return _bottomIndicator;
}

@end
