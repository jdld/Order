//
//  SignInViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "SignInViewController.h"
#import "TabBarViewController.h"
#import "UITextField+LXExtension.h"
#import <PureLayout/PureLayout.h>
#import <IQKeyboardReturnKeyHandler.h>

@interface SignInViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) IQKeyboardReturnKeyHandler    *returnKeyHandler;
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
    
    [_icon autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_bgIV withOffset:45];
    [_icon autoAlignAxis:ALAxisVertical toSameAxisOfView:_bgIV];
    [_icon autoSetDimension:ALDimensionWidth toSize:75];
    [_icon autoSetDimension:ALDimensionHeight toSize:75];
    
    _titleLbl = [[UILabel alloc]init];
    _titleLbl.text = @"L O G I N";
    _titleLbl.textColor = [UIColor whiteColor];
    _titleLbl.font = [UIFont systemFontOfSize:16];
    _titleLbl.textAlignment = NSTextAlignmentCenter;
    [_bgIV addSubview:_titleLbl];
    
    [_titleLbl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_icon withOffset:5];
    [_titleLbl autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    [_titleLbl autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:_icon withMultiplier:1];
    [_titleLbl autoSetDimension:ALDimensionHeight toSize:30];
    
    _username = [[UITextField alloc]init];
    _username.placeholder = @"Username or Email";
    _username.backgroundColor = [UIColor clearColor];
    _username.textColor = [UIColor whiteColor];
    _username.lx_placeholderColor = [UIColor whiteColor];
    [_bgIV addSubview:_username];
    
    [_username autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [_username autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [_username autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLbl withOffset:65];
    [_username autoSetDimension:ALDimensionHeight toSize:50];
    
    UIView *sepView1 = [[UIView alloc] init];
    sepView1.backgroundColor = UIColorFromRGB(146, 157, 230);
    [_bgIV addSubview:sepView1];
    
    [sepView1 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_username];
    [sepView1 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_username];
    [sepView1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_username withOffset:5];
    [sepView1 autoSetDimension:ALDimensionHeight toSize:1.0f];
    
    _password = [[UITextField alloc]init];
    _password.placeholder = @"PassWorld";
    _password.lx_placeholderColor = [UIColor whiteColor];
    _password.backgroundColor = [UIColor clearColor];
    _password.textColor = [UIColor whiteColor];
    [_bgIV addSubview:_password];
    
    [_password autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sepView1];
    [_password autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:sepView1];
    [_password autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sepView1 withOffset:10];
    [@[_password, _username] autoMatchViewsDimension:ALDimensionHeight];

    
    UIView *sepView2 = [[UIView alloc] init];
    sepView2.backgroundColor = UIColorFromRGB(146, 157, 230);
    [_bgIV addSubview:sepView2];
    
    [sepView2 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_password];
    [sepView2 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_password];
    [sepView2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_password withOffset:5];
    [@[_password, sepView2, sepView1, _username] autoMatchViewsDimension:ALDimensionWidth];
    [sepView2 autoSetDimension:ALDimensionHeight toSize:1.0f];
    
    _signIn = [[UIButton alloc] init];
    _signIn.backgroundColor = [UIColor clearColor];
    _signIn.layer.cornerRadius = 3;
    _signIn.layer.borderWidth = 1;
    _signIn.layer.borderColor = UIColorFromRGB(146, 157, 230).CGColor;
    _signIn.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:20];
    [_signIn setTitle:@"L O G I N" forState:UIControlStateNormal];
    [_signIn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_bgIV addSubview:_signIn];
    
    [_signIn autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sepView2];
    [_signIn autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:sepView2];
    [_signIn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sepView2 withOffset:20];
    [_signIn autoSetDimension:ALDimensionHeight toSize:55];
    
    _dismi = [[UIImageView alloc] init];
    _dismi.image = [UIImage imageNamed:@"dismi"];
    _dismi.clipsToBounds = YES;
    _dismi.userInteractionEnabled = YES;
    _dismi.layer.cornerRadius = 22;
    [_bgIV addSubview:_dismi];
    
    [_dismi autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_bgIV withOffset:15];
    [_dismi autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_bgIV withOffset:30];
    [_dismi autoSetDimension:ALDimensionWidth toSize:44];
    [_dismi autoSetDimension:ALDimensionHeight toSize:44];
}

- (void)eventAction {
    _username.delegate = self;
    _password.delegate = self;
    
    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    self.returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyDone;
    
    [_dismi addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backAction:)]];
    [_signIn addTarget:self action:@selector(signInAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)signInAction {
    TabBarViewController *tab = [[TabBarViewController alloc] init];
    [self presentViewController:tab animated:YES completion:nil];
}

- (void)backAction:(UITapGestureRecognizer *)recognizer {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
