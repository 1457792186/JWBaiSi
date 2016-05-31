//
//  JWGuideView.m
//  JW百思
//
//  Created by scjy on 16/4/10.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWGuideView.h"

@implementation JWGuideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    self.frame = [UIScreen mainScreen].bounds;
}

- (IBAction)backButton:(UIButton *)sender {
    [self removeFromSuperview];
}
@end
