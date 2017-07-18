//
//  NSMutableArray+Beyond.m
//  EGProject
//
//  Created by EG on 2017/7/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "NSMutableArray+Beyond.h"

@implementation NSMutableArray (Beyond)

-(id)objectAtIndexCheck:(NSUInteger)index {
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    NSLog(@"%@", [NSThread callStackSymbols]);
    return nil;
}

- (void)addObjectCheck:(id)anObject {
    if (anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO) {
        [self addObject:anObject];
    }else {
        NSLog(@"%@", [NSThread callStackSymbols]);
    }
}

- (void)insertObjectCheck:(id)anObject atIndex:(NSUInteger)index {
    if (index <= self.count && anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO) {
        [self insertObject:anObject atIndex:index];
    }else {
        NSLog(@"%@", [NSThread callStackSymbols]);
    }
}

- (void)removeObjectAtIndexCheck:(NSUInteger)index  {
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }else {
        NSLog(@"%@", [NSThread callStackSymbols]);
    }
}

- (void)replaceObjectAtIndexCheck:(NSUInteger)index withObject:(id)anObject {
    if (index < self.count && anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }else {
        NSLog(@"%@", [NSThread callStackSymbols]);
    }
}

@end
