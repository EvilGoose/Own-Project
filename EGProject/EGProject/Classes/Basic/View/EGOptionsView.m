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

/**cell尺寸*/
@property (assign, nonatomic)CGFloat cellWidth;
@property (assign, nonatomic)CGFloat cellHeight;

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
        make.size.mas_equalTo(CGSizeMake(self.cellWidth, BOTTOM_INDICATOR_HEIGHT));
    }];
}

- (void)setSelectedItem:(NSIndexPath *)indexPath {
    
}

- (void)optionsViewDidScrollRate:(CGFloat)rate {
    [self.bottomIndicator mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.optionsPad).offset(rate * self.optionsPad.contentSize.width);
    }];
}

#pragma mark - setter

- (void)setSelectedCell:(EGOptionTextCollectionViewCell *)selectedCell {
    if (_selectedCell) {
        _selectedCell.titleLabel.textColor = GRAY_COLOR;
    }

    _selectedCell = selectedCell;
    selectedCell.titleLabel.textColor = RED_COLOR;
}

- (void)setDelegate:(id<OptionsViewDelegate>)delegate {
    _delegate = delegate;
 
    if ([self.delegate respondsToSelector:@selector(optionsViewSetItemWidth:)]) {
        self.cellWidth = [self.delegate optionsViewSetItemWidth:self];
     }
    
    if ([self.delegate respondsToSelector:@selector(optionsViewSetItemHeight:)]) {
        self.cellHeight = [self.delegate optionsViewSetItemHeight:self];
    }
}

- (void)setDataSource:(id<OptionsViewDataSource>)dataSource {
    _dataSource = dataSource;
    
    if ([self.dataSource respondsToSelector:@selector(setDataSourceOptionView:)]) {
        self.data =  [self.dataSource setDataSourceOptionView:self];
    }
}

#pragma mark - delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedCell = (EGOptionTextCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    [self.bottomIndicator mas_updateConstraints:^(MASConstraintMaker *make) {
         make.left.mas_equalTo(self.optionsPad).offset(self.cellWidth * indexPath.item);
     }];

    if ([self.delegate respondsToSelector:@selector(optionsView:didSelected:)]) {
        [self.delegate optionsView:self didSelected:indexPath.item];
    }
}

#pragma mark - data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EGOptionTextCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[EGOptionTextCollectionViewCell cellReusedID] forIndexPath:indexPath];
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
        flowLayout.itemSize = CGSizeMake(self.cellWidth, self.cellHeight);
        
        _optionsPad = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.cellHeight - BOTTOM_INDICATOR_HEIGHT) collectionViewLayout:flowLayout];
        _optionsPad.backgroundColor = CLEAR_COLOR;
        _optionsPad.showsHorizontalScrollIndicator = NO;
        [_optionsPad registerClass:[EGOptionTextCollectionViewCell class] forCellWithReuseIdentifier:[EGOptionTextCollectionViewCell cellReusedID]];
        _optionsPad.dataSource = self;
        _optionsPad.delegate = self;
    }
    return _optionsPad;
}

- (UIImageView *)bottomIndicator {
    if (!_bottomIndicator) {
        _bottomIndicator = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.cellWidth, BOTTOM_INDICATOR_HEIGHT)];
        _bottomIndicator.backgroundColor = [UIColor redColor];
    }
    return _bottomIndicator;
}

- (CGFloat)cellWidth {
    if (_cellWidth) {
        return _cellWidth;
    }else {
        return CELL_WIDTH;
    }
}

- (CGFloat)cellHeight {
    if (_cellHeight) {
        return _cellHeight;
    }else {
        return self.height;
    }
}

@end
