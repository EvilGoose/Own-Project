//
//  ViewController.m
//  DistributeDataHandle
//
//  Created by EG on 2018/10/10.
//  Copyright © 2018年 EGMade. All rights reserved.
//

#import "ViewController.h"

#import "EGDataHandle1ViewController.h"
#import "EGDataHandle2ViewController.h"

@interface ViewController ()

@property(nonatomic,copy) NSArray *netData;

@property(nonatomic,strong) EGAPIManager_C1 *manager1;

@property(nonatomic,strong) EGAPIManager_C2 *manager2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self askForDataFromNet];
}

- (void)askForDataFromNet {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.netData = @[
                             @{
                                 @"name":@"Jack",
                                 @"age":@(18),
                                 @"address":@"L.A."
                                 },
                             @{
                                 @"name":@"Tom",
                                 @"age":@(17),
                                 @"address":@"Miami"
                                 },
                             @{
                                 @"name":@"Lily",
                                 @"age":@(18),
                                 @"address":@"NY"
                                 },
                             @{
                                 @"name":@"May",
                                 @"age":@(17),
                                 @"address":@"Boston"
                                 },
                             @{
                                 @"name":@"Ann",
                                 @"age":@(18),
                                 @"address":@"NY"
                                 },
                             ];
            
            
        });
    });
}


@end
