//
//  UIBarButtonItem+BarButtonItemWithButton.m
//  ComprehensiveSample_0420_Exercise
//
//  Created by EG on 4/20/16.
//  Copyright © 2016 EG. All rights reserved.
//

#import "UIBarButtonItem+BarButtonItemWithButton.h"

@implementation UIBarButtonItem (BarButtonItemWithButton)

+ (UIBarButtonItem *)barButtonItemTitle:(NSString *)title titleColor:(UIColor *)titleColor forTarget:(id)target WithAction:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
    button.highlighted = NO;
    
    [button sizeToFit];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    return  buttonItem;
}

+ (UIBarButtonItem *)barButtonItemWithCustomImageName:(NSString *)customImageName hightlightedImage:(NSString *)hightlightedImageName forTarget:(id)target WithAction:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    if (customImageName) {
        [button setImage:[UIImage imageNamed:customImageName] forState:UIControlStateNormal];
    }
    
    if (hightlightedImageName) {
        [button setImage:[UIImage imageNamed:hightlightedImageName] forState:UIControlStateHighlighted];
    }
    
    [button sizeToFit];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    return  buttonItem;
}

+ (UIBarButtonItem *)barButtonItemWithCustomImage:(UIImage *)customImage selectedImage:(UIImage *)selectedImage forTarget:(id)target WithAction:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    if (customImage) {
        [button setImage:customImage forState:UIControlStateNormal];
    }
    
    if (selectedImage) {
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
    
    [button sizeToFit];

    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    return  buttonItem;
}

- (void)setBarButtonItemImage:(UIImage *)image forState:(UIControlState) state {
    UIView *view = self.customView;
    if ([view isKindOfClass:UIButton.class]) {
        UIButton *button = (UIButton *)view;
        [button setImage:image forState:state];
        [button setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, 0)];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -18, 15, 0)];
        [button.titleLabel setFont:SYSTEM_FONT(3)];
        [view layoutIfNeeded];
    }
}

- (void)setBarButtonItemName:(NSString *)name forState:(UIControlState)state {
    UIView *view = self.customView;
    if ([view isKindOfClass:UIButton.class]) {
        UIButton *button = (UIButton *)view;
        [button setTitle:name forState:state];
        [button setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, 0)];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -20, 15, 0)];
        [button.titleLabel setFont:[UIFont systemFontOfSize:1]];
        [view layoutIfNeeded];
    }
}

@end
