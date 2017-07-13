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
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
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

+ (UIBarButtonItem *)barButtonItemWithCustomImage:(UIImage *)customImage hightlightedImage:(UIImage *)hightlightedImage forTarget:(id)target WithAction:(SEL)action  {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    //调试颜色
    
    if (customImage) {
        [button setImage:customImage forState:UIControlStateNormal];
    }
    
    if (hightlightedImage) {
        [button setImage:hightlightedImage forState:UIControlStateHighlighted];
    }
    
    
    [button sizeToFit];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    return  buttonItem;
}

+ (UIBarButtonItem *)barButtonItemWithCustomImage:(UIImage *)customImage selectedImage:(UIImage *)selectedImage forTarget:(id)target WithAction:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    button.bounds = CGRectMake(0, 0, 50, 50);
    
        //调试颜色
    
    if (customImage) {
        [button setImage:customImage forState:UIControlStateNormal];
    }
    
    if (selectedImage) {
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
        
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    return  buttonItem;
}
@end
