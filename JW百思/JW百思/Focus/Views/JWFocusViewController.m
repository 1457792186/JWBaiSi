//
//  JWFocusViewController.m
//  JW百思
//
//  Created by scjy on 16/3/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWFocusViewController.h"
#import "JWFocusShowBeforeLogin.h"

@interface JWFocusViewController ()

@end

@implementation JWFocusViewController


- (void)loadView{
    [super loadView];
    
    JWFocusShowBeforeLogin * focusBeforeLogin = [[[NSBundle mainBundle]loadNibNamed:@"JWFocusShowBeforeLogin" owner:nil options:nil]lastObject];
    self.view = focusBeforeLogin;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"关注";
    
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
