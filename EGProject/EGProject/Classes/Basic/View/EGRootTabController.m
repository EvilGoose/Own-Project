//
//  EGRootTabController.m
//  YHD
//
//  Created by EG on 2017/6/30.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGRootTabController.h"

#import "EGNavigationController.h"
#import "EGHomeViewController.h"
#import "EGSelectController.h"
#import "EGSpecialController.h"
#import "EGShoppingCarController.h"
#import "EGUserController.h"

@interface EGRootTabController ()

/*tab bar items*/
@property (copy, nonatomic)NSMutableArray *barItems;

@end

@implementation EGRootTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSettings];
    [self initChildControllers];
}

- (void)initSettings {
    self.tabBar.tintColor = [UIColor blackColor];
    self.tabBar.translucent = NO;
}

- (void)initChildControllers {
    [self addChildViewController:[self addChildViewController:[EGHomeViewController new]
                                                        title:@"首页"
                                                    imageName:@"commoditydetail_ic_details_home_black_31x31_"
                                            selectedImageName:@"commoditydetail_ic_details_home_black_pressed_31x31_"]];

    [self addChildViewController:[self addChildViewController:[EGSpecialController new]
                                                        title:@"专题"
                                                    imageName:@"Center_default"
                                            selectedImageName:@"Center_selected"]];

    [self addChildViewController:[self addChildViewController:[EGSelectController new]
                                                        title:@"分类"
                                                    imageName:@"Media_default"
                                            selectedImageName:@"Media_selected"]];

    [self addChildViewController:[self addChildViewController:[EGShoppingCarController new]
                                                        title:@"购物车"
                                                    imageName:@"commoditydetail_ic_menu_shoping_nor_20x20_"
                                            selectedImageName:@"commoditydetail_ic_menu_shoping_pressed_20x20_"]];
    
    [self addChildViewController:[self addChildViewController:[EGUserController new]
                                                        title:@"个人"
                                                    imageName:@"User_default"
                                            selectedImageName:@"User_selected"]];
    
}


- (UIViewController *)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    EGNavigationController *navigationController = [[EGNavigationController alloc] initWithRootViewController:childController];
    navigationController.tabBarItem.title = title;
    navigationController.tabBarItem.image = [UIImage imageNamed:imageName];
    navigationController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    [self.barItems addObject:navigationController.tabBarItem];
    return navigationController;
}

- (NSMutableArray *)barItems {
    if (!_barItems) {
        _barItems = [NSMutableArray array];
    }
    return _barItems;
}

@end
