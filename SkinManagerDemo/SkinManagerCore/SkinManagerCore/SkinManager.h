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

//解决由于UIImage图片缓存 导致图片名称无法获取的问题
-(void)cacheImageName:(NSString *) imageName with:(UIImage *)image;

-(NSString *)getImageName:(UIImage *)image;

-(void)setOriginBundle:(NSBundle *)originB exchangeBundle:(NSBundle *)otherB;

-(NSBundle *)getImageExchangeBundle:(NSBundle *)bundle;

@property(strong,nonatomic) UIImageViewCoder *imageViewCoder;

@property(strong,nonatomic) UIButtonCoder *buttonCoder;

@property(strong,nonatomic) UIBarButtonItemCoder *barButtonItemCoder;

@end
