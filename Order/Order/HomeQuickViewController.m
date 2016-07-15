//
//  HomeQuickViewController.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "HomeQuickViewController.h"
#import "SearchViewController.h"

@interface HomeQuickViewController ()<UIScrollViewDelegate>{
    float imageH;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *ImageArr;

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
    
    imageH = (UI_SCREEN_W - 80)/4;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(imageH * 5 + 30 , 168);
    self.scrollView.delegate = self;
    
    _ImageArr = [NSMutableArray new];

    if(_index == 0) {
        [_ImageArr addObject:@"PopularLayer2"];
        [_ImageArr addObject:@"PopularLayer3"];
        [_ImageArr addObject:@"PopularLayer1"];
        [_ImageArr addObject:@"PopularLayer4"];
        [_ImageArr addObject:@"PopularLayer5"];
    }else if(_index == 1){
        [_ImageArr addObject:@"PopularLayer4"];
        [_ImageArr addObject:@"PopularLayer5"];
        [_ImageArr addObject:@"PopularLayer2"];
        [_ImageArr addObject:@"PopularLayer3"];
        [_ImageArr addObject:@"PopularLayer1"];

    }
    
    [self createImageViewSegmented];
    [self mapping];
    [self start:3];
}

- (void) mapping {
    _backview1.layer.borderColor = [UIColor colorWithRed:225.f/255.f green:228.f/255.f blue:236.f/255.f alpha:1].CGColor;
    _backview1.layer.borderWidth = 1;
    _backview1.layer.cornerRadius = 5;
    
    _backView2.layer.borderColor = [UIColor colorWithRed:225.f/255.f green:228.f/255.f blue:236.f/255.f alpha:1].CGColor;
    _backView2.layer.borderWidth = 1;
    _backView2.layer.cornerRadius = 5;
    
    _shopBut1.layer.borderWidth = 1;
    _shopBut1.layer.borderColor = [UIColor colorWithRed:225.f/255.f green:228.f/255.f blue:236.f/255.f alpha:1].CGColor;
    _shopBut1.layer.cornerRadius = 10;
    
    _shopBut2.layer.borderWidth = 1;
    _shopBut2.layer.borderColor = [UIColor colorWithRed:225.f/255.f green:228.f/255.f blue:236.f/255.f alpha:1].CGColor;
    _shopBut2.layer.cornerRadius = 10;
    
    _followBut.layer.borderColor = [UIColor colorWithRed:0.f/255.f green:122.f/255.f blue:255.f/255.f alpha:1].CGColor;
    _followBut.layer.borderWidth = 1;
    _followBut.layer.cornerRadius = 5;
}

//滑动选项卡创建
- (void)createImageViewSegmented {
    
    for (int i = 0; i < 5 ; i++) {
        UIImageView *heart = [[UIImageView alloc]initWithFrame:CGRectMake(i*(imageH + 20) - imageH/2, 44, imageH, imageH)];
        heart.tag = i+10;
        heart.image = [UIImage imageNamed:_ImageArr[i]];
        heart.layer.cornerRadius = 40;
        heart.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:heart];
    }
}

- (void)removeImageViewSegmented {
    for (int i = 10; i < 15; i++) {
        UIImageView *heart = [self.scrollView viewWithTag:i];
        [heart removeFromSuperview];
    }
}

- (void)start:(int)score {
    for (int i = 0; i <= score ; i++) {
        if (i == 1) {
            [_star1 setImage:[UIImage imageNamed:@"star1-2"] forState:UIControlStateNormal];
        }else if (i == 2){
            [_star2 setImage:[UIImage imageNamed:@"star1-2"] forState:UIControlStateNormal];
        }else if (i == 3){
            [_star3 setImage:[UIImage imageNamed:@"star1-2"] forState:UIControlStateNormal];
        }else if (i == 4){
            [_star4 setImage:[UIImage imageNamed:@"star1-2"] forState:UIControlStateNormal];
        }else if (i == 5){
            [_star5 setImage:[UIImage imageNamed:@"star1-2"] forState:UIControlStateNormal];
        }
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

// scrollView 结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    float currentOffset = scrollView.contentOffset.x + scrollView.bounds.size.width - scrollView.contentInset.bottom;
    float maxminOffset = scrollView.contentSize.width;
    float offset = maxminOffset - currentOffset;
    if (offset > 65) {
        NSLog(@"右移 = %f",offset);
        [self rightMoveImage];
    }else if (offset < -65){
        NSLog(@"左移 = %f",offset);
        [self leftMoveImage];
    }
    
}

- (void) leftMoveImage {
     NSString *imageAtr = _ImageArr[0];
    [_ImageArr removeObjectAtIndex:0];
    [_ImageArr addObject:imageAtr];
    [self removeImageViewSegmented];
    [self createImageViewSegmented];
}

- (void) rightMoveImage {
    NSString *imageAtr1 = _ImageArr[4];
    NSString *imageAtr2 = _ImageArr[0];
    NSString *imageAtr3 = _ImageArr[1];
    NSString *imageAtr4 = _ImageArr[2];
    NSString *imageAtr5 = _ImageArr[3];
    
    [_ImageArr removeAllObjects];
    
    [_ImageArr addObject:imageAtr1];
    [_ImageArr addObject:imageAtr2];
    [_ImageArr addObject:imageAtr3];
    [_ImageArr addObject:imageAtr4];
    [_ImageArr addObject:imageAtr5];
    [self removeImageViewSegmented];
    [self createImageViewSegmented];
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
