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


#endif /* Defines_h */
