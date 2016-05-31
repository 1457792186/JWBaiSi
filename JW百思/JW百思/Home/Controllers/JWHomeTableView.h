//
//  JWHomeTableView.h
//  JW百思
//
//  Created by scjy on 16/3/24.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWAFN.h"
#import "JWHomeTableViewCell.h"
#import "JWHomeCellModel.h"
#import <MJRefresh.h>

typedef enum _homeTableViewDirection{
    HomeTableViewDirectionRight,
    HomeTableViewDirectionLeft
}HomeTableViewDirection;

typedef enum _homeTableViewType{
    HomeTableViewTypeAll = 1,
    HomeTableViewTypePicture = 10,
    HomeTableViewTypeWord = 29,
    HomeTableViewTypeVoice = 31,
    HomeTableViewTypeVideo = 41
}HomeTableViewType;

@protocol JWTableViewSlide <NSObject>

- (void)panWithDirection:(HomeTableViewDirection)direction;

@end

@interface JWHomeTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray * dataArray;
@property (nonatomic,strong)JWHomeCellModel * model;

@property (nonatomic,assign)NSInteger type;
@property (nonatomic,strong)NSNumber * maxtime;
@property (nonatomic,assign)NSInteger page;

@property (nonatomic,assign)CGPoint startPoint;

@property (nonatomic,weak)id <JWTableViewSlide> homeDelegate;

- (void)downRefreshGetData;
- (void)upRefreshGetData;

@end
