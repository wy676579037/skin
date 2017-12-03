//
//  UIImageViewCoder.m
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "UIImageViewCoder.h"
#import "SkinManager.h"

@interface UIImageViewCoder ()

@property(strong,nonatomic) NSMutableArray<NSString *> *UIResourceName;

@end


@implementation UIImageViewCoder


-(void)addResourceName:(NSString *)resourceName{
    [self.UIResourceName addObject:resourceName];
}

-(void)setUIImage:(UIImage *)UIImage{
    _UIImage = UIImage;
    if (!UIImage) {
        return;
    }
    NSString *tempName = [self.UIResourceName firstObject];
    if (!tempName) {
        return;
    }
    NSString *imageName = [[SkinManager sharedInstance] getImageName:self.UIImage];
    if (imageName) {
        return;
    }
    [[SkinManager sharedInstance] cacheImageName:tempName
                                            with:self.UIImage];
}

-(void)setUIHighlightedImage:(UIImage *)UIHighlightedImage{
    _UIHighlightedImage = UIHighlightedImage;
    if (!UIHighlightedImage) {
        return;
    }
    NSString *tempName = [self.UIResourceName lastObject];
    if (!tempName) {
        return;
    }
    NSString *imageName = [[SkinManager sharedInstance] getImageName:self.UIHighlightedImage];
    if (imageName) {
        return;
    }
    [[SkinManager sharedInstance] cacheImageName:tempName
                                            with:self.UIHighlightedImage];
}

-(NSString *)getImageName{
    
    if (!self.UIImage) {
        return nil;
    }
    
    NSString *imageName = [[SkinManager sharedInstance] getImageName:self.UIImage];
    
    if (imageName) {
        return imageName;
    }
    
    return [self.UIResourceName firstObject];
}

-(NSString *)getHighlightedImageName{
    if (!self.UIHighlightedImage) {
        return nil;
    }
    NSString *highLightedImageName = [[SkinManager sharedInstance] getImageName:self.UIHighlightedImage];
    if (highLightedImageName) {
        return  highLightedImageName;
    }
    return [self.UIResourceName lastObject];
}


-(NSMutableArray<NSString *> *)UIResourceName{
    if (_UIResourceName) {
        return _UIResourceName;
    }
    _UIResourceName = [NSMutableArray new];
    return _UIResourceName;
}

@end
