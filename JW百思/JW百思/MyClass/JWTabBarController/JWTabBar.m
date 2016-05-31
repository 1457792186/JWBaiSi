//
//  JWTabBar.m
//  JW百思
//
//  Created by scjy on 16/3/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWTabBar.h"

@implementation JWTabBar


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.centerButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [self.centerButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self.centerButton addTarget:self action:@selector(centerButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.centerButton];
        
    }
    return self;
}


- (void)centerButtonAction{
    //get root window
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    JWPublishViewController * publishVC = [[JWPublishViewController alloc]init];
    
    [window.rootViewController presentViewController:publishVC animated:NO completion:nil];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    UIImage * buttonImage = [UIImage imageNamed:@"tabBar_publish_icon"];
    self.centerButton.size = CGSizeMake(buttonImage.size.width, buttonImage.size.height);
    self.centerButton.centerPoint =  CGPointMake(self.width/2, self.height/2);
    
    CGFloat tabBarWidth = self.width/5;
    CGFloat tabBarY = self.height/2;
    
//    JWLog(@"%@",self.subviews);
    
    NSInteger index = 0;
    
    for (UIView * subView in self.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (index == 2) {
                index++;
            }
            subView.centerPoint = CGPointMake(tabBarWidth/2 + index * tabBarWidth, tabBarY);
            index++;
        }
    }
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
