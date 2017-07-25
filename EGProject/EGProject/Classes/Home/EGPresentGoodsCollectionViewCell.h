//
//  EGPresentGoodsCollectionViewCell.h
//  EGProject
//
//  Created by EG on 2017/7/21.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

@class
EGPresentGoodsCollectionViewCell,
EGGoodsModel;

@protocol EGPresentGoodsCollectionViewCellDelegate <NSObject>

- (void)presentGoodsCollectionViewCell:(EGPresentGoodsCollectionViewCell *)cell selected:(EGGoodsModel *)model;

@end

@interface EGPresentGoodsCollectionViewCell : UICollectionViewCell

/**delegate*/
@property (weak, nonatomic)id<EGPresentGoodsCollectionViewCellDelegate> delegate;

@end
