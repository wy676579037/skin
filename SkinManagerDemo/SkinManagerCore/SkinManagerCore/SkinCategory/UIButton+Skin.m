//
//  UIButton+Skin.m
//  05-runtime
//
//  Created by wangyong on 2017/12/2.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "UIButton+Skin.h"
#import <objc/runtime.h>
#import "SkinManager.h"
#import "UIButtonCoder.h"

@implementation UIButton (Skin)



+ (void)load
{
    Method otherMehtod = class_getInstanceMethod(self, @selector(swizz_initWithCoder:));
    Method originMehtod = class_getInstanceMethod(self, @selector(initWithCoder:));
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
    
}


-(instancetype)swizz_initWithCoder:(NSCoder *)aDecoder{
    [SkinManager sharedInstance].buttonCoder = [UIButtonCoder new];
    UIButton *btn = [self swizz_initWithCoder:aDecoder];
    UIButtonCoder *btnCoder = [SkinManager sharedInstance].buttonCoder;
    [SkinManager sharedInstance].buttonCoder = nil;
    return btn;
}


@end
