//
//  EGPresentGoodsCollectionViewCell.m
//  EGProject
//
//  Created by EG on 2017/7/21.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGPresentGoodsCollectionViewCell.h"
#import "EGGoodsShelfBaseActionHandle.h"

@interface EGPresentGoodsCollectionViewCell ()

/**test Label*/
@property (strong, nonatomic)UILabel *testLabel;

/**顶部滑动*/
@property (strong, nonatomic)UIScrollView *banner;

/**商品展示*/
@property (strong, nonatomic)UICollectionView *goodsShelf;

@end

@implementation EGPresentGoodsCollectionViewCell

+ (NSString *)cellResuedID {
    return NSStringFromClass(self);
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.testLabel];
    }
    return self;
}

- (void)setData:(NSString *)name {
    self.testLabel.text = name;
}

#pragma mark - lazy

- (UIScrollView *)banner {
    if (!_banner) {
        
    }
    return _banner;
}

- (UICollectionView *)goodsShelf {
    if (!_goodsShelf) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH,  200);
        
        _goodsShelf = [[UICollectionView alloc]initWithFrame:CGRectMake(0, BANNER_HEIGHT + OPTIONS_VIEW_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - OPTIONS_VIEW_HEIGHT - BANNER_HEIGHT - TAB_BAR_HEIGHT) collectionViewLayout:flowLayout];
        _goodsShelf.backgroundColor = CLEAR_COLOR;
        _goodsShelf.showsHorizontalScrollIndicator = NO;
        [_goodsShelf registerClass:[UICollectionView class] forCellWithReuseIdentifier:[EGPresentGoodsCollectionViewCell cellResuedID]];
        _goodsShelf.dataSource = [EGGoodsShelfBaseActionHandle sharedInstanceEGGoodsShelfBaseActionHandle];
        _goodsShelf.delegate = [EGGoodsShelfBaseActionHandle sharedInstanceEGGoodsShelfBaseActionHandle];
      }
    return _goodsShelf;
}

- (UILabel *)testLabel {
    if (!_testLabel) {
        _testLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 300, 100, 40)];
    }
    return _testLabel;
}

@end
