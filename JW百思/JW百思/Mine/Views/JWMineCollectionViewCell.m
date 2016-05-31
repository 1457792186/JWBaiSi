//
//  JWMineCollectionViewCell.m
//  JW百思
//
//  Created by scjy on 16/4/10.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWMineCollectionViewCell.h"
#import "UIView+JWFrame.h"
@implementation JWMineCollectionViewCell

- (void)awakeFromNib {
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1.f;
}

- (void)setSquareList:(JWMineSquareList *)squareList{
    if (!squareList)return;
    _squareList = squareList;
    self.showLabel.text = squareList.name;
    if (CGRectGetMaxY(self.showLabel.frame) > self.height) {
        self.imageHeight.constant = self.height - self.showLabel.height;
        self.imageWidth.constant = self.imageHeight.constant;
        [self setNeedsLayout];
    }
    
    [self.showImageView sd_setImageWithURL:[NSURL URLWithString:squareList.icon]];
}


@end
