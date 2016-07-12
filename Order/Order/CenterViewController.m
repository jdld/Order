//
//  CenterViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "CenterViewController.h"
#import "CurrentOrderTableViewController.h"
#import "PendingOrdersTableViewController.h"
#import "HistoryTableViewController.h"
#import <HMSegmentedControl.h>

@interface CenterViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (strong, nonatomic) NSArray *arr;
@end

@implementation CenterViewController


- (NSArray *)arr {
    if (_arr == nil) {
        _arr = @[@"Current Order", @"Pending Orders", @"History"];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self UIAutoLaout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)UIAutoLaout {
    self.navigationItem.title = @"Shopping Cart";
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Navigation"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(more)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(NextAction)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 32, UI_SCREEN_W, UI_SCREEN_H)];
    [self.view addSubview:_scrollView];
    
    [self createSegmentedControl];
}

- (void)createSegmentedControl {
    NSDictionary *dict = @{NSForegroundColorAttributeName:UIColorFromRGB(30, 32, 36), NSFontAttributeName:[UIFont fontWithName:@"AvenirNextCondensed-Regular" size:15]};
    
    
    _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:[self arr]];
    _segmentedControl.frame = CGRectMake(0, 0, UI_SCREEN_W, 32);
    _segmentedControl.selectionIndicatorHeight = 0;
    _segmentedControl.backgroundColor = [UIColor clearColor];
    _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    _segmentedControl.selectedTitleTextAttributes = dict;
    
    __weak typeof(self) weakSelf = self;
    [_segmentedControl setIndexChangeBlock:^(NSInteger index) {
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
    CurrentOrderTableViewController *popular = [[CurrentOrderTableViewController alloc]init];
    [self setSubviewOn:popular view:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(UI_SCREEN_W, 0, UI_SCREEN_W, viewHeight)];
    PendingOrdersTableViewController *featured = [[PendingOrdersTableViewController alloc]init];
    [self setSubviewOn:featured view:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(UI_SCREEN_W * 2, 0, UI_SCREEN_W, viewHeight)];
    HistoryTableViewController *dealsOf = [[HistoryTableViewController alloc]init];
    [self setSubviewOn:dealsOf view:view3];
    
    [self.view addSubview:_segmentedControl];
}

//根据提供的ViewController改变当前显示的选项卡
- (void)setSubviewOn:(UIViewController *)viewController view:(UIView *)view {
    [self addChildViewController:viewController];
    viewController.view.frame = CGRectMake(0, 0, UI_SCREEN_W, view.frame.size.height);
    [view addSubview:viewController.view];
    [self.scrollView addSubview:view];
}

- (void)more {
    
}

- (void)NextAction {

}


@end
