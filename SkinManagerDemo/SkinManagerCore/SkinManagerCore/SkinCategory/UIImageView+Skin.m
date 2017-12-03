//
//  UIImageView+Skin.m
//  05-runtime
//
//  Created by wangyong on 2017/12/2.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "UIImageView+Skin.h"
#import <objc/runtime.h>
#import "SkinManager.h"
@implementation UIImageView (Skin)

+ (void)load
{
    Method otherMehtod = class_getInstanceMethod(self, @selector(swizz_initWithCoder:));
    Method originMehtod = class_getInstanceMethod(self, @selector(initWithCoder:));
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
    
}

-(instancetype)swizz_initWithCoder:(NSCoder *)aDecoder{
    
    [SkinManager sharedInstance].imageViewCoder = [UIImageViewCoder new];
    UIImageView *imageView = [self swizz_initWithCoder:aDecoder];
    //换肤
    [self exchangeImage:imageView];
    [SkinManager sharedInstance].imageViewCoder=nil;
    return imageView;
}


-(void)exchangeImage:(UIImageView *)imageView{
    
    NSBundle *currentBundle = [SkinManager sharedInstance].bundle;
    NSBundle *exchangeBundle = [[SkinManager sharedInstance] getExchangeBundle:currentBundle];
    if (exchangeBundle) {
        return;
    }
    UIImageViewCoder *coder =[SkinManager sharedInstance].imageViewCoder;
    NSString *imageName = [coder getImageName];
    NSString *highLightedImageName = [coder getHighlightedImageName];
    
    if (imageName) {
        UIImage *image = [UIImage imageNamed:imageName
                                    inBundle:exchangeBundle
               compatibleWithTraitCollection:nil];
        if (image) {
            imageView.image = image;
        }
    }
    
    if (highLightedImageName) {
        UIImage *highImage = [UIImage imageNamed:highLightedImageName
                                    inBundle:exchangeBundle
               compatibleWithTraitCollection:nil];
        if (highImage) {
            imageView.highlightedImage = highImage;
        }
    }
    
}



@end




