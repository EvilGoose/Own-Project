//
//  EGBasicViewController.h
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGBasicViewController : UIViewController

/**自定义导航栏Item*/
@property (nonatomic, strong)UINavigationItem *customNavigationItem;

/**自定义导航栏*/
@property (strong, nonatomic)UINavigationBar *customNavigationBar;

/**导航栏底部分割线*/
@property (strong, nonatomic)UIImageView *bottomSeperator;

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar;

@end
