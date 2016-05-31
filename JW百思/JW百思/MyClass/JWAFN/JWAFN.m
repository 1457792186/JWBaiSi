//
//  JWAFN.m
//  JW百思
//
//  Created by scjy on 16/4/9.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWAFN.h"

@implementation JWAFN

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manger = [[JWBasicAFNManger alloc]init];
        
    }
    return self;
}

+ (id)manger{
    return [[self alloc]init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static id idValue = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        idValue = [super allocWithZone:zone];
    });
    return idValue;
}

@end
