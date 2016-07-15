//
//  RootTabBarViewController.m
//  Order
//
//  Created by Etong on 16/7/15.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "TabBarViewController.h"

@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TabBarViewController *tabbar = [[TabBarViewController alloc] init];
    
    [self addChildViewController:tabbar];
    
//    self.view = [Utilities effectViewWithFrame:self.view.frame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
