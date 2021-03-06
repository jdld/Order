//
//  DealsOfTheMonthCollectionViewController.m
//  Order
//
//  Created by Etong on 16/7/12.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "DealsOfTheMonthCollectionViewController.h"
#import "MostPopularCollectionViewCell.h"
#import "DealsModel.h"
#import "CYXWaterFlowLayout.h"
#import "DetialViewController.h"

@interface DealsOfTheMonthCollectionViewController ()<UICollectionViewDataSource,CYXWaterFlowLayoutDelegate, UICollectionViewDelegate>
@property (strong, nonatomic) NSArray<DealsModel *> *dealsArr;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation DealsOfTheMonthCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

//- (instancetype)init{
//
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    // 定义大小
////    layout.itemSize = CGSizeMake(190, 320);
////    layout.estimatedItemSize = CGSizeMake(190, 320);
//    // 设置最小行间距
//    layout.minimumLineSpacing = 10;
//    // 设置垂直间距
//    layout.minimumInteritemSpacing = 10;
//    // 设置滚动方向（默认垂直滚动）
//    //    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    // 设置边缘的间距，默认是{0，0，0，0}
//    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//
//    return [self initWithCollectionViewLayout:layout];
//}

- (NSArray *)dealsArr {
    if (_dealsArr == nil) {
        DealsModel *model1 = [[DealsModel alloc] init];
        model1.headImage = @"detail_img3";
        model1.title = @"White City Bike";
        model1.detailsTitle = @"Be free, be more active. You have a chance to do that with this cool bike.";
        model1.price = @"$499.95";
        DealsModel *model2 = [[DealsModel alloc] init];
        model2.headImage = @"detail_img2";
        model2.title = @"Happy Hugs Coffee Cup";
        model2.detailsTitle = @"Cool coffee cup for the sad rainy days. Buy this and improve your life.";
        model2.price = @"$99.9";
        DealsModel *model3 = [[DealsModel alloc] init];
        model3.headImage = @"detail_img1";
        model3.title = @"Designer's Desk";
        model3.detailsTitle = @"Perfect your home office.";
        model3.price = @"$324.95";
        _dealsArr = @[model1, model2, model3];
    }
    
    return _dealsArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CYXWaterFlowLayout *layout = [[CYXWaterFlowLayout alloc]init];
    layout.delegate = self;
    
    // 创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:    CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 146) collectionViewLayout:layout];
    collectionView.backgroundColor = UIColorFromRGB(248, 248, 248);
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MostPopularCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dealsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MostPopularCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.layer.cornerRadius = 5;
    cell.backgroundColor = [UIColor whiteColor];
    cell.deals = self.dealsArr[indexPath.row];
    cell.layer.masksToBounds = NO;
    cell.layer.shadowOffset = CGSizeMake(0, 1);
    cell.layer.shadowOpacity = 0.2f;
    //    [cell systemLayoutSizeFittingSize:CGSizeMake(cell.frame.size.width, cell.frame.size.height)];
    
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    DealsModel *model = self.dealsArr[indexPath.row];
//    CGFloat titleHeight = [Utilities stringHeight:model.title width:UI_SCREEN_W - 60 forfontSize:16];
//    CGFloat detailsHeight = [Utilities stringHeight:model.detailsTitle width:UI_SCREEN_W - 60 forfontSize:12];
//    CGFloat height = titleHeight + detailsHeight + 257;
//    return CGSizeMake((UI_SCREEN_W - 30) / 2, height);
//}
//
#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"------%zd", indexPath.item);
    DetialViewController *Detial = [Utilities getStoryboardInstanceByIdentity:@"Home" byIdentity:@"Detial"];
    DealsModel *model = self.dealsArr[indexPath.row];
    NSDictionary *dict = @{@"image":model.headImage,
                           @"name":model.title,
                           @"detial":model.detailsTitle,
                           @"much":model.price};
    Detial.dict = dict;
    [self.navigationController pushViewController:Detial animated:YES];
}

- (CGFloat)waterflowLayout:(CYXWaterFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth itemIndexPath:(NSIndexPath *)indexPath {
    DealsModel *model = self.dealsArr[indexPath.row];
    CGFloat titleHeight = [Utilities stringHeight:model.title width:itemWidth - 36 forfontSize:16];
    CGFloat detailsHeight = [Utilities stringHeight:model.detailsTitle width:itemWidth - 50 forfontSize:12];
    CGFloat height = titleHeight + detailsHeight + 258;
    return height;
}

- (CGFloat)rowMarginInWaterflowLayout:(CYXWaterFlowLayout *)waterflowLayout
{
    return 15;
}

- (CGFloat)columnMarginInWaterflowLayout:(CYXWaterFlowLayout *)waterflowLayout {
    return 15;
}

- (CGFloat)columnCountInWaterflowLayout:(CYXWaterFlowLayout *)waterflowLayout
{
    return 2;
}

- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(CYXWaterFlowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

@end
