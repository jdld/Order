//
//  ShippingDetailsViewController.m
//  Order
//
//  Created by Etong on 16/7/13.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "ShippingDetailsViewController.h"
#import <IQKeyboardReturnKeyHandler.h>
#import <PureLayout/PureLayout.h>

@interface ShippingDetailsViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) UIScrollView *scrollview;
@property (strong, nonatomic) UIView *view1;
@property (strong, nonatomic) UIView *view2;
@property (strong, nonatomic) UIButton *saveBtn;

@property (strong, nonatomic) UITextField *firstNameTF;
@property (strong, nonatomic) UITextField *lastNameTF;
@property (strong, nonatomic) UITextField *emailTF;
@property (strong, nonatomic) UITextField *phoneTF;

@property (strong, nonatomic) UITextField *addressTF;
@property (strong, nonatomic) UITextField *postalCodeTF;
@property (strong, nonatomic) UILabel *countryLbl;
@property (strong, nonatomic) UILabel *cityLbl;
@property (strong, nonatomic) UIButton *countryBtn;
@property (strong, nonatomic) UIButton *cityBtn;

@property (nonatomic, strong) IQKeyboardReturnKeyHandler    *returnKeyHandler;
@end

@implementation ShippingDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    _scrollview.frame = CGRectMake(0, 0, UI_SCREEN_W, self.view.frame.size.height);
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    CGRect rectNav = self.navigationController.navigationBar.frame;
    [_scrollview autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_scrollview autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_scrollview autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_scrollview autoSetDimension:ALDimensionHeight toSize: UI_SCREEN_H - (rectStatus.size.height + rectNav.size.height + 36)];
    
    _scrollview.contentSize = CGSizeMake(UI_SCREEN_W, _view1.frame.size.height + _view2.frame.size.height + _saveBtn.frame.size.height + 60);
}

- (void)UIAutoLaout {
    _scrollview = [[UIScrollView alloc] init];
    _scrollview.backgroundColor = UIColorFromRGB(248, 248, 248);
    _scrollview.pagingEnabled = NO;
    _scrollview.scrollEnabled = YES;
    _scrollview.showsHorizontalScrollIndicator = NO;
//    _scrollview.contentSize = CGSizeMake(UI_SCREEN_W, _view1.frame.size.height + _view2.frame.size.height + _saveBtn.frame.size.height + 60);
    [self.view addSubview:_scrollview];
    
    
    
    _view1 = [[UIView alloc]init];
    _view1.layer.cornerRadius = 5;
    _view1.layer.shadowOffset = CGSizeMake(0, 1);
    _view1.layer.shadowOpacity = 0.1f;
    _view1.backgroundColor = [UIColor whiteColor];
    [_scrollview addSubview:_view1];
    [self view1AutoLaout];
//设置与顶部导航条的距离
//    [_view1 autoPinToTopLayoutGuideOfViewController:self withInset:10];

    [_view1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [_view1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
//    [_view1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_view1 autoSetDimension:ALDimensionHeight toSize:260];
    [_view1 autoSetDimension:ALDimensionWidth toSize:UI_SCREEN_W - 30];
    
    _view2 = [[UIView alloc]init];
    _view2.layer.cornerRadius = 5;
    _view2.layer.shadowOffset = CGSizeMake(0, 1);
    _view2.layer.shadowOpacity = 0.1f;
    _view2.backgroundColor = [UIColor whiteColor];
    [_scrollview addSubview:_view2];
    [self view2AutoLaout];
    
    [_view2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_view1 withOffset:15];
    [_view2 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_view1];
    [_view2 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_view1];
    [@[_view1, _view2] autoMatchViewsDimension:ALDimensionHeight];
    
    _saveBtn = [[UIButton alloc] init];
    _saveBtn.backgroundColor = [UIColor clearColor];
    _saveBtn.layer.cornerRadius = 5;
    _saveBtn.layer.borderWidth = 1;
    _saveBtn.layer.borderColor = UIColorFromRGB(50, 122, 229).CGColor;
    _saveBtn.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:16];
    [_saveBtn setTitle:@"SAVE AND SHIP HERE" forState:UIControlStateNormal];
    [_saveBtn setTitleColor:UIColorFromRGB(50, 122, 229) forState:UIControlStateNormal];
    [_scrollview addSubview:_saveBtn];
    
    [_saveBtn autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_view2];
    [_saveBtn autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_view2];
    [_saveBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_view2 withOffset:15];
    [_saveBtn autoSetDimension:ALDimensionHeight toSize:44];
    
}

- (void)view1AutoLaout {
    UILabel *personal = [[UILabel alloc]init];
    personal.textColor = UIColorFromRGB(50, 122, 229);
    personal.font = [UIFont systemFontOfSize:12];
    personal.text = @"PERSONAL DETAILS:";
    [_view1 addSubview:personal];
    
    [personal autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [personal autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:14];
    
    UILabel *firstname = [[UILabel alloc]init];
    firstname.textColor = UIColorFromRGB(179, 188, 199);
    firstname.font = [UIFont systemFontOfSize:10];
    firstname.text = @"First Name:";
    [_view1 addSubview:firstname];
    
    [firstname autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:personal];
    [firstname autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:personal withOffset:12];
    
    _firstNameTF = [[UITextField alloc] init];
    _firstNameTF.text = @"Matthew Jonathan";
    [_view1 addSubview:_firstNameTF];
    
    [_firstNameTF autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:firstname];
    [_firstNameTF autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:firstname withOffset:3];
    [_firstNameTF autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
    
    UIView *sep1 = [[UIView alloc] init];
    sep1.backgroundColor = UIColorFromRGB(248, 248, 248);
    [_view1 addSubview:sep1];
    
    [sep1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_firstNameTF withOffset:5];
    [sep1 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_firstNameTF];
    [sep1 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_firstNameTF];
    [sep1 autoSetDimension:ALDimensionHeight toSize:1];
    
    UILabel *lastname = [[UILabel alloc]init];
    lastname.textColor = UIColorFromRGB(179, 188, 199);
    lastname.font = [UIFont systemFontOfSize:10];
    lastname.text = @"Last Name:";
    [_view1 addSubview:lastname];
    
    [lastname autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sep1];
    [lastname autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sep1 withOffset:12];
    
    _lastNameTF = [[UITextField alloc] init];
    _lastNameTF.text = @"Robertson";
    [_view1 addSubview:_lastNameTF];
    
    [_lastNameTF autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:lastname];
    [_lastNameTF autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:lastname withOffset:3];
    [_lastNameTF autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
    
    UIView *sep2 = [[UIView alloc] init];
    sep2.backgroundColor = UIColorFromRGB(248, 248, 248);
    [_view1 addSubview:sep2];
    
    [sep2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lastNameTF withOffset:5];
    [sep2 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_lastNameTF];
    [sep2 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_lastNameTF];
    [sep2 autoSetDimension:ALDimensionHeight toSize:1];

    UILabel *email = [[UILabel alloc]init];
    email.textColor = UIColorFromRGB(179, 188, 199);
    email.font = [UIFont systemFontOfSize:10];
    email.text = @"Email Address:";
    [_view1 addSubview:email];
    
    [email autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sep2];
    [email autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sep2 withOffset:12];
    
    _emailTF = [[UITextField alloc] init];
    _emailTF.text = @"matthew.j.robertson@mail.com";
    [_view1 addSubview:_emailTF];
    
    [_emailTF autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:email];
    [_emailTF autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:email withOffset:3];
    [_emailTF autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
    
    UIView *sep3 = [[UIView alloc] init];
    sep3.backgroundColor = UIColorFromRGB(248, 248, 248);
    [_view1 addSubview:sep3];
    
    [sep3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_emailTF withOffset:5];
    [sep3 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_emailTF];
    [sep3 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_emailTF];
    [sep3 autoSetDimension:ALDimensionHeight toSize:1];
    
    UILabel *phone = [[UILabel alloc]init];
    phone.textColor = UIColorFromRGB(179, 188, 199);
    phone.font = [UIFont systemFontOfSize:10];
    phone.text = @"Phone Number:";
    [_view1 addSubview:phone];
    
    [phone autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sep3];
    [phone autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sep3 withOffset:12];
    
    _phoneTF = [[UITextField alloc] init];
    _phoneTF.text = @"Enter phone number";
    [_view1 addSubview:_phoneTF];
    
    [_phoneTF autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:phone];
    [_phoneTF autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:phone withOffset:3];
    [_phoneTF autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
    
    UIView *sep4 = [[UIView alloc] init];
    sep4.backgroundColor = UIColorFromRGB(248, 248, 248);
    [_view1 addSubview:sep4];
    
    [sep4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_phoneTF withOffset:5];
    [sep4 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_phoneTF];
    [sep4 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_phoneTF];
    [sep4 autoSetDimension:ALDimensionHeight toSize:1];
}

- (void)view2AutoLaout {
    UILabel *shipping = [[UILabel alloc]init];
    shipping.textColor = UIColorFromRGB(50, 122, 229);
    shipping.font = [UIFont systemFontOfSize:12];
    shipping.text = @"SHIPPING DETAILS:";
    [_view2 addSubview:shipping];
    
    [shipping autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [shipping autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:14];
    
    UILabel *country = [[UILabel alloc]init];
    country.textColor = UIColorFromRGB(179, 188, 199);
    country.font = [UIFont systemFontOfSize:10];
    country.text = @"Country:";
    [_view2 addSubview:country];
    
    [country autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:shipping];
    [country autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:shipping withOffset:12];
    
    _countryLbl = [[UILabel alloc] init];
    _countryLbl.text = @"Choose Country";
    [_view2 addSubview:_countryLbl];
    
    [_countryLbl autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:country];
    [_countryLbl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:country withOffset:3];
//    [_firstNameTF autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
    
    UIView *sep1 = [[UIView alloc] init];
    sep1.backgroundColor = UIColorFromRGB(248, 248, 248);
    [_view2 addSubview:sep1];
    
    [sep1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_countryLbl withOffset:5];
    [sep1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
    [sep1 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_countryLbl];
    [sep1 autoSetDimension:ALDimensionHeight toSize:1];
    
    UILabel *address = [[UILabel alloc]init];
    address.textColor = UIColorFromRGB(179, 188, 199);
    address.font = [UIFont systemFontOfSize:10];
    address.text = @"Address:";
    [_view2 addSubview:address];
    
    [address autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sep1];
    [address autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sep1 withOffset:12];
    
    _addressTF = [[UITextField alloc] init];
    _addressTF.text = @"64 Rosewood Street, Building C";
    [_view2 addSubview:_addressTF];
    
    [_addressTF autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:address];
    [_addressTF autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:address withOffset:3];
    [_addressTF autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
    
    UIView *sep2 = [[UIView alloc] init];
    sep2.backgroundColor = UIColorFromRGB(248, 248, 248);
    [_view2 addSubview:sep2];
    
    [sep2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_addressTF withOffset:5];
    [sep2 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_addressTF];
    [sep2 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_addressTF];
    [sep2 autoSetDimension:ALDimensionHeight toSize:1];
    
    UILabel *postalCode = [[UILabel alloc]init];
    postalCode.textColor = UIColorFromRGB(179, 188, 199);
    postalCode.font = [UIFont systemFontOfSize:10];
    postalCode.text = @"ZIP / Postal Code:";
    [_view2 addSubview:postalCode];
    
    [postalCode autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sep2];
    [postalCode autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sep2 withOffset:12];
    
    _postalCodeTF = [[UITextField alloc] init];
    _postalCodeTF.text = @"Enter Postal Code";
    [_view2 addSubview:_postalCodeTF];
    
    [_postalCodeTF autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:postalCode];
    [_postalCodeTF autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:postalCode withOffset:3];
    [_postalCodeTF autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
    
    UIView *sep3 = [[UIView alloc] init];
    sep3.backgroundColor = UIColorFromRGB(248, 248, 248);
    [_view2 addSubview:sep3];
    
    [sep3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_postalCodeTF withOffset:5];
    [sep3 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_postalCodeTF];
    [sep3 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_postalCodeTF];
    [sep3 autoSetDimension:ALDimensionHeight toSize:1];
    
    UILabel *city = [[UILabel alloc]init];
    city.textColor = UIColorFromRGB(179, 188, 199);
    city.font = [UIFont systemFontOfSize:10];
    city.text = @"City:";
    [_view2 addSubview:city];
    
    [city autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:sep3];
    [city autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sep3 withOffset:12];
    
    _cityLbl = [[UILabel alloc] init];
    _cityLbl.text = @"Choose City";
    [_view2 addSubview:_cityLbl];
    
    [_cityLbl autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:city];
    [_cityLbl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:city withOffset:3];
    [_cityLbl autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
    
    UIView *sep4 = [[UIView alloc] init];
    sep4.backgroundColor = UIColorFromRGB(248, 248, 248);
    [_view2 addSubview:sep4];
    
    [sep4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_cityLbl withOffset:5];
    [sep4 autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_cityLbl];
    [sep4 autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_cityLbl];
    [sep4 autoSetDimension:ALDimensionHeight toSize:1];
    
    _countryBtn = [[UIButton alloc] init];
    [_countryBtn setBackgroundImage:[UIImage imageNamed:@"enter"] forState:UIControlStateNormal];
    [_view2 addSubview:_countryBtn];
    
    [_countryBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
    [_countryBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_countryLbl withOffset: - 10];
//    [_countryBtn autoSetDimension:ALDimensionHeight toSize:20];
    
    _cityBtn = [[UIButton alloc] init];
    [_cityBtn setBackgroundImage:[UIImage imageNamed:@"enter"] forState:UIControlStateNormal];
    [_view2 addSubview:_cityBtn];
    
    [_cityBtn autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:sep3];
    [_cityBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_cityLbl withOffset: - 10];
}

- (void)eventAction {
    _firstNameTF.delegate = self;
    _lastNameTF.delegate = self;
    _emailTF.delegate = self;
    _phoneTF.delegate = self;
    _addressTF.delegate = self;
    _postalCodeTF.delegate = self;
    
    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    self.returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyDone;
}

@end
