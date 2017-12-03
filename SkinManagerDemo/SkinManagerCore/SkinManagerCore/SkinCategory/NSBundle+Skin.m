//
//  NSBundle+Skin.m
//  05-runtime
//
//  Created by wangyong on 2017/12/2.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "NSBundle+Skin.h"
#import <objc/runtime.h>
#import "SkinManager.h"

@implementation NSBundle (Skin)

+ (void)load
{
    Method otherMehtod = class_getInstanceMethod(self, @selector(swizz_loadNibNamed:owner:options:));
    Method originMehtod = class_getInstanceMethod(self, @selector(loadNibNamed:owner:options:));
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
    
}

-(NSArray *)swizz_loadNibNamed:(NSString *)name owner:(id)owner options:(NSDictionary *)options{
    [SkinManager sharedInstance].bundle = self;
    NSArray *array = [self swizz_loadNibNamed:name owner:owner options:options];
    return array;
}




@end
