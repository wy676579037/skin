//
//  UIButtonCoder.m
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "UIButtonCoder.h"
#import "SkinManager.h"


@implementation UIButtonCoder


@end


@interface UIButtonImageCoder()

@property(strong,nonatomic) NSMutableArray<NSString *> *UIResourceName;

@end


@implementation UIButtonImageCoder

-(void)addResourceName:(NSString *)resourceName{
    [self.UIResourceName addObject:resourceName];
}



-(NSMutableArray<NSString *> *)UIResourceName{
    if (_UIResourceName) {
        return _UIResourceName;
    }
    _UIResourceName = [NSMutableArray new];
    return _UIResourceName;
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

-(NSString *)getBackgroundImageName{
    if (!self.UIBackgroundImage) {
        return nil;
    }
    NSString *backImageName = [[SkinManager sharedInstance] getImageName:self.UIBackgroundImage];
    if (backImageName) {
        return  backImageName;
    }
    return [self.UIResourceName lastObject];
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


-(void)setUIBackgroundImage:(UIImage *)UIBackgroundImage{
    _UIBackgroundImage = UIBackgroundImage;
    if (!UIBackgroundImage) {
        return;
    }
    NSString *tempName = [self.UIResourceName lastObject];
    if (!tempName) {
        return;
    }
    NSString *imageName = [[SkinManager sharedInstance] getImageName:self.UIBackgroundImage];
    if (imageName) {
        return;
    }
    [[SkinManager sharedInstance] cacheImageName:tempName
                                            with:self.UIBackgroundImage];
}



@end
