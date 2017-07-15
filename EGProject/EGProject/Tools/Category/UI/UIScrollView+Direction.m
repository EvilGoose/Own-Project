//
//  UIScrollView+Direction.m
//  GFlight
//
//  Created by EG on 2017/6/12.
//  Copyright © 2017年 GDU. All rights reserved.
//

#import "UIScrollView+Direction.h"
#import <objc/runtime.h>

@implementation UIScrollView (Direction)

-(void)setDirection:(Direction)direction{
    objc_setAssociatedObject(self, @selector(direction), @(direction), OBJC_ASSOCIATION_ASSIGN);
}

- (Direction)direction{
    NSNumber * number = objc_getAssociatedObject(self, @selector(direction));
    return number.integerValue;
}

- (void)setEnableDirection:(BOOL)enableDirection{
    objc_setAssociatedObject(self, @selector(enableDirection), @(enableDirection), OBJC_ASSOCIATION_ASSIGN);
    if (enableDirection) {
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
}

- (BOOL)enableDirection{
    NSNumber * number = objc_getAssociatedObject(self, _cmd);
    return number.integerValue;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *, id> *)change context:(void *)context {
    if ([change[@"new"] CGPointValue].y > [change[@"old"] CGPointValue].y  ) {
        self.direction = DirectionUp;
    } else if ([change[@"new"] CGPointValue].y < [change[@"old"] CGPointValue].y  ) {
        self.direction = DirectionDown;
    }
}

@end
