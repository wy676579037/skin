//
//  UIBarButtonItem+Skin.m
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "UIBarButtonItem+Skin.h"
#import "SkinManager.h"
#import <objc/runtime.h>
#import "UIBarButtonItemCoder.h"

@implementation UIBarButtonItem (Skin)

+ (void)load
{
    Method otherMehtod = class_getInstanceMethod(self, @selector(swizz_initWithCoder:));
    Method originMehtod = class_getInstanceMethod(self, @selector(initWithCoder:));
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
    
}


-(instancetype)swizz_initWithCoder:(NSCoder *)aDecoder{
    [SkinManager sharedInstance].barButtonItemCoder = [UIBarButtonItemCoder new];
    UIBarButtonItem *btnItem = [self swizz_initWithCoder:aDecoder];
    
    [SkinManager sharedInstance].barButtonItemCoder = nil;
    return btnItem;
}

@end
