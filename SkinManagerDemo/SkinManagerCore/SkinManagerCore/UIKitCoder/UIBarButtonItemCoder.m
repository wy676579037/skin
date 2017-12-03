//
//  UIBarButtonItemCoder.m
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "UIBarButtonItemCoder.h"

@implementation UIBarButtonItemCoder

-(NSString *)getImageName{
    if (!_UIImage) {
        return nil;
    }
    return [self.UIResourceName firstObject];
}

@end
