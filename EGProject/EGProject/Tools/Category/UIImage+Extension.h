//
//  UIImage+Extension.h
//  EGProject
//
//  Created by EG on 2017/7/24.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

- (UIImage *)clipCenterToSize:(CGSize)newSize;

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage*)decode:(UIImage*)image;

+ (UIImage*)fastImageWithData:(NSData *)data;

+ (UIImage*)fastImageWithContentsOfFile:(NSString*)path;

    //截图
+ (UIImage *)getImageFromImage:(UIImage *)baseImage fromRect:(CGRect) rect;

    //截屏
+ (UIImage *)getImageFromCurrentScreenDisplay;

+ (UIImage *)initImageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)getImageFromSize:(CGSize)size;

- (UIImage *)deepCopy;

- (UIImage*)resize:(CGSize)size;

- (UIImage*)imageCompressImage:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

- (UIImage *)cropImageToCircleWithRadius:(CGFloat)radius;

@end
