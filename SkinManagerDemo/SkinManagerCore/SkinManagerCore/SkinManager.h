//
//  SkinManager.h
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageViewCoder.h"
#import "UIButtonCoder.h"
#import "UIBarButtonItemCoder.h"

@interface SkinManager : NSObject

+ (SkinManager*)sharedInstance;

@property(strong,nonatomic) NSBundle *bundle;

-(void)setOriginBundle:(NSBundle *)originB exchangeBundle:(NSBundle *)otherB;

-(NSBundle *)getExchangeBundle:(NSBundle *)bundle;

@property(strong,nonatomic) UIImageViewCoder *imageViewCoder;

@property(strong,nonatomic) UIButtonCoder *buttonCoder;

@property(strong,nonatomic) UIBarButtonItemCoder *barButtonItemCoder;

@end
