//
//  ProfileViewController.m
//  Order
//
//  Created by Etong on 16/7/7.
//  Copyright © 2016年 Etong. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileCollectionViewCell.h"

@interface ProfileViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *objArr;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Profile";
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Navigation"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(more)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    _editBut.layer.cornerRadius = 5;
    _editBut.layer.borderWidth = 1;
    _editBut.layer.borderColor = [UIColor colorWithRed:50.f/255.f green:122.f/255.f blue:229.f/255.f alpha:1].CGColor;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    _objArr = [NSMutableArray new];
    NSDictionary *dic1 = @{@"state":@"Shipped",@"image":@"shop3",@"name":@"Master & Dynamic MH40",@"time":@"04/10/2015"};
    NSDictionary *dic2 = @{@"state":@"Canceled",@"image":@"shop2",@"name":@"B&O PLAY BeoPlay H8",@"time":@"04/10/2015"};
    [_objArr addObject:dic1];
    [_objArr addObject:dic2];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProfileCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *dict = _objArr[indexPath.row];
    cell.stateLab.text = [NSString stringWithFormat:@"◉ %@",dict[@"state"]];
    if ([dict[@"state"]isEqualToString:@"Shipped"]) {
        cell.stateLab.textColor = [UIColor greenColor];
    }else{
        cell.stateLab.textColor = [UIColor redColor];
    }
    cell.ImageView.image = [UIImage imageNamed:dict[@"image"]];
    cell.nameLab.text = dict[@"name"];
    cell.timeLab.text = [NSString stringWithFormat:@"Ordered: %@",dict[@"time"]];
    
    cell.backView.layer.cornerRadius = 5;
    cell.shadowView.layer.cornerRadius = 5;

    
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (iPhone6Plus_6sPlus) {
        return CGSizeMake((UI_SCREEN_W - 60)/2, 240);
    }else if (iPhone6_6s){
        return CGSizeMake((UI_SCREEN_W - 60)/2, 220);
    }else if (iPhone5SE){
        return CGSizeMake((UI_SCREEN_W - 60)/2, 200);
    }
    return CGSizeMake((UI_SCREEN_W - 60)/2, 200);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(-5, 5, 5, 5);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) more {
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
