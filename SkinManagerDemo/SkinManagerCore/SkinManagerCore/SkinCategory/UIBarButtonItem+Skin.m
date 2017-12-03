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
    [self exchangeImage:btnItem];
    [SkinManager sharedInstance].barButtonItemCoder = nil;
    return btnItem;
}

-(void)exchangeImage:(UIBarButtonItem *)btnItem{
    
    NSBundle *currentBundle = [SkinManager sharedInstance].bundle;
    NSBundle *exchangeBundle = [[SkinManager sharedInstance] getImageExchangeBundle:currentBundle];
    if (exchangeBundle) {
        return;
    }
    UIBarButtonItemCoder *itemCoder = [SkinManager sharedInstance].barButtonItemCoder;
    
    NSString *imageName = [itemCoder getImageName];
    if (imageName) {
        UIImage *image = [UIImage imageNamed:imageName
                                    inBundle:exchangeBundle
               compatibleWithTraitCollection:nil];
        if (image) {
            [btnItem setImage:image];
        }
    }
}





@end
