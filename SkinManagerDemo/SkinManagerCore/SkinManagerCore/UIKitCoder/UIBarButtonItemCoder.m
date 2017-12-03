//
//  UIBarButtonItemCoder.m
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "UIBarButtonItemCoder.h"
#import "SkinManager.h"


@implementation UIBarButtonItemCoder

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



@end
