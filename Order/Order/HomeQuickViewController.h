//
//  HomeQuickViewController.h
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeQuickViewController : UIViewController
- (IBAction)backAction:(UIButton *)sender forEvent:(UIEvent *)event;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *detialLab;

@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;


@property (weak, nonatomic) IBOutlet UIView *backview1;
@property (weak, nonatomic) IBOutlet UIView *backView2;
@property (weak, nonatomic) IBOutlet UIImageView *shopIV1;
@property (weak, nonatomic) IBOutlet UIImageView *shopIV2;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLab1;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLab2;
@property (weak, nonatomic) IBOutlet UILabel *numberLab1;
@property (weak, nonatomic) IBOutlet UILabel *numberLab2;
@property (weak, nonatomic) IBOutlet UIButton *shopBut1;
@property (weak, nonatomic) IBOutlet UIButton *shopBut2;
@property (weak, nonatomic) IBOutlet UIButton *followBut;

@property ( nonatomic) NSInteger *index;

@end
