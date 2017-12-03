//
//  UIImage+Skin.m
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wangyong. All rights reserved.
//

#import "UIImage+Skin.h"
#import <objc/runtime.h>


@implementation UIImage (Skin)

+ (void)load
{
    Method otherMehtod = class_getClassMethod(self, @selector(imageWithName:));
    Method originMehtod = class_getClassMethod(self, @selector(imageNamed:));
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
    
}


+ (UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    image = [UIImage imageWithName:name];
    return image;
}

@end
