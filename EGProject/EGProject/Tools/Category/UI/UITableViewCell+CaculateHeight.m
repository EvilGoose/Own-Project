//
//  UITableViewCell+CaculateHeight.m
//  EGProject
//
//  Created by EG on 2017/7/13.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "UITableViewCell+CaculateHeight.h"
#import "UIView+Extension.h"

@implementation UITableViewCell (CaculateHeight)

- (CGFloat)getHeightWithString:(NSString *)string
                          font:(UIFont *)font
                  regularWidth:(CGFloat)regularWidth
                 regularHeight:(CGFloat)regularHeight {
    if (!string) {
        return regularHeight;
    }
    
    if (!font) {
        font = DEFAULT_FONT;
    }
    
    CGFloat result;
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 3;
    style.paragraphSpacing = 3;
    
    CGRect rect = [string boundingRectWithSize:CGSizeMake(regularWidth, 0)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                    attributes:@{
                                                 NSFontAttributeName:font,
                                                 NSParagraphStyleAttributeName:style}
                                       context:nil];
    
    result = rect.size.height + regularHeight;
    
    return result;
}

- (CGFloat)getWidthWithString:(NSString *)string
                         font:(UIFont *)font
                 regularWidth:(CGFloat)regularWidth
                regularHeight:(CGFloat)regularHeight {
    if (!string) {
        return regularWidth;
    }
    
    if (!font) {
        font = DEFAULT_FONT;
    }
    
    CGFloat result;
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 3;
    style.paragraphSpacing = 3;
    
    CGRect rect = [string boundingRectWithSize:CGSizeMake(regularHeight, 0)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                    attributes:@{
                                                 NSFontAttributeName:font,
                                                 NSParagraphStyleAttributeName:style}
                                       context:nil];
    
    result = rect.size.height + regularWidth;
    
    return result;
}

@end
