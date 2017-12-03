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


-(void)setOriginBundle:(NSBundle *)originB exchangeBundle:(NSBundle *)otherB{
    [self.skinDic setObject:otherB forKey:[originB bundlePath]];
}

-(NSBundle *)getExchangeBundle:(NSBundle *)bundle{
    return self.skinDic[bundle.bundlePath];
}


-(NSMutableDictionary *)skinDic{
    if (_skinDic) {
        return _skinDic;
    }
    _skinDic = [NSMutableDictionary new];
    return _skinDic;
}

@end
