//
//  JWMineViewController.m
//  JW百思
//
//  Created by scjy on 16/3/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWMineViewController.h"
#import "JWMineCollectionView.h"
#import "JWMineCollectionHeader.h"
#import "JWMineCollectionViewCell.h"
#import "JWMineModel.h"
#import "JWMineDetilViewController.h"

#import "JWAFN.h"
#import <MJExtension.h>
#import "UIView+JWFrame.h"
@interface JWMineViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic,strong)JWMineModel * model;
@property (nonatomic,strong)JWMineCollectionView * collectionView;

@end

@implementation JWMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UICollectionViewFlowLayout * collectionFlowLayout = [[UICollectionViewFlowLayout alloc]init];
    collectionFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[JWMineCollectionView alloc]initWithFrame:CGRectMake(0.f, 64.f, self.view.width, self.view.height - 64.f - self.tabBarController.tabBar.height) collectionViewLayout:collectionFlowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"JWMineCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"mineCollectionViewCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"JWMineCollectionHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineCollectionHeader"];
    
    [self.view addSubview:self.collectionView];
    [self requestData];
}

- (void)requestData{
    JWAFN * manger = [JWAFN manger];
    
    __weak typeof(self)mySelf = self;
    [manger.manger GET:JWURLPath parameters:@{@"a":@"square",@"c":@"topic"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        JWLog(@"%@",responseObject);
        mySelf.model = [JWMineModel mj_objectWithKeyValues:responseObject];
        
        [mySelf.collectionView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JWLog(@"%@",error);
    }];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.view.width, 44.f * 2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.width/4, self.view.width/4);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.f;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.f;
}

#pragma mark - UICollectionViewDataSource
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    JWMineDetilViewController * detilVC = [[JWMineDetilViewController alloc]init];
    JWMineSquareList * squareList = self.model.squareList[indexPath.row];
    detilVC.name = squareList.name;
    detilVC.loadURL = squareList.url;
    
    [self.navigationController pushViewController:detilVC animated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.model.squareList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JWMineCollectionViewCell * mineCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mineCollectionViewCell" forIndexPath:indexPath];
    mineCell.squareList = self.model.squareList[indexPath.row];
    return mineCell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        JWMineCollectionHeader * mineHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"mineCollectionHeader" forIndexPath:indexPath];
        return mineHeaderView;
    }
    return nil;
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

@end
