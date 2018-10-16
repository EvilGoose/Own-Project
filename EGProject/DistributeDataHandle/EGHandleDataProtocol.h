//
//  EGHandleDataProtocol.h
//  DistributeDataHandle
//
//  Created by EG on 2018/10/10.
//  Copyright © 2018年 EGMade. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EGAPIManager;

NS_ASSUME_NONNULL_BEGIN

@protocol EGHandleDataProtocol <NSObject>

@required

- (NSDictionary *)reformDataWithManager:(__kindof EGAPIManager *)manager;

@end

NS_ASSUME_NONNULL_END
