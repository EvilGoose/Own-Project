//
//  NSArray+Beyond.m
//  EGProject
//
//  Created by EG on 2017/7/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "NSArray+Beyond.h"

@implementation NSArray (Beyond)

- (id)objectAtIndexCheck:(NSUInteger)index {
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    NSLog(@"%@ 越界了！！！", self);
    return nil;
}

@end
