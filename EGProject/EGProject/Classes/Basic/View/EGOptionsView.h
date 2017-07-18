//
//  EGOptionsView.h
//  EGProject
//
//  Created by EG on 2017/7/18.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EGTextCollectionViewCell : UICollectionViewCell

@end

@class EGOptionsView;

@protocol OptionsViewDelegate <NSObject>

- (void)optionsView:(EGOptionsView *)optionsView didSelected:(NSInteger)index;

@end

@protocol OptionsViewDataSource <NSObject>

- (NSArray *)setDataSourceOptionView:(EGOptionsView *)optionsView;

@end

@interface EGOptionsView : UIView

/**delegate*/
@property (weak, nonatomic)id<OptionsViewDelegate> delegate;

/**data source*/
@property (weak, nonatomic)id<OptionsViewDataSource> dataSource;

@end
