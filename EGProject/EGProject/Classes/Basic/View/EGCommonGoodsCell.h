//
//  EGCommonGoodsCell.h
//  EGProject
//
//  Created by EG on 2017/7/21.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CommonGoodsCellDelegate <NSObject>



@end

@interface EGCommonGoodsCell : UICollectionViewCell

/**delegate*/
@property (weak, nonatomic)id <CommonGoodsCellDelegate>delegate;

/**model list*/
@property (copy, nonatomic)NSArray *models;



@end
