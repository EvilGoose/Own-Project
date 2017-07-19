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

    //单例
#define SINGLETON_INTERFACE(class)  + (class *)sharedInstance##class;//声明

    //实现
#define SINGLETON_IMPLEMENTATION(class)\
static class *_instance;\
+ (class *)sharedInstance##class {\
		if (_instance == nil) {\
		_instance = [[self alloc] init];}\
	return _instance;}\
+ (id)allocWithZone:(NSZone *)zone {\
    	static dispatch_once_t onceToken;\
		dispatch_once(&onceToken, ^{\
		_instance = [super allocWithZone:zone];\
	});\
	return _instance;}


#endif /* Defines_h */
