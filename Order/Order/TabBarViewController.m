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
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:home];
    homeNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"Home"] tag:0];
    homeNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    homeNav.tabBarItem.image = [[UIImage imageNamed:@"Home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    DealsViewController *Deals = [Utilities getStoryboardInstanceByIdentity:@"Deals" byIdentity:@"Deals"];
    UINavigationController *DealsNav = [[UINavigationController alloc]initWithRootViewController:Deals];
    DealsNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"Deals"] tag:1];
    DealsNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    DealsNav.tabBarItem.image = [[UIImage imageNamed:@"Deals"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    DealsNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Deals"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    CenterViewController *Center = [Utilities getStoryboardInstanceByIdentity:@"Center" byIdentity:@"Center"];
    UINavigationController *CenterNav = [[UINavigationController alloc]initWithRootViewController:Center];
    CenterNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"Center"] tag:2];
    CenterNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    CenterNav.tabBarItem.image = [[UIImage imageNamed:@"Center"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CenterNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Center"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    TagsViewController *Tags = [Utilities getStoryboardInstanceByIdentity:@"Tags" byIdentity:@"Tags"];
    UINavigationController *TagsNav = [[UINavigationController alloc]initWithRootViewController:Tags];
    TagsNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:@"Tags"] tag:3];
    TagsNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    TagsNav.tabBarItem.image = [[UIImage imageNamed:@"Tags"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    TagsNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tags"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ProfileViewController *Profile = [Utilities getStoryboardInstanceByIdentity:@"Profile" byIdentity:@"Profile"];
    UINavigationController *ProfileNav = [[UINavigationController alloc]initWithRootViewController:Profile];
    ProfileNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:@"Profile"] tag:3];
    ProfileNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    ProfileNav.tabBarItem.image = [[UIImage imageNamed:@"Profile"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ProfileNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"Profile"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    _tabBarController.viewControllers = @[homeNav,DealsNav,CenterNav,TagsNav,ProfileNav];
    
    self.tabBarController = _tabBarController;
    _tabBarController.tabBar.tintColor = [UIColor blueColor];
    [self.view addSubview:_tabBarController.view];
    
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
