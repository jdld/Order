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
#import "PaymentDetailsTableViewCell.h"
#import <PureLayout/PureLayout.h>
#import <IQKeyboardReturnKeyHandler.h>

@interface ReviewViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *arr;

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) IQKeyboardReturnKeyHandler    *returnKeyHandler;

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
        model1.price = @"399.95";
        model1.quantity = @"2";
        CurrentOrderModel *model2 = [[CurrentOrderModel alloc] init];
        model2.headImage = @"Layer22";
        model2.nickname = @"Lisa Donovan";
        model2.commodityImage = @"demo1";
        model2.commodityName = @"B&O PLAY BeoPlay H8";
        model2.commodityMsg = @"wireless On-Ear Headphones";
        model2.price = @"499.95";
        model2.quantity = @"1";
        CurrentOrderModel *model3 = [[CurrentOrderModel alloc] init];
        model3.headImage = @"Layer11";
        model3.nickname = @"Lisa Donovan";
        model3.commodityImage = @"demo2";
        model3.commodityName = @"B&O PLAY BeoPlay H8";
        model3.commodityMsg = @"wireless On-Ear Headphones";
        model3.price = @"349.95";
        model3.quantity = @"4";
        CurrentOrderModel *model4 = [[CurrentOrderModel alloc] init];
        model4.headImage = @"Layer22";
        model4.nickname = @"Lisa Donovan";
        model4.commodityImage = @"demo3";
        model4.commodityName = @"B&O PLAY BeoPlay H8";
        model4.commodityMsg = @"wireless On-Ear Headphones";
        model4.price = @"123.95";
        model4.quantity = @"1";
        CurrentOrderModel *model5 = [[CurrentOrderModel alloc] init];
        model5.headImage = @"Layer22";
        model5.nickname = @"Lisa Donovan";
        model5.commodityImage = @"demo4";
        model5.commodityName = @"B&O PLAY BeoPlay H8";
        model5.commodityMsg = @"wireless On-Ear Headphones";
        model5.price = @"734.95";
        model5.quantity = @"3";
        _arr = @[model1, model2, model3, model4, model5];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    CGRect navRect = self.navigationController.navigationBar.frame;
    float height = statusRect.size.height + navRect.size.height;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_W, self.view.frame.size.height + height + 38) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = UIColorFromRGB(248, 248, 248);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    self.view = _tableView;
//    [self.view addSubview:_tableView];
//    
//    [_tableView autoPinEdgesToSuperviewEdges];
    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    self.returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyDone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.returnKeyHandler = nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.arr.count;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 45;
    } else {
        return 18;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 115;
    }
    return 85;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 130;
    } else {
        return 260;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ReviewTableViewCell *cell = [ReviewTableViewCell cellWithTableView:_tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.currentOrder = self.arr[indexPath.row];
        return cell;
    } else {
        PaymentDetailsTableViewCell *cell = [PaymentDetailsTableViewCell cellWithTableView:_tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor clearColor];
    if (section == 0) {
        UIView *diView = [[UIView alloc] init];
        diView.backgroundColor = [UIColor whiteColor];
        [bgView addSubview:diView];
        
        [diView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:18];
        [diView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:18];
        [diView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:22];
        [diView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        UIView *midView = [[UIView alloc] init];
        midView.backgroundColor = [UIColor clearColor];
        midView.layer.shadowOffset = CGSizeMake(1, 1);
        midView.layer.shadowOpacity = 0.1f;
        [bgView addSubview:midView];
        
        [midView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:18];
        [midView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:18];
        [midView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
        [midView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:2];
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.cornerRadius = 5;
        [bgView addSubview:view];
        
        [view autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:18];
        [view autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:18];
        [view autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:18];
        [view autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        UILabel *label = [[UILabel alloc] init];
        label.textColor = UIColorFromRGB(50, 122, 229);
        label.text = @"REVIEW ORDER:";
        label.font = UIFont_small;
        [view addSubview:label];
        
        [label autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:14];
        [label autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:14];
    }
    
    return bgView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor clearColor];
    
    if (section == 0) {
        UIView *diView = [[UIView alloc] init];
        diView.backgroundColor = [UIColor whiteColor];
        [bgView addSubview:diView];
        
        [diView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:18];
        [diView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:18];
        [diView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [diView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:3];
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.cornerRadius = 5;
        [bgView addSubview:view];
        [view autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:18];
        [view autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:18];
        [view autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [view autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        UILabel *subTotalLbl = [[UILabel alloc] init];
        subTotalLbl.text = @"Sub-Total:";
        subTotalLbl.font = UIFont_mid;
        subTotalLbl.textColor = UIColorFromRGB(179, 188, 199);
        [view addSubview:subTotalLbl];
        
        [subTotalLbl autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:14];
        [subTotalLbl autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:14];
        
        UILabel *shippingLbl = [[UILabel alloc] init];
        shippingLbl.text = @"Shipping:";
        shippingLbl.font = UIFont_mid;
        shippingLbl.textColor = UIColorFromRGB(179, 188, 199);
        [view addSubview:shippingLbl];
        
        [shippingLbl autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:subTotalLbl];
        [shippingLbl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:subTotalLbl withOffset:14];
        
        UILabel *totalLbl = [[UILabel alloc] init];
        totalLbl.text = @"Total:";
        totalLbl.font = UIFont_big;
        [view addSubview:totalLbl];
        
        [totalLbl autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:shippingLbl];
        [totalLbl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:shippingLbl withOffset:14];
        float price = 0.f;
        for (CurrentOrderModel *model in self.arr) {
            NSString *priceStr = model.price;
            float priceFloat = [priceStr floatValue];
            priceFloat *= [model.quantity floatValue];
            price += priceFloat;
        }
        
        UILabel *subPriceLbl = [[UILabel alloc] init];
        subPriceLbl.text = [NSString stringWithFormat:@"$%@", [Utilities notRounding:price afterPoint:2]];
        subPriceLbl.font = UIFont_big;
        subPriceLbl.textColor = UIColorFromRGB(179, 188, 199);
        [view addSubview:subPriceLbl];
        
        [subPriceLbl autoAlignAxis:ALAxisHorizontal toSameAxisOfView:subTotalLbl];
        [subPriceLbl autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        
        UILabel *shippingPriceLbl = [[UILabel alloc] init];
        shippingPriceLbl.text = @"$50";
        shippingPriceLbl.font = UIFont_big;
        shippingPriceLbl.textColor = UIColorFromRGB(179, 188, 199);
        [view addSubview:shippingPriceLbl];
        
        [shippingPriceLbl autoAlignAxis:ALAxisHorizontal toSameAxisOfView:shippingLbl];
        [shippingPriceLbl autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:14];
        
        NSString *sumPrice = [NSString stringWithFormat:@"$%@", [Utilities notRounding:price + [shippingPriceLbl.text substringFromIndex:1].floatValue afterPoint:2]];
        UILabel *totalPriceLbl = [[UILabel alloc] init];
        totalPriceLbl.text = sumPrice;
        totalPriceLbl.font = UIFont_big;
        [view addSubview:totalPriceLbl];
        
        [totalPriceLbl autoAlignAxis:ALAxisHorizontal toSameAxisOfView:totalLbl];
        [totalPriceLbl autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:shippingPriceLbl];
        
        return bgView;
    } else {
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor clearColor];
        button.layer.cornerRadius = 5;
        button.layer.borderWidth = 1;
        button.layer.borderColor = UIColorFromRGB(50, 122, 229).CGColor;
        button.titleLabel.font = UIFont_mid;
        [button setTitle:@"PURCHASE PRODUCTS" forState:UIControlStateNormal];
        [button setTitleColor:UIColorFromRGB(50, 122, 229) forState:UIControlStateNormal];
        [bgView addSubview:button];
        
        [button autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:18];
        [button autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:18];
        [button autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:18];
        [button autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:18];
        
        return bgView;
    }
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
////    CGFloat sectionHeaderHeight = 45;
////    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
////        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
////    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
////        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
////    }
//    UITableView *tableview = (UITableView *)scrollView;
//    CGFloat sectionHeaderHeight = 45;
//    CGFloat sectionFooterHeight = 115;
//    CGFloat offsetY = tableview.contentOffset.y;
//    if (offsetY >= 0 && offsetY <= sectionHeaderHeight)
//    {
//        tableview.contentInset = UIEdgeInsetsMake(-offsetY, 0, -sectionFooterHeight, 0);
//    }else if (offsetY >= sectionHeaderHeight && offsetY <= tableview.contentSize.height - tableview.frame.size.height - sectionFooterHeight)
//    {
//        tableview.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, -sectionFooterHeight, 0);
//    }else if (offsetY >= tableview.contentSize.height - tableview.frame.size.height - sectionFooterHeight && offsetY <= tableview.contentSize.height - tableview.frame.size.height)
//    {
//        tableview.contentInset = UIEdgeInsetsMake(-offsetY, 0, -(tableview.contentSize.height - tableview.frame.size.height - sectionFooterHeight), 0);
//    }
//}

@end
