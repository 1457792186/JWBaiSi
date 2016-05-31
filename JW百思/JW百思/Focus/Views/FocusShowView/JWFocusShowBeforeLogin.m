//
//  JWFocusShowBeforeLogin.m
//  JW百思
//
//  Created by scjy on 16/4/10.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWFocusShowBeforeLogin.h"

@implementation JWFocusShowBeforeLogin

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    self.detilLabel.text = @"快快登陆吧，关注百思最牛的人\n好友动态让你过瘾\n哦耶~~";
}

- (IBAction)loginButton:(UIButton *)sender {
}
@end
