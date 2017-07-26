//
//  EGOrderOptionsTableViewCell.h
//  EGProject
//
//  Created by Fangweiyi on 26/07/2017.
//  Copyright © 2017 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    OrderCellAction1 = 0,
    OrderCellAction2,
    OrderCellAction3,
    OrderCellAction4,
    OrderCellAction5,
} OrderCellActionStyle;


@class EGOrderOptionsTableViewCell;
@protocol EGOrderOptionsTableViewCellDelegate <NSObject>

- (void)orderOptionsTableViewCell:(EGOrderOptionsTableViewCell *)cell didSelected:(OrderCellActionStyle)type;

@end

@interface EGOrderOptionsTableViewCell : UITableViewCell

/**delegate*/
@property (weak, nonatomic)id<EGOrderOptionsTableViewCellDelegate> delegate;


@end

