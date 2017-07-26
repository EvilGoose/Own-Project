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

/**scroll direction*/
@property (assign, nonatomic)UICollectionViewScrollDirection direction;

/**data*/
@property (copy, nonatomic)NSArray<NSString *> *data;

/**选中的cell*/
@property (weak, nonatomic)EGOptionTextCollectionViewCell *selectedCell;

/**cell尺寸*/
@property (assign, nonatomic)CGFloat cellWidth;
@property (assign, nonatomic)CGFloat cellHeight;

@end

@implementation EGOptionsView

- (instancetype)initWithFrame:(CGRect)frame direction:(UICollectionViewScrollDirection)direction {
    if (self = [super initWithFrame:frame]) {
        self.direction = direction;
        [self addSubview:self.optionsPad];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        NSAssert(!self, @"Could not initial with this method %s", __func__);
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.optionsPad mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(self);
    }];
    
    if (self.direction == UICollectionViewScrollDirectionHorizontal) {
        [self.bottomIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.optionsPad).offset(self.height - BOTTOM_INDICATOR_HEIGHT);
            make.left.mas_equalTo(self.optionsPad);
            make.size.mas_equalTo(CGSizeMake(self.cellWidth, BOTTOM_INDICATOR_HEIGHT));
        }];
        
    }else {
        [self.bottomIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(self.optionsPad);
            make.size.mas_equalTo(CGSizeMake(BOTTOM_INDICATOR_HEIGHT, self.cellHeight));
        }];
    }
    
}

- (void)optionsViewDidScrollRate:(CGFloat)rate {
    if (self.direction == UICollectionViewScrollDirectionHorizontal) {
        [self.bottomIndicator mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.optionsPad).offset(rate * self.optionsPad.contentSize.width);
        }];
        
    }else {
        [self.bottomIndicator mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.optionsPad).offset(rate * self.optionsPad.contentSize.height);
        }];
        
    }
}

#pragma mark - setter

- (void)setSelectedCell:(EGOptionTextCollectionViewCell *)selectedCell {
    if (_selectedCell) {
        _selectedCell.titleLabel.textColor = GRAY_COLOR;
        _selectedCell.titleLabel.font = SYSTEM_FONT(10);
    }

    _selectedCell = selectedCell;
    
    if (self.selectedBold) _selectedCell.titleLabel.font = SYSTEM_BOLD_FONT(12);
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
    
    if ([self.delegate respondsToSelector:@selector(optionsView:didSelected:)]) {
        [self.delegate optionsView:self didSelected:indexPath.item];
    }

    if (self.direction == UICollectionViewScrollDirectionHorizontal) {
        [self.bottomIndicator mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.optionsPad).offset(self.cellWidth * indexPath.item);
        }];
        
    }else {
        [self.bottomIndicator mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.optionsPad).offset(self.cellHeight * indexPath.item);
        }];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.cellWidth, self.cellHeight);
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
        flowLayout.scrollDirection = self.direction;
        flowLayout.itemSize = CGSizeMake(self.cellWidth, self.cellHeight);

        _optionsPad = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.cellHeight - BOTTOM_INDICATOR_HEIGHT) collectionViewLayout:flowLayout];
        _optionsPad.backgroundColor = CLEAR_COLOR;
        _optionsPad.showsHorizontalScrollIndicator = NO;
        _optionsPad.showsVerticalScrollIndicator = NO;
        [_optionsPad registerClass:[EGOptionTextCollectionViewCell class] forCellWithReuseIdentifier:[EGOptionTextCollectionViewCell cellReusedID]];
        [_optionsPad addSubview:self.bottomIndicator];
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
        return OPTIONS_VIEW_HEIGHT;
    }
}

@end
