//
//  EGCustomButton.h
//  EGProject
//
//  Created by EG on 2017/7/14.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGCustomButton : UIButton

/**图片名称*/
@property (copy, nonatomic)NSString *imageName;

/**主标题*/
@property (strong, nonatomic)NSString *mainTitle;

/**副标题*/
@property (strong, nonatomic)NSString *subTitle;

+ (EGCustomButton *)customButtonWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName;

@end
