//
//  XYStatusCell.h
//  XYStatus
//
//  Created by 渠晓友 on 2017/3/22.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYStatus;

@interface XYStatusCell : UITableViewCell

@property (nonatomic, assign) CGFloat height;


@property (nonatomic, strong) XYStatus *status;


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
