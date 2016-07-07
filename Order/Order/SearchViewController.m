//
//  SearchViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Navigation"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.hidesBackButton = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting"] style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat nav = self.navigationController.navigationBar.frame.size.height;
    UIView *view  = [[UIView alloc]initWithFrame:CGRectMake(6, rectStatus.size.height + nav - 39, UI_SCREEN_W - 66, 32)];
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, UI_SCREEN_W - 66, 32)];
    _searchBar.searchBarStyle = UISearchBarStyleProminent;
    _searchBar.barTintColor = [UIColor whiteColor];
    _searchBar.layer.cornerRadius = 3;
    _searchBar.clipsToBounds = YES;
    _searchBar.delegate = self;
    [view addSubview:_searchBar];
    view.tag = 10087;
    [self.navigationController.view addSubview:view];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"search = %@",searchBar.text);
    
    [_searchBar resignFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    UIView *view = [self.navigationController.view viewWithTag:10087];
    [_searchBar removeFromSuperview];
    [view removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setting {
    
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
