//
//  DetialViewController.h
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@end
