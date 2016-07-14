//
//  HistoryTableViewController.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "HistoryTableViewController.h"
#import "CurrentOrderTableViewCell.h"
#import "CurrentOrderModel.h"
#import "CompleteOrderViewController.h"

@interface HistoryTableViewController ()
@property (strong, nonatomic) NSArray *arr;
@end

@implementation HistoryTableViewController

- (NSArray *)arr {
    if (_arr == nil) {
        CurrentOrderModel *model1 = [[CurrentOrderModel alloc] init];
        model1.headImage = @"Layer11";
        model1.nickname = @"Mark Robertson";
        model1.commodityImage = @"shop1";
        model1.commodityName = @"Master & Dynamic MH40";
        model1.commodityMsg = @"Over-Ear Headphones - Brown";
        model1.price = @"$399.95";
        model1.quantity = @"2";
        CurrentOrderModel *model2 = [[CurrentOrderModel alloc] init];
        model2.headImage = @"Layer22";
        model2.nickname = @"Lisa Donovan";
        model2.commodityImage = @"demo1";
        model2.commodityName = @"B&O PLAY BeoPlay H8";
        model2.commodityMsg = @"wireless On-Ear Headphones";
        model2.price = @"$499.95";
        model2.quantity = @"2";
        _arr = @[model2, model1];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = UIColorFromRGB(248, 248, 248);
    self.tableView.frame = self.view.bounds;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CurrentOrderTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self arr].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 152;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CurrentOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.currentOrder = [self arr][indexPath.row];
    cell.contantView.layer.masksToBounds = NO;
    cell.contantView.layer.shadowOffset = CGSizeMake(0, 1);
    cell.contantView.layer.shadowOpacity = 0.2f;
    cell.contantView.layer.shadowRadius = 2;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    CompleteOrderViewController *coVC = [[CompleteOrderViewController alloc] init];
    [self.navigationController pushViewController:coVC animated:YES];
}
@end
