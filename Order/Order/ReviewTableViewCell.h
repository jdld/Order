//
//  ReviewTableViewCell.h
//  Order
//
//  Created by Etong on 16/7/13.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CurrentOrderModel;

@interface ReviewTableViewCell : UITableViewCell

@property (strong, nonatomic) CurrentOrderModel *currentOrder;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
