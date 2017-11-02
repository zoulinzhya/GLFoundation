//
//  UIViewController+swizzling.h
//  learnMasonry
//
//  Created by zoulin on 2017/10/12.
//  Copyright © 2017年 zoulin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIViewController (swizzling)

+ (void)load;

- (void)swizzlingViewDidLoad;

@end
