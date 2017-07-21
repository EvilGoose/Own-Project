//
//  EGGoodsShelfBaseActionHandle.m
//  EGProject
//
//  Created by EG on 2017/7/21.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGGoodsShelfBaseActionHandle.h"


@implementation EGGoodsShelfBaseActionHandle

SINGLETON_IMPLEMENTATION(EGGoodsShelfBaseActionHandle)

#pragma mark - delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(goodsShelfChooseGoods:)]) {
        [self.delegate goodsShelfChooseGoods:indexPath];
    }
}

#pragma mark - data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCellID" forIndexPath:indexPath];
    cell.backgroundColor = DEBUG_COLOR;
    return cell;
}


@end
