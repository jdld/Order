//
//  SignUpViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "SignUpViewController.h"
#import "SignInViewController.h"
#import "UITextField+LXExtension.h"
#import <PureLayout/PureLayout.h>
#import <IQKeyboardReturnKeyHandler.h>

@interface SignUpViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) IQKeyboardReturnKeyHandler    *returnKeyHandler;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self UIAutoLaout];
    [self eventAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.returnKeyHandler = nil;
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
    
    _icon = [[UIImageView alloc] init];
    _icon.image = [UIImage imageNamed:@"icon"];
    [_bgIV addSubview:_icon];
    
    [_icon autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_bgIV withOffset:fitScreenHeight(35)];
    [_icon autoAlignAxis:ALAxisVertical toSameAxisOfView:_bgIV];
    [_icon autoSetDimension:ALDimensionWidth toSize:fitScreenWidth(60)];
    [_icon autoSetDimension:ALDimensionHeight toSize:fitScreenWidth(60)];
    
    _titleLbl = [[UILabel alloc]init];
    _titleLbl.text = @"REGISTER";
    _titleLbl.textColor = [UIColor whiteColor];
    _titleLbl.font = UIFont_mid;
    _titleLbl.textAlignment = NSTextAlignmentCenter;
    [_bgIV addSubview:_titleLbl];
    
    [_titleLbl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_icon withOffset:fitScreenHeight(4)];
    [_titleLbl autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [_titleLbl autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:_icon withMultiplier:1];
    [_titleLbl autoSetDimension:ALDimensionHeight toSize:fitScreenHeight(24)];
    
    _username = [[UITextField alloc]init];
    _username.placeholder = @"Input Username";
    _username.backgroundColor = [UIColor clearColor];
    _username.textColor = [UIColor whiteColor];
    _username.lx_placeholderColor = [UIColor whiteColor];
    [_bgIV addSubview:_username];
    
    [_username autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:fitScreenWidth(24)];
    [_username autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:fitScreenWidth(24)];
    [_username autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLbl withOffset:fitScreenHeight(51)];
    [_username autoSetDimension:ALDimensionHeight toSize:fitScreenHeight(39)];
    
    UIView *sepView1 = [[UIView alloc] init];
    sepView1.backgroundColor = UIColorFromRGB(146, 157, 230);
    [_bgIV addSubview:sepView1];
    
    [sepView1 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_username];
    [sepView1 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_username];
    [sepView1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_username withOffset:fitScreenHeight(4)];
    [sepView1 autoSetDimension:ALDimensionHeight toSize:1.0f];
    
    _email = [[UITextField alloc]init];
    _email.placeholder = @"Input E-MAIL";
    _email.lx_placeholderColor = [UIColor whiteColor];
    _email.backgroundColor = [UIColor clearColor];
    _email.textColor = [UIColor whiteColor];
    [_bgIV addSubview:_email];
    
    [_email autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sepView1];
    [_email autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:sepView1];
    [_email autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sepView1 withOffset:fitScreenHeight(8)];
    
    UIView *sepView2 = [[UIView alloc] init];
    sepView2.backgroundColor = UIColorFromRGB(146, 157, 230);
    [_bgIV addSubview:sepView2];
    
    [sepView2 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_email];
    [sepView2 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_email];
    [sepView2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_email withOffset:fitScreenHeight(4)];
    
    _password = [[UITextField alloc]init];
    _password.placeholder = @"Input PassWorld";
    _password.lx_placeholderColor = [UIColor whiteColor];
    _password.backgroundColor = [UIColor clearColor];
    _password.textColor = [UIColor whiteColor];
    [_bgIV addSubview:_password];
    
    [_password autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sepView2];
    [_password autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:sepView2];
    [_password autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sepView2 withOffset:fitScreenHeight(8)];
    
    UIView *sepView3 = [[UIView alloc] init];
    sepView3.backgroundColor = UIColorFromRGB(146, 157, 230);
    [_bgIV addSubview:sepView3];
    
    [sepView3 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_password];
    [sepView3 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_password];
    [sepView3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_password withOffset:fitScreenHeight(4)];
    
    _verPwd = [[UITextField alloc]init];
    _verPwd.placeholder = @"Verify Input PassWorld";
    _verPwd.lx_placeholderColor = [UIColor whiteColor];
    _verPwd.backgroundColor = [UIColor clearColor];
    _verPwd.textColor = [UIColor whiteColor];
    [_bgIV addSubview:_verPwd];
    
    [_verPwd autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sepView3];
    [_verPwd autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:sepView3];
    [_verPwd autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sepView3 withOffset:fitScreenHeight(8)];
    
    UIView *sepView4 = [[UIView alloc] init];
    sepView4.backgroundColor = UIColorFromRGB(146, 157, 230);
    [_bgIV addSubview:sepView4];
    
    [sepView4 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_verPwd];
    [sepView4 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_verPwd];
    [sepView4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_verPwd withOffset:fitScreenHeight(4)];
    
    [@[_password, _username, _email, _verPwd] autoMatchViewsDimension:ALDimensionHeight];
    [@[_password, sepView2, sepView1, sepView3, sepView4, _username, _email, _verPwd] autoMatchViewsDimension:ALDimensionWidth];
    [@[sepView1, sepView2, sepView3, sepView4] autoMatchViewsDimension:ALDimensionHeight];
    
    
    _signUp = [[UIButton alloc] init];
    _signUp.backgroundColor = [UIColor clearColor];
    _signUp.layer.cornerRadius = 3;
    _signUp.layer.borderWidth = 1;
    _signUp.layer.borderColor = UIColorFromRGB(146, 157, 230).CGColor;
    _signUp.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:20];
    [_signUp setTitle:@"R E G I S T E R" forState:UIControlStateNormal];
    [_signUp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_bgIV addSubview:_signUp];
    
    [_signUp autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sepView4];
    [_signUp autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:sepView4];
    [_signUp autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sepView4 withOffset:fitScreenHeight(18)];
    [_signUp autoSetDimension:ALDimensionHeight toSize:fitScreenHeight(42)];
    
    _dismi = [[UIImageView alloc] init];
    _dismi.image = [UIImage imageNamed:@"dismi"];
    _dismi.clipsToBounds = YES;
    _dismi.userInteractionEnabled = YES;
    _dismi.layer.cornerRadius = fitScreenWidth(33) / 2;
    [_bgIV addSubview:_dismi];
    
    [_dismi autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_bgIV withOffset:fitScreenWidth(11)];
    [_dismi autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_bgIV withOffset:fitScreenHeight(24)];
    [_dismi autoSetDimension:ALDimensionWidth toSize:fitScreenWidth(33)];
    [_dismi autoSetDimension:ALDimensionHeight toSize:fitScreenWidth(33)];
}

- (void)eventAction {
    _username.delegate = self;
    _email.delegate = self;
    _password.delegate = self;
    _verPwd.delegate = self;
    
    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    self.returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyDone;
    
    [_dismi addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backAction:)]];
    [_signUp addTarget:self action:@selector(signUpAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)signUpAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)backAction:(UITapGestureRecognizer *)recognizer {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
