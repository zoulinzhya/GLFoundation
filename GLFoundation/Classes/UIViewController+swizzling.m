//
//  UIViewController+swizzling.m
//  learnMasonry
//
//  Created by zoulin on 2017/10/12.
//  Copyright © 2017年 huangyibiao. All rights reserved.
//

#import "UIViewController+swizzling.h"

@implementation UIViewController (swizzling)

+ (void)load {
    [super load];
    Method fromMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method toMethod = class_getInstanceMethod([self class], @selector(swizzlingViewDidLoad));
    
    
    /**
     *  我们在这里使用class_addMethod()函数对Method Swizzling做了一层验证，如果self没有实现被交换的方法，会导致失败。
     *  而且self没有交换的方法实现，但是父类有这个方法，这样就会调用父类的方法，结果就不是我们想要的结果了。
     *  所以我们在这里通过class_addMethod()的验证，如果self实现了这个方法，class_addMethod()函数将会返回NO，我们就可以对其进行交换了。
     */
    if (!class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
}

//我们自己实现的方法，也就是和viewDidLoad方法进行交换的方法
- (void)swizzlingViewDidLoad {
    NSString *className = [NSString stringWithFormat:@"%@", self.class];
    //在这里加一个判断，将系统的UIViewController的对象剔除掉
    if (![className containsString:@"UI"]) {
        NSLog(@"统计大点计数 : %@", self.class);
    }
    
    [self swizzlingViewDidLoad]; //由于执行了load 方法 将swizzlingViewDidLoad与viewDidLoad的执行方法互换了 所以这里执行的实际上是viewDidLoad
}

/*
看到上面的代码，肯定有人会问：楼主，你太粗心了，你在swizzlingViewDidLoad方法中又调用了[self swizzlingViewDidLoad];，这难道不会产生递归调用吗？

答：然而....并不会????。

还记得我们上面的图一和图二吗？Method Swizzling的实现原理可以理解为”方法互换“。假设我们将A和B两个方法进行互换，向A方法发送消息时执行的却是B方法，向B方法发送消息时执行的是A方法。

例如我们上面的代码，系统调用UIViewController的viewDidLoad方法时，实际上执行的是我们实现的swizzlingViewDidLoad方法。而我们在swizzlingViewDidLoad方法内部调用[self swizzlingViewDidLoad];时，执行的是UIViewController的viewDidLoad方法。
 */

//推荐Github上星最多的一个第三方－jrswizzle
/*
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

- (void)xxx_viewWillAppear:(BOOL)animated {
    [self xxx_viewWillAppear:animated];
    NSLog(@"viewWillAppear: %@", self);
}*/

@end
