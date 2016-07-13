//
//  CurrentOrderTableViewCell.h
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CurrentOrderModel;

@interface CurrentOrderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contantView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UIButton *detailsBtn;
@property (weak, nonatomic) IBOutlet UIImageView *commodityImage;
@property (weak, nonatomic) IBOutlet UILabel *commodityName;
@property (weak, nonatomic) IBOutlet UILabel *commodityMsg;
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;
@property (weak, nonatomic) IBOutlet UILabel *quantityLbl;
@property (weak, nonatomic) IBOutlet UIButton *quantityBtn;

@property (strong, nonatomic) CurrentOrderModel *currentOrder;
@end
