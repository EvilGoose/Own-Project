//
//  EGGoodsModel.h
//  EGProject
//
//  Created by EG on 2017/7/11.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EGGoodsModel : NSObject

/**图片地址*/
@property (strong, nonatomic)NSString *imageURL;

/**介绍*/
@property (strong, nonatomic)NSString *introduce;

/**名称*/
@property (strong, nonatomic)NSString *name;

/**可选色个数*/
@property (assign, nonatomic)NSInteger colorNumber;

/**提示*/
@property (strong, nonatomic)NSString *reminder;

@end
