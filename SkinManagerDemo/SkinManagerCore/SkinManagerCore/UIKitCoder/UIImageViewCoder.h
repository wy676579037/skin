//
//  UIImageViewCoder.h
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImageViewCoder : NSObject

@property(strong,nonatomic) UIImage *UIImage;

@property(strong,nonatomic) UIImage *UIHighlightedImage;

@property(strong,nonatomic) NSMutableArray<NSString *> *UIResourceName;

-(NSString *)getImageName;

-(NSString *)getHighlightedImageName;


@end
