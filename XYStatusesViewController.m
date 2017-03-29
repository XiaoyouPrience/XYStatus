//
//  XYStatusesViewController.m
//  XYStatus
//
//  Created by 渠晓友 on 2017/3/22.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

#import "XYStatusesViewController.h"
#import "XYStatus.h"
#import "XYStatusCell.h"

@interface XYStatusesViewController ()

@property (nonatomic, strong) NSMutableArray *status;

@end

@implementation XYStatusesViewController

- (NSMutableArray *)status
{
    if (_status == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayM = [NSMutableArray new];
        for (NSDictionary *dict in array) {
            
            XYStatus *status = [XYStatus statusWithDict:dict];
            
            [arrayM addObject:status];
            
        }
        
        _status = arrayM;
 
        
    }
    return _status;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.status.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYStatusCell *cell = [XYStatusCell cellWithTableView:tableView];
    
    cell.status = self.status[indexPath.row];
    
    NSLog(@"cell.height = %zd",cell.height);
    
    return cell;
}


/**
 *  不知是Xcode8的特性还是iOS10 特性。所以这种通过model保存高度的方法，可以不用写估算方法也行。
 *  因为最初精算，返回值为0，Model中没有保存。然后返回cell之后，再精算的时候返回真实的保存值。
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"-----heightForRowAtIndexPath------");
    XYStatus *status = self.status[indexPath.row];
    return status.cellHeight;
    
}


/**
 *  这个方法很重要：是估算cell的高度。有这个方法的调用顺序是： 1.估算 2.返回cell 3. 计算准确高度
 *                                            否则：1.计算准确高度 2.返回cell 3.再计算准确高度
 *
 *  不知是Xcode8的特性还是iOS10 特性。所以这种通过model保存高度的方法，可以不用写估算方法也行
 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"-----estimatedHeightForRowAtIndexPath------");
    
    return 200;
}


@end
