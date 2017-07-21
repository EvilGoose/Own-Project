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

/**test Label*/
@property (strong, nonatomic)UILabel *testLabel;

/**顶部滑动*/
@property (strong, nonatomic)UIScrollView *banner;

/**商品展示*/
@property (strong, nonatomic)UICollectionView *goodsShelf;

/**数据源处理器*/
@property (weak, nonatomic)EGGoodsShelfBaseActionHandle *shelfHandle;

@end

@implementation EGPresentGoodsCollectionViewCell

+ (NSString *)cellResuedID {
    return NSStringFromClass(self);
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        [self addSubview:self.banner];
        [self addSubview:self.goodsShelf];
    }
    return self;
}

- (void)setData:(NSString *)name {
    self.testLabel.text = name;
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
    return @[@1, @2, @3, @4, @1, @2, @3, @4, @1, @2, @3, @4, @1, @2, @3, @4];
}

#pragma mark - lazy

- (UIScrollView *)banner {
    if (!_banner) {
        _banner = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    }
    return _banner;
}

- (UICollectionView *)goodsShelf {
    if (!_goodsShelf) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 10, 0);
        
        _goodsShelf = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _goodsShelf.backgroundColor = CLEAR_COLOR;
        _goodsShelf.showsHorizontalScrollIndicator = NO;
        [_goodsShelf registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:[self.shelfHandle cellReusedID]];
        [_goodsShelf registerClass:[EGBannerCollectionViewCell class] forCellWithReuseIdentifier:[EGBannerCollectionViewCell cellReusedID]];
        _goodsShelf.showsVerticalScrollIndicator = NO;
        _goodsShelf.dataSource = self.shelfHandle;
        _goodsShelf.delegate = self.shelfHandle;
    }
    return _goodsShelf;
}

- (UILabel *)testLabel {
    if (!_testLabel) {
        _testLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 300, 100, 40)];
    }
    return _testLabel;
}

- (EGGoodsShelfBaseActionHandle *)shelfHandle {
    EGGoodsShelfBaseActionHandle *handle = [EGGoodsShelfBaseActionHandle sharedInstanceEGGoodsShelfBaseActionHandle];
    handle.delegate = self;
    return handle;
}

@end
