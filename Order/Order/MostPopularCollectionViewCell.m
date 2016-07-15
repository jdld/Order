//
//  MostPopularCollectionViewCell.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "MostPopularCollectionViewCell.h"
#import "DealsModel.h"
#import <PureLayout/PureLayout.h>

@implementation MostPopularCollectionViewCell

- (void)setBuynowBtn:(UIButton *)buynowBtn {
    buynowBtn.layer.cornerRadius = 5;
    buynowBtn.layer.borderColor = UIColorFromRGB(50, 122, 220).CGColor;
    buynowBtn.layer.borderWidth = 2;
    _headImage.layer.cornerRadius = 5;
}

- (void)setDeals:(DealsModel *)deals {
    _headImage.image = [UIImage imageNamed:deals.headImage];
    _titleLbl.text = deals.title;
    _titleLbl.font = UIFont_mid;
    _detailsTitleLbl.text = deals.detailsTitle;
    _detailsTitleLbl.font = UIFont_small;
    _priceLbl.text = deals.price;
    _priceLbl.font = UIFont_big;
}

@end
