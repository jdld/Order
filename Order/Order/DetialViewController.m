//
//  DetialViewController.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "DetialViewController.h"

@interface DetialViewController (){
    CGSize size;
}
@property (strong, nonatomic)UIImageView *check;

@end

@implementation DetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _questionBut.layer.borderWidth = 1;
    _questionBut.layer.borderColor = [UIColor colorWithRed:50.f/255.f green:122.f/255.f blue:229.f/255.f alpha:1].CGColor;
    _questionBut.layer.cornerRadius = 2;
    _purchaseBut.layer.cornerRadius = 2;
    
    size = _color1.frame.size;
    
    self.title = @"Product Details";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UITapGestureRecognizer*tapGesture1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(colorOne)];
    [_color1 addGestureRecognizer:tapGesture1];
    UITapGestureRecognizer*tapGesture2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(colorTwo)];
    [_color2 addGestureRecognizer:tapGesture2];
    UITapGestureRecognizer*tapGesture3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(colorThree)];
    [_color3 addGestureRecognizer:tapGesture3];
    UITapGestureRecognizer*tapGesture4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(colorFour)];
    [_color4 addGestureRecognizer:tapGesture4];
    UITapGestureRecognizer*tapGesture5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(colorFive)];
    [_color5 addGestureRecognizer:tapGesture5];
    
    _check = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"checkmark"]];
    _check.contentMode = UIViewContentModeScaleAspectFit;
    _check.frame = CGRectMake(size.width/2 - 10, size.height/2 - 12, 20, 24);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)colorOne {
    
    [_color1 addSubview:_check];
}

- (void)colorTwo {
    [_color2 addSubview:_check];
}

- (void)colorThree {
    [_color3 addSubview:_check];
}

- (void)colorFour {
    [_color4 addSubview:_check];
}

- (void)colorFive {
    [_color5 addSubview:_check];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
