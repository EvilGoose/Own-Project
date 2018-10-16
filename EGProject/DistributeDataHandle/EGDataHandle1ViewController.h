//
//  EGDataHandle1ViewController.h
//  DistributeDataHandle
//
//  Created by EG on 2018/10/10.
//  Copyright © 2018年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGAPIManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface EGAPIManager_C1 : EGAPIManager

@end


@interface EGDataHandle1ViewController : UIViewController

@property(nonatomic,strong) EGAPIManager_C1 *manager;

@end

NS_ASSUME_NONNULL_END
