//
//  JWHomeTableViewCell.h
//  JW百思
//
//  Created by scjy on 16/3/24.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWListModel.h"
#import <UIImageView+WebCache.h>

@interface JWHomeTableViewCell : UITableViewCell

@property (nonatomic,strong)JWListModel * model;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *showImageViewHeigh;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *showImageViewWidth;


@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (weak, nonatomic) IBOutlet UIButton *userButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property (weak, nonatomic) IBOutlet UIButton *argueButton;
@property (weak, nonatomic) IBOutlet UIButton *showButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end
