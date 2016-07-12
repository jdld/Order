//
//  AskQuestionViewController.h
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AskQuestionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *detialLab;


- (IBAction)sendAction:(UIButton *)sender forEvent:(UIEvent *)event;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end
