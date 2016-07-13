//
//  TagsViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "TagsViewController.h"

@interface TagsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *arr;

@end

@implementation TagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Tags";
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Navigation"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(more)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    _scrollView.scrollEnabled = YES;
    _scrollView.contentSize = CGSizeMake(UI_SCREEN_W + 40, UI_SCREEN_H - 80);
    
    _arr = @[@"Travel",@"Travel",@"Music",@"Jewelry and Watches",@"Books",@"Electronics",@"Health and Beauty",@"Sporting Goods",@"Fashion",@"Home and Garden",@"Daily Deals",@"Bussiness and Industrial",@"Collectibles and Art"];
    
    [self createPopButton];
    
}


- (void)createPopButton {
    
    int oldX = 0;
    int oldY = 0;
    
    for (int i = 0; i<= 12; i++) {
        int x = [self getRandomNumber:10+oldX to:30+oldX];
        int y = [self getRandomNumber:90+oldY to:110+oldY];
        int H = [self getRandomNumber:80 to:110];
        
        oldX = x + H;
        
        if (oldX > UI_SCREEN_W - 40) {
            oldY = y +20;
            oldX = 0;
        }
        
        
        UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(x, y, H, H)];
        NSDictionary * dic = @{ NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName: [UIFont systemFontOfSize:12]};
        NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:_arr[i] attributes:dic];
        [but setAttributedTitle:attrStr forState:UIControlStateNormal];
        but.layer.borderWidth = 1;
        but.layer.borderColor = [UIColor lightGrayColor].CGColor;
        but.layer.cornerRadius = H/2;
        but.titleLabel.lineBreakMode = 0;
        but.titleLabel.textAlignment = NSTextAlignmentCenter;
        but.tag = i + 100;
        [but addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_scrollView addSubview:but];
    }
}

//获取一个随机整数，范围在[from,to），包括from，包括to
-(int)getRandomNumber:(int)from to:(int)to {
    return (int)(from + (arc4random() % (to - from + 1)));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) more {
    
}

- (void) search {
    
}

- (void)selectAction:(UIButton *)but {
    NSLog(@"sss = %ld",(long)but.tag);
    UIButton *butTag = [self.scrollView viewWithTag:but.tag];
    butTag.backgroundColor = [UIColor colorWithRed:247.f/255.f green:98.f/255.f blue:11.f/255.f alpha:1];
    NSDictionary * dic = @{ NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName: [UIFont systemFontOfSize:12]};
    NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:butTag.titleLabel.text attributes:dic];
    [butTag setAttributedTitle:attrStr forState:UIControlStateNormal];
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
