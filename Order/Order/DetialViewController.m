//
//  DetialViewController.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "DetialViewController.h"
#import "AskQuestionViewController.h"
#import <SDCycleScrollView/SDCycleScrollView.h>

@interface DetialViewController (){
    CGSize size;
    NSArray *imageArr;
}
@property (strong, nonatomic)UIImageView *check;
@property (strong ,nonatomic)SDCycleScrollView *cycleScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _questionBut.layer.borderWidth = 1;
    _questionBut.layer.borderColor = [UIColor colorWithRed:50.f/255.f green:122.f/255.f blue:229.f/255.f alpha:1].CGColor;
    _questionBut.layer.cornerRadius = 5;
    _purchaseBut.layer.cornerRadius = 5;
    
    size = _color1.frame.size;
    
    self.title = @"Product Details";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backpop"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UITapGestureRecognizer*tapGesture1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(colorOne)];
    [_color1 addGestureRecognizer:tapGesture1];
    UITapGestureRecognizer*tapGesture2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(colorTwo)];
    [_color2 addGestureRecognizer:tapGesture2];
    UITapGestureRecognizer*tapGesture3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(colorThree)];
    [_color3 addGestureRecognizer:tapGesture3];
    UITapGestureRecognizer*tapGesture4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(colorFour)];
    [_color4 addGestureRecognizer:tapGesture4];
    UITapGestureRecognizer*tapGesture5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(colorFive)];
    [_color5 addGestureRecognizer:tapGesture5];
    
    _check = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"checkmark"]];
    _check.contentMode = UIViewContentModeScaleAspectFit;
    _check.frame = CGRectMake(size.width/2 - 12, size.height/2 - 10, 24, 20);
    [_color5 addSubview:_check];
    
    _nameLab.text = _dict[@"name"];
    _detialLab.text = _dict[@"detial"];
    _numberLab.text = _dict[@"much"];
 
    UIImage *image1 = [UIImage imageNamed:@"demo1"];
    UIImage *image2 = [UIImage imageNamed:@"demo1"];
    UIImage *image3 = [UIImage imageNamed:@"demo1"];
    imageArr = @[image1,image2,image3];
    [self createSDCycleScrollView];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _scrollView.contentSize = CGSizeMake(UI_SCREEN_W, 330 + [Utilities stringHeight:_textView.text width:UI_SCREEN_W -  50 forfontSize:14]);
}

- (void)createSDCycleScrollView {

    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, UI_SCREEN_W, 240)  imageNamesGroup:imageArr];
    _cycleScrollView.backgroundColor = [UIColor whiteColor];
    _cycleScrollView.autoScrollTimeInterval = 10;
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFit;
    
    [self.scrollView addSubview:_cycleScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)colorOne {
    [_color1 addSubview:_check];
    UIImage *image1 = [UIImage imageNamed:@"demo3"];
    UIImage *image2 = [UIImage imageNamed:@"demo3"];
    UIImage *image3 = [UIImage imageNamed:@"demo3"];
    imageArr = @[image1,image2,image3];
    [_cycleScrollView removeFromSuperview];
    [self createSDCycleScrollView];
}

- (void)colorTwo {
    [_color2 addSubview:_check];
    UIImage *image1 = [UIImage imageNamed:@"demo5"];
    UIImage *image2 = [UIImage imageNamed:@"demo5"];
    UIImage *image3 = [UIImage imageNamed:@"demo5"];
    imageArr = @[image1,image2,image3];
    [_cycleScrollView removeFromSuperview];
    [self createSDCycleScrollView];
}

- (void)colorThree {
    [_color3 addSubview:_check];
    UIImage *image1 = [UIImage imageNamed:@"demo4"];
    UIImage *image2 = [UIImage imageNamed:@"demo4"];
    UIImage *image3 = [UIImage imageNamed:@"demo4"];
    imageArr = @[image1,image2,image3];
    [_cycleScrollView removeFromSuperview];
    [self createSDCycleScrollView];
}

- (void)colorFour {
    [_color4 addSubview:_check];
    UIImage *image1 = [UIImage imageNamed:@"demo2"];
    UIImage *image2 = [UIImage imageNamed:@"demo2"];
    UIImage *image3 = [UIImage imageNamed:@"demo2"];
    imageArr = @[image1,image2,image3];
    [_cycleScrollView removeFromSuperview];
    [self createSDCycleScrollView];
}

- (void)colorFive {
    [_color5 addSubview:_check];
    UIImage *image1 = [UIImage imageNamed:@"demo1"];
    UIImage *image2 = [UIImage imageNamed:@"demo1"];
    UIImage *image3 = [UIImage imageNamed:@"demo1"];
    imageArr = @[image1,image2,image3];
    [_cycleScrollView removeFromSuperview];
    [self createSDCycleScrollView];
}

- (void) back {
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)questionAction:(UIButton *)sender forEvent:(UIEvent *)event {
    AskQuestionViewController *AskQuestion = [Utilities getStoryboardInstanceByIdentity:@"Home" byIdentity:@"AskQuestion"];
    
    [self.navigationController pushViewController:AskQuestion animated:YES];
}

- (IBAction)purchaseAction:(UIButton *)sender forEvent:(UIEvent *)event {
}
@end
