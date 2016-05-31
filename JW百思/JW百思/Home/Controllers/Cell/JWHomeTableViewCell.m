//
//  JWHomeTableViewCell.m
//  JW百思
//
//  Created by scjy on 16/3/24.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWHomeTableViewCell.h"

@implementation JWHomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(JWListModel *)model{
    if (!model)return;
    
    _model = model;
    
    __weak typeof(self)mySelf = self;
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:model.profile_image] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        [mySelf.iconButton setBackgroundImage:image forState:UIControlStateNormal];
    }];
    self.nameLabel.text = model.name;
    self.timeLabel.text = [JWTools dateStr:model.create_time];
    self.contentTextLabel.text = model.text;
    
    if (model.bimageuri) {
        __weak typeof(self)mySelf = self;
        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:model.bimageuri] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            mySelf.showImageViewHeigh.constant = image.size.height;
            if (image.size.width > self.width) {
                mySelf.showImageViewWidth.constant = self.width;
            }else{
                mySelf.showImageViewWidth.constant = image.size.width;
            }
            
            mySelf.showImageView.image = image;
            [mySelf setNeedsLayout];
        }];
    } else{
        self.showImageViewHeigh.constant = 0.f;
        self.showImageViewWidth.constant = 0.f;
        [self setNeedsLayout];
    }
    
    [self.sureButton setTitle:[NSString stringWithFormat:@"%@",model.ding] forState:UIControlStateNormal];
    [self.argueButton setTitle:[NSString stringWithFormat:@"%@",model.hate] forState:UIControlStateNormal];
    [self.showButton setTitle:[NSString stringWithFormat:@"%@",model.repost] forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat:@"%@",model.comment] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
