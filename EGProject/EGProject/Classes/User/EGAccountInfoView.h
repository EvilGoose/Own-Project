//
//  EGAccountInfoView.h
//  EGProject
//
//  Created by EG on 2017/7/19.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KGoToUserDetailInfoController,
    KGoToQRCodeController
} AccountInfoViewCallBackType;

typedef void(^accountInfoViewCallBack)(AccountInfoViewCallBackType type);

@interface EGAccountInfoView : UIView

/**点击反馈*/
@property (copy, nonatomic)accountInfoViewCallBack callBack;

@end
