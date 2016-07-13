//
//  ReviewTableViewCell.m
//  Order
//
//  Created by Etong on 16/7/13.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "ReviewTableViewCell.h"
#import "CurrentOrderModel.h"
#import <PureLayout/PureLayout.h>

@interface ReviewTableViewCell ()

@property (strong, nonatomic) UIImageView *commodityImage;
@property (strong, nonatomic) UILabel *commodityName;
@property (strong, nonatomic) UILabel *commodityMsg;
@property (strong, nonatomic) UILabel *priceLbl;
@property (strong, nonatomic) UILabel *quantityLbl;
@property (strong, nonatomic) UIButton *quantityBtn;

@end

@implementation ReviewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"Cell";
     // 1.缓存中取
     ReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[ReviewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _commodityImage = [[UIImageView alloc]init];
        _commodityImage.layer.cornerRadius = 5;
        _commodityImage.layer.borderWidth = 1;
        _commodityImage.layer.borderColor = UIColorFromRGB(248, 248, 248).CGColor;
        [self.contentView addSubview:_commodityImage];
        
        [_commodityImage autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:14];
        [_commodityImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:14];
        [_commodityImage autoSetDimension:ALDimensionWidth toSize:50];
        [_commodityImage autoSetDimension:ALDimensionHeight toSize:50];
        
        _commodityName = [[UILabel alloc] init];
        _commodityName.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_commodityName];
        
        [_commodityName autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:16];
        [_commodityName autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_commodityImage withOffset:14];
        
        /*
         以下代码报错
         */
        
        _commodityMsg = [[UILabel alloc] init];
        _commodityMsg.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_commodityName];
        
        [_commodityMsg autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_commodityName];
        [_commodityMsg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_commodityName withOffset:5];
        
        _priceLbl = [[UILabel alloc] init];
        _priceLbl.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_priceLbl];
        
        [_priceLbl autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_commodityMsg];
        [_priceLbl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_commodityMsg withOffset:10];
        
        _quantityBtn = [[UIButton alloc] init];
        [self.contentView addSubview:_quantityBtn];
        
        [_quantityBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        [_quantityBtn autoAlignAxis:ALAxisVertical toSameAxisOfView:_priceLbl];
        
        _quantityLbl = [[UILabel alloc] init];
        _quantityLbl.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_quantityLbl];
        
        [_quantityLbl autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_quantityBtn withOffset:2];
        [_quantityLbl autoAlignAxis:ALAxisVertical toSameAxisOfView:_quantityBtn];
        
        UILabel *quantity = [[UILabel alloc] init];
        quantity.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:quantity];
        
        [quantity autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_quantityLbl withOffset:1];
        [quantity autoAlignAxis:ALAxisVertical toSameAxisOfView:_quantityLbl];
        
        UIView *sepView = [[UIView alloc] init];
        sepView.backgroundColor = UIColorFromRGB(248, 248, 248);
        [self.contentView addSubview:sepView];
        
        [sepView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:14];
        [sepView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        [sepView autoSetDimension:ALDimensionHeight toSize:1];
        
    }
    return self;
}

- (void)setCurrentOrder:(CurrentOrderModel *)currentOrder {
    _commodityImage.image = [UIImage imageNamed:currentOrder.headImage];
    _commodityName.text = currentOrder.commodityName;
    _commodityMsg.text = currentOrder.commodityMsg;
    _priceLbl.text = currentOrder.price;
    _quantityLbl.text = currentOrder.quantity;
}

@end
