//
//  HomeQuickViewController.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "HomeQuickViewController.h"
#import "SearchViewController.h"

@interface HomeQuickViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation HomeQuickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Home";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(more)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self createSegmentedControl];
}

//滑动选项卡创建
- (void)createSegmentedControl {
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(100 * 5, 168);
    self.scrollView.delegate = self;
    
    for (int i = 0; i < 5 ; i++) {
        UIImageView *heart = [[UIImageView alloc]initWithFrame:CGRectMake(i*100 - 50, 44, 80, 80)];
        heart.image = [UIImage imageNamed:@"PopularLayer1"];
        heart.layer.cornerRadius = 40;
        [self.scrollView addSubview:heart];
    }
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

- (IBAction)backAction:(UIButton *)sender forEvent:(UIEvent *)event {
    [self.navigationController popViewControllerAnimated:NO];
}
@end
