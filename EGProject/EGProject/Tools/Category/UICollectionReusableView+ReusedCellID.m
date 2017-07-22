//
//  UICollectionReusableView+ReusedCellID.m
//  EGProject
//
//  Created by EG on 2017/7/21.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "UICollectionReusableView+ReusedCellID.h"

@implementation UICollectionReusableView (ReusedCellID)

+ (NSString *)cellReusedID {
    return NSStringFromClass(self);
}

@end

@implementation UITableViewCell (ReusedCellID)

+ (NSString *)cellReusedID {
    return NSStringFromClass(self);
}

@end
