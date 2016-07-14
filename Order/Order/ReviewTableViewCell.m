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
        self.backgroundColor = [UIColor clearColor];
        
        UIView *cellView = [[UIView alloc] init];
        cellView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:cellView];
        
        [cellView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [cellView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [cellView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:18];
        [cellView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:18];
        
        _commodityImage = [[UIImageView alloc]init];
        _commodityImage.layer.cornerRadius = 5;
        _commodityImage.layer.borderWidth = 1;
        _commodityImage.layer.borderColor = UIColorFromRGB(248, 248, 248).CGColor;
        _commodityImage.clipsToBounds = YES;
        [cellView addSubview:_commodityImage];
        
        [_commodityImage autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:14];
        [_commodityImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:14];
        [_commodityImage autoSetDimension:ALDimensionWidth toSize:100];
        [_commodityImage autoSetDimension:ALDimensionHeight toSize:100];
        
        _commodityName = [[UILabel alloc] init];
        _commodityName.font = UIFont_mid;
        [cellView addSubview:_commodityName];
        
        [_commodityName autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:16];
        [_commodityName autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_commodityImage withOffset:14];
        
        _commodityMsg = [[UILabel alloc] init];
        _commodityMsg.font = UIFont_small;
        [cellView addSubview:_commodityMsg];
        
        [_commodityMsg autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_commodityName];
        [_commodityMsg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_commodityName withOffset:5];
        
        _priceLbl = [[UILabel alloc] init];
        _priceLbl.font = UIFont_big;
        [cellView addSubview:_priceLbl];
        
        [_priceLbl autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_commodityMsg];
        [_priceLbl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_commodityMsg withOffset:10];
        
        _quantityBtn = [[UIButton alloc] init];
        _quantityBtn.titleLabel.font = UIFont_mid;
        _quantityBtn.layer.shadowColor = UIColorFromRGB(179, 188, 199).CGColor;
        _quantityBtn.layer.shadowOffset = CGSizeMake(0, 1);
        _quantityBtn.layer.shadowOpacity = 0.1f;
        [cellView addSubview:_quantityBtn];
        
        [_quantityBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        [_quantityBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_priceLbl];
        
        _quantityLbl = [[UILabel alloc] init];
        _quantityLbl.font = UIFont_small;
        [cellView addSubview:_quantityLbl];
        
        [_quantityLbl autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_quantityBtn withOffset:3];
        [_quantityLbl autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_quantityBtn];
        
        UILabel *quantity = [[UILabel alloc] init];
        quantity.font = UIFont_small;
        quantity.text = @"quantity:";
        quantity.textColor = UIColorFromRGB(179, 188, 199);
        [cellView addSubview:quantity];
        
        [quantity autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_quantityLbl withOffset:3];
        [quantity autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_quantityLbl];
        
        UIView *sepView = [[UIView alloc] init];
        sepView.backgroundColor = UIColorFromRGB(248, 248, 248);
        [cellView addSubview:sepView];
        
        [sepView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:14];
        [sepView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        [sepView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_commodityImage withOffset:14];
        [sepView autoSetDimension:ALDimensionHeight toSize:1];
        
    }
    return self;
}

- (void)setCurrentOrder:(CurrentOrderModel *)currentOrder {
    [_quantityBtn setTitle:@"∨" forState:UIControlStateNormal];
    [_quantityBtn setTitleColor:UIColorFromRGB(179, 188, 199) forState:UIControlStateNormal];
    _commodityImage.image = [UIImage imageNamed:currentOrder.commodityImage];
    _commodityName.text = currentOrder.commodityName;
    _commodityMsg.text = currentOrder.commodityMsg;
    _commodityMsg.textColor = UIColorFromRGB(179, 188, 199);
    _priceLbl.text = currentOrder.price;
    _quantityLbl.text = currentOrder.quantity;
    _quantityLbl.textColor = UIColorFromRGB(50, 122, 229);
}

@end
