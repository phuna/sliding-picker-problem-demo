//
// Created by Phu Nguyen Anh on 3/13/16.
// Copyright (c) 2016 Phu Nguyen Anh. All rights reserved.
//

#import "UIWindow+ViewDebug.h"
#import <objc/runtime.h>

@implementation UIWindow (ViewDebug)

- (id)swizzled_addSubView:(UIView *)view
{
    NSLog(@"Add subview: %@", view);

    id result = [self swizzled_addSubView:view];
    return result;
}

- (id)swizzled_sendSubviewToBack:(UIView *)view
{
    NSLog(@"Send subview to back: %@", view);
    id result = [self swizzled_sendSubviewToBack:view];
    return result;
}

//+ (void)load
//{
//    if ([NSStringFromClass([self class]) isEqualToString:@"UIWindow"]) {
//        // The "+ load" method is called once, very early in the application life-cycle.
//        // It's called even before the "main" function is called. Beware: there's no
//        // autorelease pool at this point, so avoid Objective-C calls.
//        Method original, swizzle;
//
//        original = class_getInstanceMethod(self, @selector(addSubview:));
//        swizzle = class_getInstanceMethod(self, @selector(swizzled_addSubView:));
//        // Swap their implementations.
//        method_exchangeImplementations(original, swizzle);
//
//        original = class_getInstanceMethod(self, @selector(sendSubviewToBack:));
//        swizzle = class_getInstanceMethod(self, @selector(swizzled_sendSubviewToBack:));
//        // Swap their implementations.
//        method_exchangeImplementations(original, swizzle);
//    }
//}

@end