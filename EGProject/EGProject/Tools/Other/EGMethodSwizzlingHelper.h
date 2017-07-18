//
//  EGMethodSwizzlingHelper.h
//  EGProject
//
//  Created by EG on 2017/7/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//
    /*
     Swizzling应该总在 +load {} 中执行
     在OC中，Runtime会在类初始加载时调用 +load {} 方法，
     在类第一次被调用时实现 initialize 方法。由于Method Swizzling会影响到类的全局状态，所以要尽量避免在并发处理中出现竞争情况。
     +load{} 方法能保证在类的初始化过程中被加载，并保证这种改变应用级别的行为的一致性。
     要使用dispatch_once执行方法交换。
     方法交换要求线程安全，保证在任何情况下只能交换一次。
     */

#import <Foundation/Foundation.h>

@interface EGMethodSwizzlingHelper : NSObject

/**替换方法*/
+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzledSelector:(SEL)swizzledSelector;

@end
