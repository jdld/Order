//
//  PopularTableViewCell.h
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopularTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *popularLayerIV;
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIButton *followBut;

@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;

- (void)start:(int)score;
@end
