//
//  XYStatusCell.m
//  XYStatus
//
//  Created by 渠晓友 on 2017/3/22.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

#import "XYStatusCell.h"
#import "XYStatus.h"

@interface XYStatusCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;


@end

@implementation XYStatusCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    
    static NSString *ID = @"cell";
    XYStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {

        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
        
    }
    
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 相当于设置一个Label真实的最大宽度约束
    self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    
}

- (void)setStatus:(XYStatus *)status
{
    _status = status;
    
    self.iconView.image = [UIImage imageNamed:status.icon];
    
    self.nameLabel.text = status.name;
    
    self.contentLabel.text = status.text;
    
    
    if (status.isVip) {
        
        self.vipView.hidden = NO;
        self.vipView.image = [UIImage imageNamed:@"vip"];
        self.nameLabel.textColor = [UIColor orangeColor];
    }else
    {
        self.vipView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    if (status.picture) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:status.picture];
        
        _height = CGRectGetMaxY(self.pictureView.frame) + 10;
    }else
    {
        self.pictureView.hidden = YES;
        
        _height = CGRectGetMaxY(self.contentLabel.frame) + 10;
    }
    
    // 强制布局
    [self layoutIfNeeded];
    
    
    // 计算并标记高度保存到model中去
    if (self.pictureView.hidden) {
        _height = CGRectGetMaxY(self.contentLabel.frame) + 10;
    }else
    {
        _height = CGRectGetMaxY(self.pictureView.frame) + 10;
    }
    
    status.cellHeight = _height;
    
}




@end
