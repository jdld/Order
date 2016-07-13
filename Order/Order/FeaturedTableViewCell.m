//
//  FeaturedTableViewCell.m
//  Order
//
//  Created by Etong on 16/7/13.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "FeaturedTableViewCell.h"

@implementation FeaturedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _backView.layer.cornerRadius = 5;
    _popularLayerIV.layer.borderWidth = 2;
    _popularLayerIV.layer.borderColor = [UIColor whiteColor].CGColor;
    _popularLayerIV.layer.cornerRadius = 40;
    
    _layerView.layer.cornerRadius = 40;
    _layerView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _layerView.layer.shadowOffset = CGSizeMake(0, 1.5);
    _layerView.layer.shadowOpacity = YES;
    
    _followBut.layer.borderColor = [UIColor colorWithRed:0.f/255.f green:122.f/255.f blue:255.f/255.f alpha:1].CGColor;
    _followBut.layer.borderWidth = 1;
    _followBut.layer.cornerRadius = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    
}

- (void)start:(int)score {
    for (int i = 0; i <= score ; i++) {
        if (i == 1) {
            [_star1 setImage:[UIImage imageNamed:@"star1-2"] forState:UIControlStateNormal];
        }else if (i == 2){
            [_star2 setImage:[UIImage imageNamed:@"star1-2"] forState:UIControlStateNormal];
        }else if (i == 3){
            [_star3 setImage:[UIImage imageNamed:@"star1-2"] forState:UIControlStateNormal];
        }else if (i == 4){
            [_star4 setImage:[UIImage imageNamed:@"star1-2"] forState:UIControlStateNormal];
        }else if (i == 5){
            [_star5 setImage:[UIImage imageNamed:@"star1-2"] forState:UIControlStateNormal];
        }
    }
}

@end
