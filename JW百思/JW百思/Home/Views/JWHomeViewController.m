//
//  JWHomeViewController.m
//  JW百思
//
//  Created by scjy on 16/3/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWHomeViewController.h"

#import "JWSegment.h"
#import "JWHomeTableViewCell.h"
#import "JWHomeTableView.h"


#define NavigationBarHeigh 64.f
#define SegmentHeigh 30.f

@interface JWHomeViewController ()<JWTableViewSlide>

@property (nonatomic,assign)CGFloat navigationBarHeight;

@property (nonatomic,strong)JWHomeTableView * currentTableView;
@property (nonatomic,strong)NSMutableArray * myTableViewArray;

@property (nonatomic,strong)JWSegment * segment;

@end

@implementation JWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.segment = [[JWSegment alloc]initWithFrame:CGRectMake(0.f, NavigationBarHeigh, self.view.width, SegmentHeigh) withItems:@[@"全部",@"视屏",@"声音",@"图片",@"段子"]];
    [self.view addSubview:self.segment];
    
    self.currentTableView = [self createTableView];
    self.currentTableView.type = 1;
    [self.currentTableView downRefreshGetData];
    
    __weak typeof(self)mySelf = self;
    self.segment.selectDirection = ^(JWSegmentDirection direction){
        JWHomeTableView * willShowTableView = [mySelf createTableView];
        [mySelf refreshTableViewType:willShowTableView];
        [mySelf tableView:willShowTableView animateWithDirection:direction == HomeTableViewDirectionLeft?YES:NO];
    };
    
}

- (NSMutableArray *)myTableViewArray{
    if (!_myTableViewArray) {
        _myTableViewArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _myTableViewArray;
}

#pragma mark - HomeTableView
- (JWHomeTableView *)createTableView{
    
    JWHomeTableView * willShowTableView = nil;
    if (self.myTableViewArray.count > 0) {
        willShowTableView = [self.myTableViewArray lastObject];
        [self.myTableViewArray removeLastObject];
    }else{
        willShowTableView = [[JWHomeTableView alloc]initWithFrame:CGRectMake(0.f, NavigationBarHeigh + SegmentHeigh, self.view.width, self.view.height - NavigationBarHeigh - SegmentHeigh - self.tabBarController.tabBar.height) style:UITableViewStylePlain];
        willShowTableView.homeDelegate = self;
        
        [self.view addSubview:willShowTableView];
    }
    return willShowTableView;
}

- (void)tableView:(JWHomeTableView *)willShowTableView animateWithDirection:(BOOL)directionLeft{
    CGFloat willShowTableViewWidth = directionLeft?self.view.width:(-self.view.width);
    willShowTableView.x = willShowTableViewWidth;
    
    __weak typeof(self)myself = self;
    __weak typeof(willShowTableView)myWillShowView = willShowTableView;
    [UIView animateWithDuration:1.0f animations:^{
        myWillShowView.x -= willShowTableViewWidth;
        myself.currentTableView.x -= willShowTableViewWidth;
    } completion:^(BOOL finished) {
        [myself.myTableViewArray addObject:myself.currentTableView];
        myself.currentTableView = myWillShowView;
    }];
}

- (void)panWithDirection:(HomeTableViewDirection)direction{
    if (direction == HomeTableViewDirectionLeft) {
        if (self.segment.currentIndex < self.segment.segmentItems.count - 1) {
            self.segment.currentIndex++;
        }else{
            return;
        }
    } else{
        if (self.segment.currentIndex > 0) {
            self.segment.currentIndex--;
        }else{
            return;
        }
    }
    
    JWHomeTableView * willShowTableView = [self createTableView];
    [self refreshTableViewType:willShowTableView];
    
    [self tableView:willShowTableView animateWithDirection:direction == HomeTableViewDirectionLeft?YES:NO];
}


- (void)refreshTableViewType:(JWHomeTableView *)willShowView{
    switch (self.segment.currentIndex) {
        case 0:
            willShowView.type = HomeTableViewTypeAll;
            break;
        case 1:
            willShowView.type = HomeTableViewTypePicture;
            break;
        case 2:
            willShowView.type = HomeTableViewTypeWord;
            break;
        case 3:
            willShowView.type = HomeTableViewTypeVoice;
            break;
        case 4:
            willShowView.type = HomeTableViewTypeVideo;
            break;
            
        default:
            break;
    }
    [willShowView downRefreshGetData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
