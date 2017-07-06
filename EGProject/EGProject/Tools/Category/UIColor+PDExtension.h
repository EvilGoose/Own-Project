//
//  UIColor+PDExtension.h
//  GDUMini
//
//  Created by ProFlight on 16/5/30.
//  Copyright © 2016年 ProFlight. All rights reserved.
//  十六进制颜色

#import <UIKit/UIKit.h>

@interface UIColor (PDExtension)


+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
