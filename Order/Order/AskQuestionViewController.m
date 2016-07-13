//
//  AskQuestionViewController.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "AskQuestionViewController.h"
#import "AskQuestionTableViewCell.h"
#import <IQKeyboardReturnKeyHandler.h>

@interface AskQuestionViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UIScrollViewDelegate>{
    Boolean flag;
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
    
    self.title = @"Chat Support";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.textView.delegate = self;
    self.tableView.separatorStyle = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more-1"] style:UIBarButtonItemStylePlain target:self action:@selector(more)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backpop"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    _objArr = [NSMutableArray new];
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

//编辑开始
- (void)textViewDidBeginEditing:(UITextView *)textView {
    _detialLab.hidden = YES;
}
//编辑结束
- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        _detialLab.hidden = NO;
    }
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = _objArr[indexPath.row];
    return 140 + [Utilities stringHeight:dic[@"text"] width:_textView.frame.size.width - 2 forfontSize:17];
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
    NSString *timeSp = [NSString stringWithFormat:@"%dm ago",(int)([[NSDate date] timeIntervalSince1970] - [date timeIntervalSince1970]+0.5)];
    cell.timeLab.text = timeSp;
    
    return cell;
}

- (void) more {
    NSLog(@"more");
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

- (IBAction)sendAction:(UIButton *)sender forEvent:(UIEvent *)event {
    if (![_textView.text isEqualToString:@""]) {
        NSDictionary *dict = @{@"layer":@"Layer11",@"name":@"Martha Richards",@"text":_textView.text,@"time":[NSDate date]};
        [_objArr addObject:dict];
        _textView.text = @"";
        _detialLab.hidden = NO;
        [_tableView reloadData];
        [self performSelector:@selector(replyQuestion) withObject:self afterDelay:3.0f];
    }
    
}

- (void) replyQuestion {
    if (flag) {
        NSDictionary *dict = @{@"layer":@"Layer22",@"name":@"Mark Robertson",@"text":@"Hi Martha. Unfortunately, I don’t have those in stock yet, but they should be here next week, if you are not in a hurry.",@"time":[NSDate date]};
        [_objArr addObject:dict];
        [_tableView reloadData];
        flag = NO;
    }
}

//- (void)textViewDidChange:(UITextView *)textView
//{
//    [textView flashScrollIndicators];   // 闪动滚动条
//        CGRect frame = textView.frame;
//        frame.size.height = [Utilities stringHeight:textView.text width:_textView.frame.size.width forfontSize:17] + 10;
//    NSLog(@"h = %f",[Utilities stringHeight:textView.text width:_textView.frame.size.width forfontSize:17]);
//        textView.frame = frame;
//
//    //---- 计算backView高度 ---- //
//    CGSize size = CGSizeMake(UI_SCREEN_W-65, CGFLOAT_MAX);
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16],NSFontAttributeName, nil];
//    CGFloat curheight = [textView.text boundingRectWithSize:size
//                                                    options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
//                                                 attributes:dic
//                                                    context:nil].size.height;
//    CGFloat y = CGRectGetMaxY(self.backView.frame);
//    if (curheight < 34) {
//        self.backView.frame = CGRectMake(0, y - 50, UI_SCREEN_W, 50);
//    }else if(curheight < 120){
//        self.textView.scrollEnabled = YES;
//        self.backView.frame = CGRectMake(0, y - textView.contentSize.height -10, UI_SCREEN_W,textView.contentSize.height+10);
//    }else{
//        self.textView.scrollEnabled = YES;
//        return;
//    }
//}



@end
