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
    [self exchangeImage:btn];
    [SkinManager sharedInstance].buttonCoder = nil;
    return btn;
}

-(void)exchangeImage:(UIButton *)btn{
    
    NSBundle *currentBundle = [SkinManager sharedInstance].bundle;
    NSBundle *exchangeBundle = [[SkinManager sharedInstance] getExchangeBundle:currentBundle];
    if (exchangeBundle) {
        return;
    }
    
    UIButtonCoder *btnCoder = [SkinManager sharedInstance].buttonCoder;
    UIButtonImageCoder *normalCoder = btnCoder.normalImageCoder;
    NSString *nomalImageName = [normalCoder getImageName];
    NSString *nomalbackGroundImageName = [normalCoder getBackgroundImageName];
    if (nomalImageName) {
        UIImage *image = [UIImage imageNamed:nomalImageName
                                    inBundle:exchangeBundle
               compatibleWithTraitCollection:nil];
        if (image) {
            [btn setImage:image forState:UIControlStateNormal];
        }
    }
    if (nomalbackGroundImageName) {
        UIImage *image = [UIImage imageNamed:nomalbackGroundImageName
                                    inBundle:exchangeBundle
               compatibleWithTraitCollection:nil];
        if (image) {
            [btn setBackgroundImage:image forState:UIControlStateNormal];
        }
    }
    
    UIButtonImageCoder *selectedCoder = btnCoder.selectedImageCoder;
    NSString *selectedImageName = [selectedCoder getImageName];
    NSString *selectedbackGroundImageName = [selectedCoder getBackgroundImageName];
    if (selectedImageName) {
        UIImage *image = [UIImage imageNamed:selectedImageName
                                    inBundle:exchangeBundle
               compatibleWithTraitCollection:nil];
        if (image) {
            [btn setImage:image forState:UIControlStateSelected];
        }
    }
    if (selectedbackGroundImageName) {
        UIImage *image = [UIImage imageNamed:selectedbackGroundImageName
                                    inBundle:exchangeBundle
               compatibleWithTraitCollection:nil];
        if (image) {
            [btn setBackgroundImage:image forState:UIControlStateSelected];
        }
    }
    
    UIButtonImageCoder *disabledCoder = btnCoder.disabledImageCoder;
    NSString *disImageName = [disabledCoder getImageName];
    NSString *disbackGroundImageName = [disabledCoder getBackgroundImageName];
    if (disImageName) {
        UIImage *image = [UIImage imageNamed:disImageName
                                    inBundle:exchangeBundle
               compatibleWithTraitCollection:nil];
        if (image) {
            [btn setImage:image forState:UIControlStateDisabled];
        }
    }
    if (disbackGroundImageName) {
        UIImage *image = [UIImage imageNamed:disbackGroundImageName
                                    inBundle:exchangeBundle
               compatibleWithTraitCollection:nil];
        if (image) {
            [btn setBackgroundImage:image forState:UIControlStateDisabled];
        }
    }
    
    UIButtonImageCoder *highLightedCoder = btnCoder.highlightedImageCoder;
    NSString *highLightedImageName = [highLightedCoder getImageName];
    NSString *highLightedGroundImageName = [highLightedCoder getBackgroundImageName];
    if (highLightedImageName) {
        UIImage *image = [UIImage imageNamed:highLightedImageName
                                    inBundle:exchangeBundle
               compatibleWithTraitCollection:nil];
        if (image) {
            [btn setImage:image forState:UIControlStateHighlighted];
        }
    }
    if (highLightedGroundImageName) {
        UIImage *image = [UIImage imageNamed:highLightedGroundImageName
                                    inBundle:exchangeBundle
               compatibleWithTraitCollection:nil];
        if (image) {
            [btn setBackgroundImage:image forState:UIControlStateHighlighted];
        }
    }
    
}




@end
