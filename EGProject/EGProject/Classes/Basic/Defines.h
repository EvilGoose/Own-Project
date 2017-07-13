//
//  Defines.h
//  EGProject
//
//  Created by EG on 2017/7/6.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

    //打印
#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(fmt, ...)
#endif


#define IPHONE [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone

#define IPAD [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad

    //获取系统对象
#define KEY_WINDOW [UIApplication sharedApplication].keyWindow

#define APPLICATION [UIApplication sharedApplication]

#define APPDELEGATE [AppDelegate shareAppDelegate]

#define APPLICATION_ROOT_VIEW_CONTROLLER [UIApplication sharedApplication].delegate.window.rootViewController

#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]

#define NOTIFICATION_CENTER [NSNotificationCenter defaultCenter]

#define NOTIFICATION(class, fuction) [NSString stringWithFormat:@"Notification_%@_%@", class, fuction]  


#endif /* Defines_h */
