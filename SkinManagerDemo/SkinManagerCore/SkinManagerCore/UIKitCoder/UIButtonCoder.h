//
//  UIButtonCoder.h
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class UIButtonImageCoder;

@interface UIButtonCoder : NSObject

@property(strong,nonatomic) UIButtonImageCoder *curImageCoer;

@property(strong,nonatomic) UIButtonImageCoder *normalImageCoder;

@property(strong,nonatomic) UIButtonImageCoder *disabledImageCoder;

@property(strong,nonatomic) UIButtonImageCoder *highlightedImageCoder;

@property(strong,nonatomic) UIButtonImageCoder *selectedImageCoder;

@end

@interface UIButtonImageCoder : NSObject

@property(copy,nonatomic) NSString *NSKey;

@property(copy,nonatomic) NSString *UITitle;

@property(strong,nonatomic) NSMutableArray<NSString *> *UIResourceName;

@property(strong,nonatomic) UIImage *UIImage;

@property(strong,nonatomic) UIImage *UIBackgroundImage;

@end

