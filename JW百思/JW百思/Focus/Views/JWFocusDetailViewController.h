//
//  JWFocusDetailViewController.h
//  JW百思
//
//  Created by scjy on 16/3/23.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWBasicViewController.h"
#import "JWMenuTableView.h"
#import "JWDetailTableView.h"
#import "JWMenuTableViewCell.h"

@interface JWFocusDetailViewController : JWBasicViewController


@property (weak, nonatomic) IBOutlet JWMenuTableView *menuTableView;
@property (nonatomic,strong)NSArray * menuArray;

@property (weak, nonatomic) IBOutlet JWDetailTableView *detailTableView;

@end
