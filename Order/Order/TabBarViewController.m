//
//  TabBarViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "DealsViewController.h"
#import "CenterViewController.h"
#import "TagsViewController.h"
#import "ProfileViewController.h"
#import "NavigationController.h"

@interface TabBarViewController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    _tabBarController = [[UITabBarController alloc] init];
    HomeViewController *home = [Utilities getStoryboardInstanceByIdentity:@"Home" byIdentity:@"Home"];
    NavigationController *homeNav = [[NavigationController alloc]initWithRootViewController:home];
    homeNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"Home"] tag:0];
    homeNav.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
    homeNav.tabBarItem.image = [[UIImage imageNamed:@"Home 1-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Home 1-2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    DealsViewController *Deals = [Utilities getStoryboardInstanceByIdentity:@"Deals" byIdentity:@"Deals"];
    NavigationController *DealsNav = [[NavigationController alloc]initWithRootViewController:Deals];
    DealsNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"Deals"] tag:1];
    DealsNav.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
    DealsNav.tabBarItem.image = [[UIImage imageNamed:@"Deals 1-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    DealsNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Deals 1-2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    CenterViewController *Center = [Utilities getStoryboardInstanceByIdentity:@"Center" byIdentity:@"Center"];
    NavigationController *CenterNav = [[NavigationController alloc]initWithRootViewController:Center];
    CenterNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"Center"] tag:2];
    CenterNav.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
    CenterNav.tabBarItem.image = [[UIImage imageNamed:@"Center 1-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CenterNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Center 1-2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    TagsViewController *Tags = [Utilities getStoryboardInstanceByIdentity:@"Tags" byIdentity:@"Tags"];
    NavigationController *TagsNav = [[NavigationController alloc]initWithRootViewController:Tags];
    TagsNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:@"Tags"] tag:3];
    TagsNav.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
    TagsNav.tabBarItem.image = [[UIImage imageNamed:@"Tags 1-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    TagsNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tags 1-2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ProfileViewController *Profile = [Utilities getStoryboardInstanceByIdentity:@"Profile" byIdentity:@"Profile"];
    NavigationController *ProfileNav = [[NavigationController alloc]initWithRootViewController:Profile];
    ProfileNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:@"Profile"] tag:3];
    ProfileNav.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
    ProfileNav.tabBarItem.image = [[UIImage imageNamed:@"Profile 1-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ProfileNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Profile 1-2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    _tabBarController.viewControllers = @[homeNav,DealsNav,CenterNav,TagsNav,ProfileNav];
    
    self.tabBarController = _tabBarController;
    [self.view addSubview:_tabBarController.view];
    
    self.view.backgroundColor = [UIColor colorWithRed:254.f/255.f green:254.f/255.f blue:254.f/255.f alpha:1];
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
