//
//  NSObject+CDD.h
//  CDDDemo
//
//  Created by gao feng on 16/2/4.
//  Copyright © 2016年 gao feng. All rights reserved.
//
/*
 把当前 Controller 的 view 结构完整保存来下并上报服务器
 方案一：定义一个新的父类 DumpViewController，继承该父类的子类可以获得 dumpViewHierarchy 方法。
 方案二：定义一个新的 DumpViewObject 类，已有的 Controller 只需要创建一个 DumpViewObject 对象，并调用 dumpViewHierarchy 方法，传入 self 即可。
 ✓方案三：给已有的 Controller 类添加一个 Category，XXController + DumpView，并在 Category 中实现 dumpViewController 方法，有时候我们还需要做一些状态保存，所以扩展性更好的办法是使用 associated object 给 Category 添加一个 DumpViewObject property，将 dumpView 相关的逻辑都写入 DumpViewObject 类中。
 方案四：使用 AOP 的方式，利用 Objective C 的 rumtime 特性 hook 每个 Controller 的 dumpViewHierarchy 方法，并在当中实现相应逻辑。
 */
#import <Foundation/Foundation.h>

@class CDDContext;

@interface NSObject (CDD)

@property (nonatomic, strong) CDDContext* context;

+ (void)swizzleInstanceSelector:(SEL)oldSel withSelector:(SEL)newSel;

@end
