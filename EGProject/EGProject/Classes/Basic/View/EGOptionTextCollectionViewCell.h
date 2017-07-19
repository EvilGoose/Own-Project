//
//  EGOptionTextCollectionViewCell.h
//  EGProject
//
//  Created by EG on 2017/7/19.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGOptionTextCollectionViewCell : UICollectionViewCell

/**标题*/
@property (copy, nonatomic)NSString *title;

/**标题栏*/
@property (strong, nonatomic)UILabel *titleLabel;

/**重用标识*/
+ (NSString *)cellResuedID;

@end
