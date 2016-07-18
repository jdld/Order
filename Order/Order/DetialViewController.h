//
//  DetialViewController.h
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WPHotspotLabel;

@interface DetialViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *questionBut;
@property (weak, nonatomic) IBOutlet UIButton *purchaseBut;

@property (weak, nonatomic) IBOutlet UIView *color1;
@property (weak, nonatomic) IBOutlet UIView *color2;
@property (weak, nonatomic) IBOutlet UIView *color3;
@property (weak, nonatomic) IBOutlet UIView *color4;
@property (weak, nonatomic) IBOutlet UIView *color5;

- (IBAction)questionAction:(UIButton *)sender forEvent:(UIEvent *)event;
- (IBAction)purchaseAction:(UIButton *)sender forEvent:(UIEvent *)event;

@property (weak, nonatomic) IBOutlet UILabel *numberLab;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *detialLab;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet WPHotspotLabel *textLab;

@property (strong, nonatomic) NSDictionary *dict;

@end
