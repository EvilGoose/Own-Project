//
//  UITableViewCell+CaculateHeight.h
//  EGProject
//
//  Created by EG on 2017/7/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (CaculateHeight)

- (CGFloat)getHeightWithString:(NSString *)string
                          font:(UIFont *)font
                  regularWidth:(CGFloat)regularWidth
                 regularHeight:(CGFloat)regularHeight;


- (CGFloat)getWidthWithString:(NSString *)string
                          font:(UIFont *)font
                  regularWidth:(CGFloat)regularWidth
                 regularHeight:(CGFloat)regularHeight;

@end
