//
//  PaymentDetailsTableViewCell.m
//  Order
//
//  Created by Etong on 16/7/14.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "PaymentDetailsTableViewCell.h"
#import <PureLayout/PureLayout.h>

@implementation PaymentDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"PayCell";
    // 1.缓存中取
    PaymentDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[PaymentDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *cellView = [[UIView alloc] init];
        cellView.backgroundColor = [UIColor whiteColor];
        cellView.layer.cornerRadius = 5;
        cellView.layer.shadowOffset = CGSizeMake(0, 1);
        cellView.layer.shadowOpacity = 0.1;
        [self.contentView addSubview:cellView];
        
        [cellView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [cellView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [cellView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:18];
        [cellView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:18];
        
        UILabel *payment = [[UILabel alloc]init];
        payment.textColor = UIColorFromRGB(50, 122, 229);
        payment.font = UIFont_small;
        payment.text = @"PAYMENT DETAILS:";
        [cellView addSubview:payment];
        
        [payment autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:14];
        [payment autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:14];
        
        UILabel *cardNum = [[UILabel alloc]init];
        cardNum.textColor = UIColorFromRGB(179, 188, 199);
        cardNum.font = UIFont_small;
        cardNum.text = @"Card Number:";
        [cellView addSubview:cardNum];
        
        [cardNum autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:payment];
        [cardNum autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:payment withOffset:14];
        
        UITextField *cardNumTF = [[UITextField alloc] init];
        cardNumTF.secureTextEntry = YES;
        cardNumTF.font = UIFont_mid;
        cardNumTF.text = @"2342 2342 3223 9000";
        [cellView addSubview:cardNumTF];
        
        [cardNumTF autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:cardNum];
        [cardNumTF autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:cardNum withOffset:3];
        [cardNumTF autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        
        UIView *sep1 = [[UIView alloc] init];
        sep1.backgroundColor = UIColorFromRGB(248, 248, 248);
        [cellView addSubview:sep1];
        
        [sep1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:cardNumTF withOffset:5];
        [sep1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        [sep1 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:cardNumTF];
        [sep1 autoSetDimension:ALDimensionHeight toSize:1];
        
        UILabel *expiration = [[UILabel alloc]init];
        expiration.textColor = UIColorFromRGB(179, 188, 199);
        expiration.font = UIFont_small;
        expiration.text = @"Expiration Date:";
        [cellView addSubview:expiration];
        
        [expiration autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sep1];
        [expiration autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sep1 withOffset:12];
        
        UILabel *expirationLbl = [[UILabel alloc] init];
        expirationLbl.font = UIFont_mid;
        expirationLbl.text = @"Choose Date";
        [cellView addSubview:expirationLbl];
        
        [expirationLbl autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:expiration];
        [expirationLbl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:expiration withOffset:3];
        [expirationLbl autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        
        UIView *sep2 = [[UIView alloc] init];
        sep2.backgroundColor = UIColorFromRGB(248, 248, 248);
        [cellView addSubview:sep2];
        
        [sep2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:expirationLbl withOffset:5];
        [sep2 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:expirationLbl];
        [sep2 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:expirationLbl];
        [sep2 autoSetDimension:ALDimensionHeight toSize:1];
        
        UILabel *cvvCode = [[UILabel alloc]init];
        cvvCode.textColor = UIColorFromRGB(179, 188, 199);
        cvvCode.font = UIFont_small;
        cvvCode.text = @"CVV Code";
        [cellView addSubview:cvvCode];
        
        [cvvCode autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sep2];
        [cvvCode autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sep2 withOffset:12];
        
        UITextField *cvvCodeTF = [[UITextField alloc] init];
        cvvCodeTF.font = UIFont_mid;
        cvvCodeTF.text = @"Enter CVV Code";
        [cellView addSubview:cvvCodeTF];
        
        [cvvCodeTF autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:cvvCode];
        [cvvCodeTF autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:cvvCode withOffset:3];
//        [cvvCodeTF autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        
        UITextField *zipCodeTF = [[UITextField alloc] init];
        zipCodeTF.font = UIFont_mid;
        zipCodeTF.text = @"Enter Zip Code";
        [cellView addSubview:zipCodeTF];
        
        [zipCodeTF autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:cvvCodeTF withOffset:12];
        [zipCodeTF autoAlignAxis:ALAxisHorizontal toSameAxisOfView:cvvCodeTF];
        [zipCodeTF autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:sep2];
        [@[cvvCodeTF, zipCodeTF] autoMatchViewsDimension:ALDimensionWidth];
        
        UILabel *zipCode = [[UILabel alloc] init];
        zipCode.textColor = UIColorFromRGB(179, 188, 199);
        zipCode.font = UIFont_small;
        zipCode.text = @"Zip Code";
        [cellView addSubview:zipCode];
        
        [zipCode autoAlignAxis:ALAxisHorizontal toSameAxisOfView:cvvCode];
        [zipCode autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:zipCodeTF];
        
        UIView *sep3 = [[UIView alloc] init];
        sep3.backgroundColor = UIColorFromRGB(248, 248, 248);
        [cellView addSubview:sep3];
        
        [sep3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:cvvCodeTF withOffset:5];
        [sep3 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:cvvCodeTF];
        [sep3 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:cvvCodeTF];
        [sep3 autoSetDimension:ALDimensionHeight toSize:1];
        
        UIView *sep5 = [[UIView alloc] init];
        sep5.backgroundColor = UIColorFromRGB(248, 248, 248);
        [cellView addSubview:sep5];
        
        [sep5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:zipCodeTF withOffset:5];
        [sep5 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:zipCodeTF];
        [sep5 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:zipCodeTF];
        [sep5 autoSetDimension:ALDimensionHeight toSize:1];
        
        UILabel *fullName = [[UILabel alloc]init];
        fullName.textColor = UIColorFromRGB(179, 188, 199);
        fullName.font = UIFont_small;
        fullName.text = @"Full Name";
        [cellView addSubview:fullName];
        
        [fullName autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sep3];
        [fullName autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sep3 withOffset:12];
        
        UITextField *FullNameTF = [[UITextField alloc] init];
        FullNameTF.font = UIFont_mid;
        FullNameTF.text = @"Matthew Robertson";
        [cellView addSubview:FullNameTF];
        
        [FullNameTF autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:fullName];
        [FullNameTF autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:fullName withOffset:3];
        [FullNameTF autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        
        UIView *sep4 = [[UIView alloc] init];
        sep4.backgroundColor = UIColorFromRGB(248, 248, 248);
        [cellView addSubview:sep4];
        
        [sep4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:FullNameTF withOffset:5];
        [sep4 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:FullNameTF];
        [sep4 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:FullNameTF];
        [sep4 autoSetDimension:ALDimensionHeight toSize:1];
        
        UIButton *expirationBtn = [[UIButton alloc] init];
        [expirationBtn setBackgroundImage:[UIImage imageNamed:@"enter"] forState:UIControlStateNormal];
        [cellView addSubview:expirationBtn];
        
        [expirationBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        [expirationBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:expirationLbl withOffset: - 10];
    }
    return self;
}

@end
