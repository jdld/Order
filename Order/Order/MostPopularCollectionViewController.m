//
//  MostPopularCollectionViewController.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "MostPopularCollectionViewController.h"
#import "MostPopularCollectionViewCell.h"
#import "DealsModel.h"

@interface MostPopularCollectionViewController ()

@property (strong, nonatomic) NSMutableArray<DealsModel *> *dealsArr;

@end

@implementation MostPopularCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 定义大小
//    layout.itemSize = CGSizeMake(190, 320);
//    layout.estimatedItemSize = CGSizeMake(190, 320);
    // 设置最小行间距
    layout.minimumLineSpacing = 10;
    // 设置垂直间距
    layout.minimumInteritemSpacing = 10;
    // 设置滚动方向（默认垂直滚动）
    //    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置边缘的间距，默认是{0，0，0，0}
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    return [self initWithCollectionViewLayout:layout];
}

- (NSMutableArray *)dealsArr {
    if (_dealsArr == nil) {
        DealsModel *model1 = [[DealsModel alloc] init];
        model1.headImage = @"White City Bike";
        model1.title = @"White City Bike";
        model1.detailsTitle = @"Be free, be more active. You have a chance to do that with this cool bike.";
        model1.price = @"$499.95";
        DealsModel *model2 = [[DealsModel alloc] init];
        model2.headImage = @"White City Bike";
        model2.title = @"Happy Hugs Coffee Cup";
        model2.detailsTitle = @"Cool coffee cup for the sad rainy days. Buy this and improve your life.";
        model2.price = @"$99.9";
        DealsModel *model3 = [[DealsModel alloc] init];
        model3.headImage = @"White City Bike";
        model3.title = @"Designer's Desk";
        model3.detailsTitle = @"Perfect your home office.";
        model1.price = @"$324.95";
        [_dealsArr addObject:model1];
        [_dealsArr addObject:model2];
        [_dealsArr addObject:model3];
    }
    
    return _dealsArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dealsArr = [NSMutableArray new];
    
    DealsModel *model1 = [[DealsModel alloc] init];
    model1.headImage = @"White City Bike";
    model1.title = @"White City Bike";
    model1.detailsTitle = @"Be free, be more active. You have a chance to do that with this cool bike.";
    model1.price = @"$499.95";
    DealsModel *model2 = [[DealsModel alloc] init];
    model2.headImage = @"White City Bike";
    model2.title = @"Happy Hugs Coffee Cup";
    model2.detailsTitle = @"Cool coffee cup for the sad rainy days. Buy this and improve your life.";
    model2.price = @"$99.9";
    DealsModel *model3 = [[DealsModel alloc] init];
    model3.headImage = @"White City Bike";
    model3.title = @"Designer's Desk";
    model3.detailsTitle = @"Perfect your home office.";
    model1.price = @"$324.95";
    [_dealsArr addObject:model1];
    [_dealsArr addObject:model2];
    [_dealsArr addObject:model3];
    
    self.collectionView.backgroundColor = UIColorFromRGB(248, 248, 248);
    self.collectionView.frame = self.view.bounds;
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MostPopularCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dealsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MostPopularCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.layer.cornerRadius = 5;
    cell.backgroundColor = [UIColor whiteColor];
    cell.deals = _dealsArr[indexPath.row];
    cell.layer.masksToBounds = NO;
    cell.layer.shadowOffset = CGSizeMake(0, 1);
    cell.layer.shadowOpacity = 0.1f;
//    [cell systemLayoutSizeFittingSize:CGSizeMake(cell.frame.size.width, cell.frame.size.height)];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DealsModel *model = _dealsArr[indexPath.row];
    CGFloat titleHeight = [Utilities stringHeight:model.title width:UI_SCREEN_W - 60 forfontSize:16];
    CGFloat detailsHeight = [Utilities stringHeight:model.detailsTitle width:UI_SCREEN_W - 60 forfontSize:12];
    CGFloat height = titleHeight + detailsHeight + 257;
    return CGSizeMake((UI_SCREEN_W - 30) / 2, height);
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"------%zd", indexPath.item);
}


@end
