//
//  EGShoppingCarChoosedGoodsCell.h
//  EGProject
//
//  Created by EG on 2017/7/8.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGGoodsView : UIView

@end


@protocol EGShoppingCarCellActionDelegate <NSObject>

@end

@interface EGShoppingCarChoosedGoodsCell : UITableViewCell


/**delegate*/
@property (weak, nonatomic)id <EGShoppingCarCellActionDelegate>delegate;


/**model list*/
@property (copy, nonatomic)NSArray *models;

@end
