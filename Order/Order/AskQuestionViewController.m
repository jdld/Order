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

@interface AskQuestionViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IQKeyboardReturnKeyHandler    *returnKeyHandler;

@end

@implementation AskQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Chat Support";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.textView.delegate = self;
    self.tableView.separatorStyle = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more-1"] style:UIBarButtonItemStylePlain target:self action:@selector(more)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backpop"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AskQuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
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
    
}

- (void)textViewDidChange:(UITextView *)textView
{
    [textView flashScrollIndicators];   // 闪动滚动条
//    _textView.frame = CGRectMake(20, 8, _textView.frame.size.width,[Utilities stringHeight:textView.text width:_textView.frame.size.width forfontSize:17]);
    //---- 计算backView高度 ---- //
    CGSize size = CGSizeMake(UI_SCREEN_W-65, CGFLOAT_MAX);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16],NSFontAttributeName, nil];
    CGFloat curheight = [textView.text boundingRectWithSize:size
                                                    options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                 attributes:dic
                                                    context:nil].size.height;
    CGFloat y = CGRectGetMaxY(self.backView.frame);
    if (curheight < 34) {
        self.backView.frame = CGRectMake(0, y - 50, UI_SCREEN_W, 50);
    }else if(curheight < 120){
        self.textView.scrollEnabled = YES;
        self.backView.frame = CGRectMake(0, y - textView.contentSize.height -10, UI_SCREEN_W,textView.contentSize.height+10);
    }else{
        self.textView.scrollEnabled = YES;
        return;
    }
}



@end
