//
//  EGOptionsView.h
//  EGProject
//
//  Created by EG on 2017/7/18.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EGOptionsView;

@protocol OptionsViewDelegate <NSObject>

@optional

- (CGFloat)optionsViewSetItemHeight:(EGOptionsView *)optionsView;

- (CGFloat)optionsViewSetItemWidth:(EGOptionsView *)optionsView;

- (void)optionsView:(EGOptionsView *)optionsView didSelected:(NSInteger)index;

@end

@protocol OptionsViewDataSource <NSObject>

@required
- (NSArray *)setDataSourceOptionView:(EGOptionsView *)optionsView;

@end

@interface EGOptionsView : UIView

/**delegate*/
@property (weak, nonatomic)id<OptionsViewDelegate> delegate;

/**data source*/
@property (weak, nonatomic)id<OptionsViewDataSource> dataSource;

- (void)setSelectedItem:(NSIndexPath *)indexPath;

@end
