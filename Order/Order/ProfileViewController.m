//
//  ProfileViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Profile";
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Navigation"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(more)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self mapping];
}

- (void) mapping {

    _backView1.layer.cornerRadius = 5;
    _backView1.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _backView1.layer.shadowOffset = CGSizeMake(0, 0.5);
    _backView1.layer.shadowOpacity = YES;

    _backView2.layer.cornerRadius = 5;
    _backView2.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _backView2.layer.shadowOffset = CGSizeMake(0, 0.5);
    _backView2.layer.shadowOpacity = YES;
    
    _editBut.layer.cornerRadius = 5;
    _editBut.layer.borderWidth = 1;
    _editBut.layer.borderColor = [UIColor colorWithRed:50.f/255.f green:122.f/255.f blue:229.f/255.f alpha:1].CGColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) more {
    
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
