//
//  PopularViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "PopularViewController.h"
#import "PopularTableViewCell.h"
#import "HomeQuickViewController.h"

@interface PopularViewController ()<UITableViewDelegate,UITableViewDataSource>{
    int index;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *objArr;

@end

@implementation PopularViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = NO;
    
    _objArr = [NSMutableArray new];
    NSDictionary *dic1 = @{@"back":@"popularCell1",@"head":@"PopularLayer1",@"name":@"Mark Robertson",@"detial":@"San Francisco, California",@"star":@"4",@"reviews":@"8,095",@"id":@"0"};
    NSDictionary *dic2 = @{@"back":@"popularCell2",@"head":@"PopularLayer2",@"name":@"Michael Jackson",@"detial":@"Indiana, Gary",@"star":@"3",@"reviews":@"7,986",@"id":@"1"};
    [_objArr addObject:dic1];
    [_objArr addObject:dic2];
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - TableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 370;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PopularTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dict = _objArr[indexPath.row];
    cell.ImageView.image = [UIImage imageNamed:dict[@"back"]];
    cell.popularLayerIV.image = [UIImage imageNamed:dict[@"head"]];
    cell.nameLab.text = dict[@"name"];
    cell.detialLab.text = dict[@"detial"];
    cell.reviews.text = [NSString stringWithFormat:@"%@ reviews",dict[@"reviews"]];
    [cell start:[dict[@"star"] intValue]];
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushCut:)];
    [cell.popularLayerIV addGestureRecognizer:tapGesture];
    cell.popularLayerIV.tag = indexPath.row;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        index = (int)indexPath.row;
}

- (void)pushCut:(UITapGestureRecognizer *)gestureRecognizer {
    UIView *image = gestureRecognizer.view;
    NSDictionary *dict = _objArr[image.tag];
    [[StorageMgr singletonStorageMgr]addKey:@"quickId" andValue:dict[@"id"]];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"createQuick" object:nil];
    
}

@end
