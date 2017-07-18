//
//  EGSpecialController.m
//  EGProject
//
//  Created by EG on 2017/7/14.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGSpecialController.h"
#import "EGOfficialRecommendController.h"

@interface EGSpecialController ()

@end

@implementation EGSpecialController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    EGOfficialRecommendController *viewController = [EGOfficialRecommendController new];
    [self presentViewController:viewController animated:YES completion:^{
        [viewController testBlock:^{
            NSLog(@"Hello world")
        }];
    }];
    
}


@end
