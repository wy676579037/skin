//
//  UIButtonCoder.m
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "UIButtonCoder.h"

@implementation UIButtonCoder

@end


@implementation UIButtonImageCoder

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
    return [self.UIResourceName firstObject];
}

-(NSString *)getBackgroundImageName{
    if (!self.UIBackgroundImage) {
        return nil;
    }
    return [self.UIResourceName lastObject];
}


@end
