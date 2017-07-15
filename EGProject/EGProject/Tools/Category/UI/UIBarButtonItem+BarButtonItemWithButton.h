//
//  UIBarButtonItem+BarButtonItemWithButton.h
//  ComprehensiveSample_0420_Exercise
//
//  Created by EG on 4/20/16.
//  Copyright © 2016 EG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BarButtonItemWithButton)

    /**文字按钮，仅正常状态*/
+ (UIBarButtonItem *)barButtonItemTitle:(NSString *)title titleColor:(UIColor *)titleColor forTarget:(id)target WithAction:(SEL)action;

    /**图片按钮, 有高亮状态*/
+ (UIBarButtonItem *)barButtonItemWithCustomImageName:(NSString *)customImageName hightlightedImage:(NSString *)hightlightedImageName forTarget:(id)target WithAction:(SEL)action;

    /**图片按钮, 有选中状态*/
+ (UIBarButtonItem *)barButtonItemWithCustomImage:(UIImage *)customImage selectedImage:(UIImage *)selectedImage forTarget:(id)target WithAction:(SEL)action;

   /**设置状态图片*/
- (void)setBarButtonItemImage:(UIImage *)image forState:(UIControlState) state;

   /**设置状态标题*/
- (void)setBarButtonItemName:(NSString *)name forState:(UIControlState) state;


@end
