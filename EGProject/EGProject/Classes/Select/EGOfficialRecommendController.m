//
//  EGOfficialRecommendController.m
//  EGProject
//
//  Created by EG on 2017/7/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGOfficialRecommendController.h"

@interface EGOfficialRecommendController ()

@end


@implementation EGOfficialRecommendController

- (void)testBlock:(void (^)(void))block {
    if (block) {
        block();
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
        
    
}

- (void)configureNavigationItem:(UINavigationItem *)item NavigationBar:(UINavigationBar *)bar {
    bar.hidden = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
