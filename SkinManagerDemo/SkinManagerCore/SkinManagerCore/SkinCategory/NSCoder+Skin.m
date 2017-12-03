//
//  NSCoder+Skin.m
//  05-runtime
//
//  Created by wangyong on 2017/12/2.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "NSCoder+Skin.h"
#import <objc/runtime.h>
#import "SkinManager.h"


@implementation NSCoder (Skin)

+ (void)load
{
    Class clazz = NSClassFromString(@"UINibDecoder");
    Method otherMehtod = class_getInstanceMethod(clazz, @selector(swizz_decodeObjectForKey:));
    Method originMehtod = class_getInstanceMethod(clazz, @selector(decodeObjectForKey:));
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}


-(id)swizz_decodeObjectForKey:(NSString *) key{
    id value= [self swizz_decodeObjectForKey:key];
    UIImageViewCoder *imageViewCoder = [SkinManager sharedInstance].imageViewCoder;
    if (imageViewCoder) {
        [self setUP_ImageViewCoder:key value:value];
    }
    UIButtonCoder *buttonCoder = [SkinManager sharedInstance].buttonCoder;
    if (buttonCoder) {
        [self setUP_ButtonCoder:key value:value];
    }
    UIBarButtonItemCoder *barBtnIItemCoder = [SkinManager sharedInstance].barButtonItemCoder;
    if (barBtnIItemCoder) {
        [self setUP_BarBtnItemCoder:key value:value];
    }
    return value;
}

-(void)setUP_BarBtnItemCoder:(NSString *)key value:(id)value{
    
    UIBarButtonItemCoder *batItemCoder = [SkinManager sharedInstance].barButtonItemCoder;
    
    if ([key isEqualToString:@"UIImage"]) {
        batItemCoder.UIImage = value;
    }
    
    if ([key isEqualToString:@"UIResourceName"]) {
        [batItemCoder.UIResourceName addObject:value];
    }
}

-(void)setUP_ImageViewCoder:(NSString *) key value:(id)value{
    
    UIImageViewCoder *imageViewCoder = [SkinManager sharedInstance].imageViewCoder;
    
    if ([key isEqualToString:@"UIHighlightedImage"]) {
        imageViewCoder.UIHighlightedImage = value;
    }
    
    if ([key isEqualToString:@"UIImage"]) {
        imageViewCoder.UIImage = value;
    }
    
    if ([key isEqualToString:@"UIResourceName"]) {
        [imageViewCoder addResourceName:value];
    }
    
}
-(void)setUP_ButtonCoder:(NSString *)key value:(id)value{
    UIButtonCoder *buttonCoder = [SkinManager sharedInstance].buttonCoder;
    if ([key isEqualToString:@"NSKey"]) {
        if ([value containsString:@"normalTitle"]) {
            buttonCoder.curImageCoer = [UIButtonImageCoder new];
            buttonCoder.normalImageCoder = buttonCoder.curImageCoer;
        }
        if ([value containsString:@"disabledTitle"]) {
            buttonCoder.curImageCoer = [UIButtonImageCoder new];
            buttonCoder.disabledImageCoder = buttonCoder.curImageCoer;
        }
        if ([value containsString:@"highlightedTitle"]) {
            buttonCoder.curImageCoer = [UIButtonImageCoder new];
            buttonCoder.highlightedImageCoder = buttonCoder.curImageCoer;
        }
        if ([value containsString:@"selectedTitle"]) {
            buttonCoder.curImageCoer = [UIButtonImageCoder new];
            buttonCoder.selectedImageCoder = buttonCoder.curImageCoer;
        }
    }
    UIButtonImageCoder *curImageCoder = buttonCoder.curImageCoer;
    
    
    if ([key isEqualToString:@"UITitle"]) {
        curImageCoder.UITitle = value;
    }
    if ([key isEqualToString:@"UIResourceName"]) {
        [curImageCoder addResourceName:value];
    }
    if ([key isEqualToString:@"UIImage"]) {
        curImageCoder.UIImage = value;
    }
    if ([key isEqualToString:@"UIBackgroundImage"]) {
        curImageCoder.UIBackgroundImage = value;
    }
    
}


@end
