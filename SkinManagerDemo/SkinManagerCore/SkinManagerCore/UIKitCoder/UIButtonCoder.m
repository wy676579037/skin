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
    
    if (self.UIImage) {
        
    }
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
    NSString *imageName = [self.UIResourceName firstObject];
    return imageName;
}

-(NSString *)getBackgroundImageName{
    if (!self.UIBackgroundImage) {
        return nil;
    }
    return [self.UIResourceName lastObject];
}


@end
