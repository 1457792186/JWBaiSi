//
//  JWHomeTableView.m
//  JW百思
//
//  Created by scjy on 16/3/24.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWHomeTableView.h"

@implementation JWHomeTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self registerNib:[UINib nibWithNibName:@"JWHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"homeTableViewCell"];
        
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self downRefreshGetData];
        }];
        
        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self upRefreshGetData];
        }];
        
        self.rowHeight = UITableViewAutomaticDimension;
    }
    return self;
}

#pragma mark - NetWorking
- (void)downRefreshGetData{
    
    JWAFN * manger = [JWAFN manger];
    __weak typeof(self)mySelf = self;
    [manger.manger GET:JWURLPath parameters:@{@"a":@"list",@"c":@"data",@"type":@(self.type)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [mySelf.mj_header endRefreshing];
//        JWLog(@"%@",responseObject);
        mySelf.model = [JWHomeCellModel mj_objectWithKeyValues:responseObject];
        mySelf.dataArray = [NSMutableArray arrayWithArray:self.model.list];
        mySelf.maxtime = self.model.info.maxtime;
        
        [mySelf reloadData];
        
        [mySelf scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JWLog(@"%@",error);
    }];
}

- (void)upRefreshGetData{
    
    JWAFN * manger = [JWAFN manger];
    __weak typeof(self)mySelf = self;
    [manger.manger GET:JWURLPath parameters:@{@"a":@"list",@"c":@"data",@"type":@(self.type),@"page":@(self.page++),@"maxtime":self.maxtime} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [mySelf.mj_footer endRefreshing];
        //        JWLog(@"%@",responseObject);
        mySelf.model = [JWHomeCellModel mj_objectWithKeyValues:responseObject];
        [mySelf.dataArray addObjectsFromArray:self.model.list];
        mySelf.maxtime = self.model.info.maxtime;
        
        [mySelf reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JWLog(@"%@",error);
    }];
}

#pragma mark - TouchAction

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    self.startPoint = [touch locationInView:self];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:self];
    
    if (endPoint.x - self.startPoint.x > self.width / 4) {
        if (self.homeDelegate && [self.homeDelegate respondsToSelector:@selector(panWithDirection:)]){
            [self.homeDelegate panWithDirection:HomeTableViewDirectionRight];
        }
        
    }else if (self.startPoint.x - endPoint.x > self.width / 4){
        if (self.homeDelegate && [self.homeDelegate respondsToSelector:@selector(panWithDirection:)]){
            [self.homeDelegate panWithDirection:HomeTableViewDirectionLeft];
        }
    }else{
        
        NSIndexPath * indexPath = [self indexPathForRowAtPoint:endPoint];
        [self selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 1000.f;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JWHomeTableViewCell * homeCell = [tableView dequeueReusableCellWithIdentifier:@"homeTableViewCell" forIndexPath:indexPath];
    homeCell.model = self.dataArray[indexPath.row];
    
    return homeCell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
