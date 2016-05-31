//
//  JWMineCollectionViewCell.h
//  JW百思
//
//  Created by scjy on 16/4/10.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWMineSquareList.h"
#import <UIImageView+WebCache.h>

@interface JWMineCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (nonatomic,strong)JWMineSquareList * squareList;

@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;



@end
