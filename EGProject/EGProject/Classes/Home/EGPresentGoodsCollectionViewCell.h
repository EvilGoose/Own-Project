//
//  EGPresentGoodsCollectionViewCell.h
//  EGProject
//
//  Created by EG on 2017/7/21.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGPresentGoodsCollectionViewCell : UICollectionViewCell

+ (NSString *)cellResuedID;

- (void)setData:(NSString *)name;

@end
