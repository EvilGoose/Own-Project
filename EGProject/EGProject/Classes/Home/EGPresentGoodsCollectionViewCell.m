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
<
GoodsShelfBaseActionProtocal
>

/**商品展示*/
@property (strong, nonatomic)UICollectionView *goodsShelf;

/**数据源处理器*/
@property (weak, nonatomic)EGGoodsShelfBaseActionHandle *shelfHandle;

@end

@implementation EGPresentGoodsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.goodsShelf];
    }
    return self;
}
 
#pragma mark - delegate

- (void)goodsShelfChooseGoods:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath)
}

/**需要展示的横幅数据*/
- (NSArray *)setDataSourceOfBanner {
    return nil;
}

/**需要展示的商品数据*/
- (NSArray *)setDataSourceOfGoodsShelf {
    return @[@1, @2, @3, @4, @1, @2, @3, @4, @1, @2, @3, @4, @1, @2, @3, @4, @4];
}

#pragma mark - lazy

- (UICollectionView *)goodsShelf {
    if (!_goodsShelf) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _goodsShelf = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _goodsShelf.backgroundColor = CLEAR_COLOR;
        _goodsShelf.showsHorizontalScrollIndicator = NO;
        
        [_goodsShelf registerClass:EGBannerCollectionViewCell.class  forCellWithReuseIdentifier:[EGBannerCollectionViewCell cellReusedID]];
        [_goodsShelf registerClass:EGCommentClassificationCell.class forCellWithReuseIdentifier:[EGCommentClassificationCell cellReusedID]];
        [_goodsShelf registerClass:EGCommonGoodsCell.class forCellWithReuseIdentifier:[EGCommonGoodsCell cellReusedID]];
        
        _goodsShelf.showsVerticalScrollIndicator = NO;
        _goodsShelf.dataSource = self.shelfHandle;
        _goodsShelf.delegate = self.shelfHandle;
    }
    return _goodsShelf;
}

- (EGGoodsShelfBaseActionHandle *)shelfHandle {
    EGGoodsShelfBaseActionHandle *handle = [EGGoodsShelfBaseActionHandle sharedInstanceEGGoodsShelfBaseActionHandle];
    handle.delegate = self;
    return handle;
}

@end
