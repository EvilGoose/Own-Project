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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(SCREEN_WIDTH, BANNER_HEIGHT);
        
    }else if (indexPath.section == 1) {
        return CGSizeMake(SCREEN_WIDTH, 80);
    
    }else {
        return CGSizeMake(SCREEN_WIDTH *.5 - 2, GOODS_CELL_HEIGHT);
        
    }
}

#pragma mark - data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
       
        case 1:
            return 1;

        case 2:
            if ([self.delegate respondsToSelector:@selector(setDataSourceOfGoodsShelf)]) {
                return [self.delegate setDataSourceOfGoodsShelf].count;
            }
            
        default:
            return 0;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        EGBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[EGBannerCollectionViewCell cellReusedID] forIndexPath:indexPath];
        cell.backgroundColor = DEBUG_COLOR;
        return cell;
        
    }else if (indexPath.section == 1) {
        EGCommentClassificationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[EGCommentClassificationCell cellReusedID] forIndexPath:indexPath];
        cell.backgroundColor = DEBUG_COLOR;
        return cell;

    }else {
        EGCommonGoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[EGCommonGoodsCell cellReusedID] forIndexPath:indexPath];
        cell.backgroundColor = DEBUG_COLOR;
        return cell;
    }
}


@end
