//
//  JWMineDetilViewController.m
//  JW百思
//
//  Created by scjy on 16/4/11.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWMineDetilViewController.h"

@interface JWMineDetilViewController ()

@end

@implementation JWMineDetilViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.goFormartButton setTransform:CGAffineTransformMakeRotation(M_PI)];
    [self backBarButtonItemCustom];
    self.title = self.name;
    
    NSURL * requestURL = [NSURL URLWithString:self.loadURL];
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:requestURL];
    [self.webLoadView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
