//
//  UIBarButtonItem+BarButtonItemWithButton.h
//  ComprehensiveSample_0420_Exercise
//
//  Created by EG on 4/20/16.
//  Copyright © 2016 EG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BarButtonItemWithButton)


    /**按钮，无高亮状态*/
+ (UIBarButtonItem *)barButtonItemTitle:(NSString *)title titleColor:(UIColor *)titleColor forTarget:(id)target WithAction:(SEL)action;

    /**图片和文字按钮,有高亮状态*/
+ (UIBarButtonItem *)barButtonItemWithCustomImageName:(NSString *)customImageName hightlightedImage:(NSString *)hightlightedImageName forTarget:(id)target WithAction:(SEL)action;

	/**图片按钮,有高亮状态*/
+ (UIBarButtonItem *)barButtonItemWithCustomImage:(UIImage *)customImage hightlightedImage:(UIImage *)hightlightedImage forTarget:(id)target WithAction:(SEL)action;

    /**选中状态*/
+ (UIBarButtonItem *)barButtonItemWithCustomImage:(UIImage *)customImage selectedImage:(UIImage *)selectedImage forTarget:(id)target WithAction:(SEL)action;

@end
