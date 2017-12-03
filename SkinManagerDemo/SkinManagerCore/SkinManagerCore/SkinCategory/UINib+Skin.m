//
//  UINib+Skin.m
//  05-runtime
//
//  Created by wangyong on 2017/12/2.
//  Copyright © 2017年 wy. All rights reserved.
//
#import "UINib+Skin.h"
#import <objc/runtime.h>
#import "SkinManager.h"

@implementation UINib (Skin)

+ (void)load
{
    Method otherMehtod = class_getClassMethod(self, @selector(swizz_nibWithNibName:bundle:));
    Method originMehtod = class_getClassMethod(self, @selector(nibWithNibName:bundle:));
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}


-(instancetype)swizz_nibWithNibName:(NSString *)name bundle:(NSBundle *)bundle{
    [SkinManager sharedInstance].bundle = bundle;
    if (!bundle) {
        [SkinManager sharedInstance].bundle = [NSBundle mainBundle];
    }
    
    UINib *nib = [self swizz_nibWithNibName:name bundle:bundle];
    return nib;
}


@end
