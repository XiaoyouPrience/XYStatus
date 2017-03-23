//
//  XYStatus.h
//  XYStatus
//
//  Created by 渠晓友 on 2017/3/22.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYStatus : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, assign,getter=isVip) BOOL vip;

/**
 *  cellHeight
 */
@property (nonatomic, assign) CGFloat cellHeight;

+ (instancetype)statusWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
