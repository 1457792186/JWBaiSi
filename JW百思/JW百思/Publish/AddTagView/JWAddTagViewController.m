//
//  JWAddTagViewController.m
//  JW百思
//
//  Created by scjy on 16/4/4.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWAddTagViewController.h"
#import "JWTagView.h"
#import "JWAddTagTextField.h"
#import "UIView+JWFrame.h"
@interface JWAddTagViewController ()<UITextFieldDelegate>

@property (nonatomic,strong)JWAddTagTextField * tagTextField;
@property (nonatomic,strong)NSMutableArray * tagArray;

@end

@implementation JWAddTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"添加标签";
    [self backBarButtonItemCustom];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tagTextField = [[JWAddTagTextField alloc]initWithFrame:CGRectMake(0.f, 64.f, self.view.width, 30.f)];
    self.tagTextField.delegate = self;
    [self.view addSubview:self.tagTextField];
    
    
}



- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tagTextField becomeFirstResponder];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [self.tagTextField resignFirstResponder];
    }
    
    return YES;
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
