//
//  MostPopularCollectionViewCell.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "MostPopularCollectionViewCell.h"
#import "DealsModel.h"

@implementation MostPopularCollectionViewCell

- (void)setBuynowBtn:(UIButton *)buynowBtn {
    buynowBtn.layer.cornerRadius = 5;
    buynowBtn.layer.borderColor = UIColorFromRGB(50, 122, 220).CGColor;
    buynowBtn.layer.borderWidth = 2;
}

- (void)setDeals:(DealsModel *)deals {
    _headImage.backgroundColor = [UIColor lightGrayColor];
    _titleLbl.text = deals.title;
    _detailsTitleLbl.text = deals.detailsTitle;
    _priceLbl.text = deals.price;
}

@end
