//
//  CurrentOrderTableViewController.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "CurrentOrderTableViewController.h"
#import "CurrentOrderTableViewCell.h"
#import "CurrentOrderModel.h"
#import "CompleteOrderViewController.h"

@interface CurrentOrderTableViewController ()
@property (strong, nonatomic) NSArray *arr;

@end

@implementation CurrentOrderTableViewController

- (NSArray *)arr {
    if (_arr == nil) {
        CurrentOrderModel *model1 = [[CurrentOrderModel alloc] init];
        model1.headImage = @"Layer11";
        model1.nickname = @"Mark Robertson";
        model1.commodityImage = @"shop1";
        model1.commodityName = @"Master & Dynamic MH40";
        model1.commodityMsg = @"Over-Ear Headphones - Brown";
        model1.price = @"399.95";
        model1.quantity = @"2";
        CurrentOrderModel *model2 = [[CurrentOrderModel alloc] init];
        model2.headImage = @"Layer22";
        model2.nickname = @"Lisa Donovan";
        model2.commodityImage = @"demo1";
        model2.commodityName = @"B&O PLAY BeoPlay H8";
        model2.commodityMsg = @"wireless On-Ear Headphones";
        model2.price = @"499.95";
        model2.quantity = @"2";
        CurrentOrderModel *model3 = [[CurrentOrderModel alloc] init];
        model3.headImage = @"Layer11";
        model3.nickname = @"Lisa Donovan";
        model3.commodityImage = @"demo2";
        model3.commodityName = @"B&O PLAY BeoPlay H8";
        model3.commodityMsg = @"wireless On-Ear Headphones";
        model3.price = @"349.95";
        model3.quantity = @"2";
        CurrentOrderModel *model4 = [[CurrentOrderModel alloc] init];
        model4.headImage = @"Layer22";
        model4.nickname = @"Lisa Donovan";
        model4.commodityImage = @"demo3";
        model4.commodityName = @"B&O PLAY BeoPlay H8";
        model4.commodityMsg = @"wireless On-Ear Headphones";
        model4.price = @"123.95";
        model4.quantity = @"2";
        CurrentOrderModel *model5 = [[CurrentOrderModel alloc] init];
        model5.headImage = @"Layer22";
        model5.nickname = @"Lisa Donovan";
        model5.commodityImage = @"demo4";
        model5.commodityName = @"B&O PLAY BeoPlay H8";
        model5.commodityMsg = @"wireless On-Ear Headphones";
        model5.price = @"734.95";
        model5.quantity = @"2";
        _arr = @[model1, model2, model3, model4, model5];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    tableView.backgroundColor = UIColorFromRGB(248, 248, 248);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CurrentOrderTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:tableView];
    self.tableView = tableView;
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
