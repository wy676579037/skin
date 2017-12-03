//
//  SkinManager.m
//  05-runtime
//
//  Created by wangyong on 2017/12/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "SkinManager.h"

@interface SkinManager()

@property(strong,nonatomic) NSMutableDictionary *skinDic;

@property(strong,nonatomic) NSMutableDictionary *imageDic;


@end


@implementation SkinManager

+ (SkinManager*)sharedInstance
{
    static SkinManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[SkinManager alloc] init];
    });
    return _sharedInstance;
    
}

-(void)cacheImageName:(NSString *)imageName with:(UIImage *)image{
    NSString *key = [image description];
    [self.imageDic setObject:imageName forKey:key];
}

-(NSString *)getImageName:(UIImage *)image{
    NSString *key = [image description];
    return [self.imageDic objectForKey:key];
}

-(void)setOriginBundle:(NSBundle *)originB exchangeBundle:(NSBundle *)otherB{
    [self.skinDic setObject:otherB forKey:[originB bundlePath]];
}

-(NSBundle *)getImageExchangeBundle:(NSBundle *)bundle{
    return self.skinDic[bundle.bundlePath];
}


-(NSMutableDictionary *)skinDic{
    if (_skinDic) {
        return _skinDic;
    }
    _skinDic = [NSMutableDictionary new];
    return _skinDic;
}

-(NSMutableDictionary *)imageDic{
    if (_imageDic) {
        return _imageDic;
    }
    _imageDic = [NSMutableDictionary new];
    return _imageDic;
}

@end
