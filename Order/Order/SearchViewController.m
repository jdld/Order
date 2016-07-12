//
//  SearchViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTableViewCell.h"

@interface SearchViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Navigation"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.hidesBackButton = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting"] style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat nav = self.navigationController.navigationBar.frame.size.height;
    UIView *view  = [[UIView alloc]initWithFrame:CGRectMake(6, rectStatus.size.height + nav - 39, UI_SCREEN_W - 56, 32)];
    view.backgroundColor = [UIColor clearColor];
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, UI_SCREEN_W - 56, 32)];
    _searchBar.searchBarStyle = UISearchBarStyleProminent;
    _searchBar.barTintColor = [UIColor whiteColor];
    _searchBar.layer.cornerRadius = 3;
    _searchBar.clipsToBounds = YES;
    _searchBar.tintColor = [UIColor whiteColor];
    UITextField *searchField = [_searchBar valueForKey:@"searchField"];
    searchField.textColor = [UIColor whiteColor];
    searchField.font = [UIFont fontWithName:@"Arial" size:12];
    
    UIImage* searchBarBg = [self GetImageWithColor:[UIColor clearColor] andHeight:32.0f];
    _searchBar.backgroundColor = [UIColor clearColor];
    [_searchBar setBackgroundImage:[UIImage imageNamed:@"searchbg"]];
    [_searchBar setSearchFieldBackgroundImage:searchBarBg forState:UIControlStateNormal];
    [_searchBar setImage:[UIImage imageNamed:@"searchBar"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    [_searchBar setImage:[UIImage imageNamed:@"close"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
    
    _searchBar.delegate = self;
    [view addSubview:_searchBar];
    view.tag = 10087;
    [self.navigationController.view addSubview:view];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"search = %@",searchBar.text);
    
    [_searchBar resignFirstResponder];
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text hasPrefix:@"\""])
    {
        searchBar.text = [text stringByAppendingString:@"\"   "];
    }
    
    return YES;
}

- (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
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
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    return cell;
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
