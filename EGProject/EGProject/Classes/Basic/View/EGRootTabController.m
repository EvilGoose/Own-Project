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
#import "EGRecommendController.h"
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
}

- (void)initChildControllers {
    [self addChildViewController:[self addChildViewController:[EGHomeViewController new]
                                                        title:@"首页"
                                                    imageName:@"Home_default"
                                            selectedImageName:@"Home_selected"]];
    
    [self addChildViewController:[self addChildViewController:[EGSelectController new]
                                                        title:@"专题"
                                                    imageName:@"Media_default"
                                            selectedImageName:@"Media_selected"]];
    
    [self addChildViewController:[self addChildViewController:[EGRecommendController new]
                                                        title:@"分类"
                                                    imageName:@"Craft"
                                            selectedImageName:@""]];
    
    [self addChildViewController:[self addChildViewController:[EGShoppingCarController new]
                                                        title:@"购物车"
                                                    imageName:@"Record_default"
                                            selectedImageName:@"Record_selected"]];
    
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
