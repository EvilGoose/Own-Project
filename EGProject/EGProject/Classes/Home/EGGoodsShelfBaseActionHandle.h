//
//  EGGoodsShelfBaseActionHandle.h
//  EGProject
//
//  Created by EG on 2017/7/21.
//  Copyright © 2017年 EGMade. All rights reserved.
//  只处理UI事件

#import <Foundation/Foundation.h>

@protocol GoodsShelfBaseActionProtocal <NSObject>

    /**返回点击位置*/
- (void)goodsShelfChooseGoods:(NSIndexPath *)indexPath;

@required

	/**需要展示的横幅数据*/
- (NSArray *)setDataSourceOfBanner:(__kindof UICollectionView *)goodsShelf;

    /**需要展示的商品数据*/
- (NSArray *)setDataSourceOfGoodsShelf:(__kindof UICollectionView *)goodsShelf;

@end

@interface EGGoodsShelfBaseActionHandle : NSObject
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

SINGLETON_INTERFACE(EGGoodsShelfBaseActionHandle)

/**delegate*/
@property (weak, nonatomic)id<GoodsShelfBaseActionProtocal> delegate;

@end
