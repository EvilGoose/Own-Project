//
//  EGSpecialTopCollectionTableViewCell.m
//  EGProject
//
//  Created by Fangweiyi on 23/07/2017.
//  Copyright © 2017 EGMade. All rights reserved.
//

#import "EGSpecialTopCollectionTableViewCell.h"

@interface EGSpecialTopCollectionTableViewCell ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>

/**选项版*/
@property (strong, nonatomic)UICollectionView *optionsView;

@end

@implementation EGSpecialTopCollectionTableViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.optionsView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.optionsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(self);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = DEBUG_COLOR;
    return cell;
}

#pragma mark - lazy

- (UICollectionView *)optionsView {
    if (!_optionsView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing= 4;
        flowLayout.minimumInteritemSpacing = 1;
        flowLayout.itemSize = CGSizeMake(140, self.height);

        _optionsView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _optionsView.backgroundColor = CLEAR_COLOR;
        _optionsView.showsHorizontalScrollIndicator = NO;
        _optionsView.showsVerticalScrollIndicator = NO;
        [_optionsView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"cellID"];
        _optionsView.dataSource = self;
        _optionsView.delegate = self;
    }
    return _optionsView;
}


@end
