//
//  UIStoryboard+Skin.m
//  05-runtime
//
//  Created by wangyong on 2017/12/2.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "UIStoryboard+Skin.h"
#import <objc/runtime.h>
#import "SkinManager.h"


@implementation UIStoryboard (Skin)

+ (void)load
{
    Method otherMehtod = class_getClassMethod(self, @selector(swizz_storyboardWithName:bundle:));
    Method originMehtod = class_getClassMethod(self, @selector(storyboardWithName:bundle:));
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}


+(instancetype)swizz_storyboardWithName:(NSString *)name bundle:(NSBundle *)bundle{
    [SkinManager sharedInstance].bundle = bundle;
    if (!bundle) {
        [SkinManager sharedInstance].bundle = [NSBundle mainBundle];
    }
    UIStoryboard *sb = [self swizz_storyboardWithName:name bundle:bundle];
    return sb;
}


@end
