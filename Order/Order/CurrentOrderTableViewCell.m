//
//  CurrentOrderTableViewCell.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "CurrentOrderTableViewCell.h"
#import "CurrentOrderModel.h"

@implementation CurrentOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setCurrentOrder:(CurrentOrderModel *)currentOrder {
    _photoImage.image = [UIImage imageNamed:currentOrder.headImage];
    _nickname.text = currentOrder.nickname;
    _commodityImage.image = [UIImage imageNamed:currentOrder.commodityImage];
    _commodityName.text = currentOrder.commodityName;
    _commodityMsg.text = currentOrder.commodityMsg;
    _priceLbl.text = currentOrder.price;
    _quantityLbl.text = currentOrder.quantity;
}

@end
