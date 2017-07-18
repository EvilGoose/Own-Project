//
//  NSArray+Log.m
//  EGProject
//
//  Created by EG on 2017/7/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *result = [NSMutableString string];
    [result appendString:@"["];
    for (id obj in self) {
        [result appendFormat:@"\n\t%@,",obj];
    }
        //去掉最后一个逗号（,）
    if ([result hasSuffix:@","]) {
        NSString *string = [result substringToIndex:result.length - 1];
        result = [NSMutableString stringWithString:string];
    }
    [result appendString:@"\n]"];
    return result;
}

@end
