//
//  ReviewViewController.m
//  Order
//
//  Created by Etong on 16/7/13.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "ReviewViewController.h"
#import "ReviewTableViewCell.h"
#import "CurrentOrderModel.h"

@interface ReviewViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *arr;

@property (strong, nonatomic) UITableView *tableView;


@end

@implementation ReviewViewController

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
        model2.commodityImage = @"shop1";
        model2.commodityName = @"B&O PLAY BeoPlay H8";
        model2.commodityMsg = @"wireless On-Ear Headphones";
        model2.price = @"$499.95";
        model2.quantity = @"2";
        _arr = @[model1, model2];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReviewTableViewCell *cell = [ReviewTableViewCell cellWithTableView:_tableView];
    
    cell.currentOrder = self.arr[indexPath.row];
    
    return cell;
}

@end
