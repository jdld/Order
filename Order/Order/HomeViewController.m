//
//  HomeViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "HomeViewController.h"
#import "PopularViewController.h"
#import "FeaturedViewController.h"
#import "SellersViewController.h"
#import "FollowingViewController.h"
#import "SearchViewController.h"
#import "HomeQuickViewController.h"
#import <HMSegmentedControl.h>

@interface HomeViewController (){
    float naviHeight;
}
@property (strong, nonatomic) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl2;

@property (strong, nonnull) UIView *backView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Home";
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Navigation"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(more)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    CGRect rectNav = self.navigationController.navigationBar.frame;
    naviHeight = rectNav.size.height + rectStatus.size.height;
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 32, UI_SCREEN_W, UI_SCREEN_H)];
    [self.view addSubview:_scrollView];
    
    [self createSegmentedControl];
    
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UI_SCREEN_W, UI_SCREEN_H)];
    _backView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(createQuickView) name:@"createQuick" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeQuickView) name:@"removeQuick" object:nil];
    
    [Utilities navigationRedDotSetTabBarToSelected:self TabBar:2 num:2];
}

- (void) createQuickView {
    self.tabBarController.tabBar.hidden = YES;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UI_SCREEN_W, UI_SCREEN_H)];
    view.tag = 10086;
    HomeQuickViewController *HomeQuick = [Utilities getStoryboardInstanceByIdentity:@"Home" byIdentity:@"HomeQuick"];
    [self addChildViewController:HomeQuick];
    [view addSubview:HomeQuick.view];
    [self.view addSubview:view];
}

- (void) removeQuickView {
    UIView *view = [self.view viewWithTag:10086];
    [view removeFromSuperview];
    self.tabBarController.tabBar.hidden = NO;
}

//滑动选项卡创建
- (void)createSegmentedControl{
    
    NSDictionary * dic2 = @{ NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName: [UIFont systemFontOfSize:15.0f]};
    NSArray *array = [[NSArray alloc]initWithObjects:@"Most Popular",@"Featured",@"Top Sellers",@"Following", nil];
    _segmentedControl2 = [[HMSegmentedControl alloc] initWithSectionTitles:array];
    _segmentedControl2.frame = CGRectMake(0, 0, UI_SCREEN_W, 32);
    _segmentedControl2.selectionIndicatorHeight = 0;
    _segmentedControl2.backgroundColor = [UIColor clearColor];
    _segmentedControl2.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentedControl2.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    _segmentedControl2.selectedTitleTextAttributes = dic2;
    
    __weak typeof(self) weakSelf = self;
    [_segmentedControl2 setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(UI_SCREEN_W * index, 0, UI_SCREEN_W, 400) animated:NO];
    }];
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(UI_SCREEN_W * 4, 400);
    
    CGRect rectNav = self.navigationController.navigationBar.frame;
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    float viewHeight = self.view.frame.size.height - rectNav.size.height - rectStatus.size.height - 76;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_W, viewHeight)];
    PopularViewController *Popular = [Utilities getStoryboardInstanceByIdentity:@"Home" byIdentity:@"Popular"];
    [self setSubviewOn:Popular view:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(UI_SCREEN_W, 0, UI_SCREEN_W, viewHeight)];
    FeaturedViewController *Featured = [Utilities getStoryboardInstanceByIdentity:@"Home" byIdentity:@"Featured"];
    [self setSubviewOn:Featured view:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(UI_SCREEN_W * 2, 0, UI_SCREEN_W, viewHeight)];
    SellersViewController *Sellers = [Utilities getStoryboardInstanceByIdentity:@"Home" byIdentity:@"Sellers"];
    [self setSubviewOn:Sellers view:view3];
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(UI_SCREEN_W * 3, 0, UI_SCREEN_W, viewHeight)];
    FollowingViewController *Following = [Utilities getStoryboardInstanceByIdentity:@"Home" byIdentity:@"Following"];
    [self setSubviewOn:Following view:view4];
    
    [self.view addSubview:_segmentedControl2];
    
}

//根据提供的ViewController改变当前显示的选项卡
- (void)setSubviewOn:(UIViewController *)viewController view:(UIView *)view {
    [self addChildViewController:viewController];
    viewController.view.frame = CGRectMake(0, 0, UI_SCREEN_W, view.frame.size.height);
    [view addSubview:viewController.view];
    [self.scrollView addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)more {
    NSLog(@"more");
}

- (void)search {
    NSLog(@"search");
    SearchViewController *Search = [Utilities getStoryboardInstanceByIdentity:@"Home" byIdentity:@"Search"];
    [self.navigationController pushViewController:Search animated:YES];
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
