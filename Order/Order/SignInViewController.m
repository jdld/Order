//
//  SignInViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
    [self UIAutoLaout];
    [self eventAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)UIAutoLaout {
    _bg2 = [[UIImageView alloc] initWithFrame:self.view.frame];
    _bg2.image = [UIImage imageNamed:@"2bg"];
    [self.view addSubview:_bg2];
    
    _bg1 = [[UIImageView alloc] initWithFrame:self.view.frame];
    _bg1.image = [UIImage imageNamed:@"1bg"];
    [self.view addSubview:_bg1];
    
    _bgIV = [[UIView alloc] init];
    _bgIV = [Utilities effectViewWithFrame:self.view.frame];
    [self.view addSubview:_bgIV];
    
    _bgIVImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    _bgIVImage.image = [UIImage imageNamed:@"bgIVImage"];
    [_bgIV addSubview:_bgIVImage];
}

- (void)eventAction {

}

@end
