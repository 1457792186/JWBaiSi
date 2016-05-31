//
//  JWMenuTableViewCell.m
//  JW百思
//
//  Created by scjy on 16/3/23.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWMenuTableViewCell.h"

@implementation JWMenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.showView.isSelected = selected;
    if (selected) {
        self.tittleLabel.textColor = [UIColor redColor];
    } else{
        self.tittleLabel.textColor = [UIColor blackColor];
    }
    
}

@end
