//
//  NSDictionary+Log.m
//  EGProject
//
//  Created by EG on 2017/7/15.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)

-(NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *result = [NSMutableString string];
    [result appendString:@"{"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [result appendFormat:@"\n\t%@ = %@,",key,obj];
    }];
    
        //去掉最后一个逗号（,）
    if ([result hasSuffix:@","]) {
        NSString *string = [result substringToIndex:result.length - 1];
        result = [NSMutableString stringWithString:string];
    }
    [result appendString:@"\n}"];
    return result;
}

@end
