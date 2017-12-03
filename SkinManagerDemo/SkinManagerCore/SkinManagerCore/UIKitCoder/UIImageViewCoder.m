//
//  UIImageViewCoder.m
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "UIImageViewCoder.h"

@implementation UIImageViewCoder


-(NSString *)getImageName{
    
    if (!self.UIImage) {
        return nil;
    }
    return [self.UIResourceName firstObject];
}

-(NSString *)getHighlightedImageName{
    if (!self.UIHighlightedImage) {
        return nil;
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
