//
//  OtherViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "OtherViewController.h"
#import "SignInViewController.h"
#import "SignUpViewController.h"
#import <PureLayout/PureLayout.h>
#import "TabBarViewController.h"
@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    _icon = [[UIImageView alloc] initWithFrame:CGRectMake(UI_SCREEN_W / 2 - 60, UI_SCREEN_H / 8, 120, 120)];
    _icon.image = [UIImage imageNamed:@"icon"];
    [self.view addSubview:_icon];
    
    _iconName = [[UILabel alloc]init];
    _iconName.text = @"Order";
    _iconName.textColor = [UIColor whiteColor];
    _iconName.font = [UIFont systemFontOfSize:28];
    _iconName.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_iconName];
    
    [_iconName autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_icon withOffset:5];
    [_iconName autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [_iconName autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:_icon withMultiplier:1];
    [_iconName autoSetDimension:ALDimensionHeight toSize:44];
    
    _detail = [[UILabel alloc]init];
    _detail.text = @"Be part of a great shopping experience.";
    _detail.textColor = [UIColor whiteColor];
    _detail.font = [UIFont systemFontOfSize:28];
    _detail.textAlignment = NSTextAlignmentCenter;
    _detail.numberOfLines = 0;
    [self.view addSubview:_detail];
    [_detail autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [_detail autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.view];
    [_detail autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:65];
//    [_detail autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view withOffset:50];
    
    _login = [[UIButton alloc]init];
    _login.backgroundColor = UIColorFromRGB(118, 160, 226);
    [_login setTitle:@"L O G I N" forState:UIControlStateNormal];
    [_login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _login.layer.borderWidth = 1;
    _login.layer.borderColor = UIColorFromRGB(175, 200, 240).CGColor;
    _login.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:16];
    [self.view addSubview:_login];
    
    [_login autoConstrainAttribute:ALAttributeLeft toAttribute:ALAttributeLeft ofView:self.view];
    [_login autoConstrainAttribute:ALAttributeBottom toAttribute:ALAttributeBottom ofView:self.view];
    [_login autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:self.view withMultiplier:0.5];
    [_login autoSetDimension:ALDimensionHeight toSize:60];


    _signUp = [[UIButton alloc]init];
    _signUp.backgroundColor = UIColorFromRGB(118, 160, 226);
    [_signUp setTitle:@"S I G N  U P" forState:UIControlStateNormal];
    [_signUp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _signUp.layer.borderWidth = 1;
    _signUp.layer.borderColor = UIColorFromRGB(175, 200, 240).CGColor;
    _signUp.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:16];
    [self.view addSubview:_signUp];
    
    [_signUp autoConstrainAttribute:ALAttributeLeft toAttribute:ALAttributeRight ofView:_login];
    [_signUp autoConstrainAttribute:ALAttributeBottom toAttribute:ALAttributeBottom ofView:self.view];
    [_signUp autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:_login withMultiplier:1];
    [_signUp autoConstrainAttribute:ALAttributeHeight toAttribute:ALAttributeHeight ofView:_login withMultiplier:1];

    _otherConnect = [[UIButton alloc]init];
    _otherConnect.backgroundColor = UIColorFromRGB(118, 160, 226);
    [_otherConnect setTitle:@"C O N N E C T  W I T H  Q Q" forState:UIControlStateNormal];
    [_otherConnect setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _otherConnect.layer.borderWidth = 1;
    _otherConnect.layer.borderColor = UIColorFromRGB(175, 200, 240).CGColor;
    _otherConnect.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:16];
    [self.view addSubview:_otherConnect];
    
    [_otherConnect autoConstrainAttribute:ALAttributeBottom toAttribute:ALAttributeTop ofView:_login];
    [_otherConnect autoConstrainAttribute:ALAttributeLeft toAttribute:ALAttributeLeft ofView:self.view];
    [_otherConnect autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:self.view withMultiplier:1];
    [_otherConnect autoConstrainAttribute:ALAttributeHeight toAttribute:ALAttributeHeight ofView:_login withMultiplier:1];
}

- (void)eventAction {
    [_login addTarget:self action:@selector(enterLogin) forControlEvents:UIControlEventTouchUpInside];
    [_signUp addTarget:self action:@selector(enterSignUp) forControlEvents:UIControlEventTouchUpInside];
}

- (void)enterLogin {
    SignInViewController *siVC = [[SignInViewController alloc] init];
    [self presentViewController:siVC animated:YES completion:nil];
}

- (void)enterSignUp {
//    SignUpViewController *suVC = [[SignUpViewController alloc] init];
//    [self presentViewController:suVC animated:YES completion:nil];
    TabBarViewController *TabBar = [Utilities getStoryboardInstanceByIdentity:@"TabBar" byIdentity:@"TabBar"];
    [self presentViewController:TabBar animated:YES completion:nil];
}

@end
