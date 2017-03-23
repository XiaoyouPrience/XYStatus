//
//  XYStatus.m
//  XYStatus
//
//  Created by 渠晓友 on 2017/3/22.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

#import "XYStatus.h"

@implementation XYStatus

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}

@end
