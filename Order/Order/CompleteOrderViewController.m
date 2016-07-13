//
//  CompleteOrderViewController.m
//  Order
//
//  Created by Etong on 16/7/13.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "CompleteOrderViewController.h"
#import "ShippingDetailsViewController.h"
#import "ReviewViewController.h"
#import <HMSegmentedControl.h>

@interface CompleteOrderViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (strong, nonatomic) NSArray *arr;
@end

@implementation CompleteOrderViewController

- (NSArray *)arr {
    if (_arr == nil) {
        _arr = @[@"Personal & Shipping Details", @"Review & Purchase"];
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
    self.navigationItem.title = @"Complete Order";
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Navigation"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(NextAction)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 38, UI_SCREEN_W, UI_SCREEN_H)];
    _scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_scrollView];
    
    [self createSegmentedControl];
}

- (void)createSegmentedControl {
    NSDictionary *dict = @{NSForegroundColorAttributeName:UIColorFromRGB(30, 32, 36), NSFontAttributeName:[UIFont systemFontOfSize:15]};
    
    
    _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:[self arr]];
    _segmentedControl.frame = CGRectMake(0, 0, UI_SCREEN_W, 38);
    _segmentedControl.selectionIndicatorHeight = 0;
    _segmentedControl.backgroundColor = [UIColor whiteColor];
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
    ShippingDetailsViewController *shipping = [[ShippingDetailsViewController alloc]init];
    [self setSubviewOn:shipping view:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(UI_SCREEN_W, 0, UI_SCREEN_W, viewHeight)];
    ReviewViewController *review = [[ReviewViewController alloc]init];
    [self setSubviewOn:review view:view2];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_W, 38)];
    bgView.layer.shadowOffset = CGSizeMake(0, 1);
    bgView.layer.shadowOpacity = 0.2f;
    bgView.layer.shadowRadius = 1.0f;
    [self.view addSubview:bgView];
    
    [bgView addSubview:_segmentedControl];
    self.view.backgroundColor = UIColorFromRGB(248, 248, 248);
}

//根据提供的ViewController改变当前显示的选项卡
- (void)setSubviewOn:(UIViewController *)viewController view:(UIView *)view {
    [self addChildViewController:viewController];
    viewController.view.frame = CGRectMake(0, 0, UI_SCREEN_W, view.frame.size.height);
    view.backgroundColor = [UIColor clearColor];
    [view addSubview:viewController.view];
    [self.scrollView addSubview:view];
}

- (void)NextAction {
    
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
