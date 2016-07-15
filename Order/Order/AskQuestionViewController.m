//
//  AskQuestionViewController.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "AskQuestionViewController.h"
#import "AskQuestionTableViewCell.h"
#import "HPGrowingTextView/HPGrowingTextView.h"
#import <IQKeyboardReturnKeyHandler.h>

@interface AskQuestionViewController ()<UITableViewDelegate,UITableViewDataSource,HPGrowingTextViewDelegate>{
    UIView *containerView;
    HPGrowingTextView *textView;
    Boolean flag;
    float cellHeight;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IQKeyboardReturnKeyHandler    *returnKeyHandler;
@property (nonatomic, strong) NSMutableArray *objArr;

@end

@implementation AskQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    flag = YES;
    cellHeight = 0;
    
    self.title = @"Chat Support";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more-1"] style:UIBarButtonItemStylePlain target:self action:@selector(more)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backpop"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    _objArr = [NSMutableArray new];
    
    [self createView];
}

- (void)createView {
    
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    containerView.backgroundColor = [UIColor whiteColor];
    
    textView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(6, 8, UI_SCREEN_W - 73, 50)];
    textView.isScrollable = NO;
    textView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
    textView.internalTextView.showsVerticalScrollIndicator = NO;
    
    textView.minNumberOfLines = 1;
    textView.maxNumberOfLines = 6;
    textView.maxHeight = 100.0f;
    textView.returnKeyType = UIReturnKeyDefault; //右下角return样式
    textView.font = [UIFont systemFontOfSize:15.0f];
    textView.delegate = self;
    textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(5, 0, 5, 0);
    textView.backgroundColor = [UIColor whiteColor];
    textView.placeholder = @"Your response...";
    
    
    [self.view addSubview:containerView];
    //自动调整自己的宽度，保证与superView左边和右边的距离不变。
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [containerView addSubview:textView];
    
    UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    doneBtn.frame = CGRectMake(containerView.frame.size.width - 69, 10, 63, 27);
    doneBtn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    [doneBtn setTitle:@"Send" forState:UIControlStateNormal];
    
    doneBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [doneBtn setTitleColor:[UIColor colorWithRed:50.f/255.f green:122.f/255.f blue:229.f/255.f alpha:1] forState:UIControlStateNormal];
    [doneBtn addTarget:self action:@selector(resignTextView) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:doneBtn];
    //自动调整自己的宽度，保证与superView左边和右边的距离不变 以及 自动调整与superView顶部的距离，保证与superView底部的距离不变。
    containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    float diff = (growingTextView.frame.size.height - height);
    
    CGRect r = containerView.frame;
    r.size.height -= diff;
    r.origin.y += diff;
    containerView.frame = r;
}



-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}


-(void)resignTextView
{
    if (![textView.text isEqualToString:@""]) {
                NSDictionary *dict = @{@"layer":@"Layer11",@"name":@"Martha Richards",@"text":textView.text,@"time":[NSDate date]};
                [_objArr addObject:dict];
                textView.text = @"";
                [_tableView reloadData];
                [textView resignFirstResponder];
                if (cellHeight > UI_SCREEN_H - 90) {
                     [self.tableView setContentOffset:CGPointMake(0, self.tableView.contentSize.height -self.tableView.bounds.size.height) animated:YES];
                }
        
                [self performSelector:@selector(replyQuestion) withObject:self afterDelay:3.0f];
            }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//释放
- (void)dealloc
{
    self.returnKeyHandler = nil;
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = _objArr[indexPath.row];
    float height = 140 + [Utilities stringHeight:dic[@"text"] width:UI_SCREEN_W - 100 forfontSize:17];
    cellHeight += height;
    return 140 + [Utilities stringHeight:dic[@"text"] width:UI_SCREEN_W - 100 forfontSize:17];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AskQuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *dic = _objArr[indexPath.row];
    cell.ImageView.image = [UIImage imageNamed:dic[@"layer"]];
    cell.nameLab.text = dic[@"name"];
    cell.textLab.text = dic[@"text"];
    
    NSDate * date = dic[@"time"];
    int time = (int)([[NSDate date] timeIntervalSince1970] - [date timeIntervalSince1970]+0.5);
    if (time > 60) {
         cell.timeLab.text = [NSString stringWithFormat:@"%dm ago",time/60];
    }else if (time == 0){
         cell.timeLab.text = [NSString stringWithFormat:@"just now"];
    }else {
         cell.timeLab.text = [NSString stringWithFormat:@"%ds ago",time];
    }
    
    return cell;
}

- (void) more {
    NSLog(@"more");
}

- (void) back {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void) replyQuestion {
    if (flag) {
        NSDictionary *dict = @{@"layer":@"Layer22",@"name":@"Mark Robertson",@"text":@"Hi Martha. Unfortunately, I don’t have those in stock yet, but they should be here next week, if you are not in a hurry.",@"time":[NSDate date]};
        [_objArr addObject:dict];
        [_tableView reloadData];
        flag = NO;
    }
}



@end
