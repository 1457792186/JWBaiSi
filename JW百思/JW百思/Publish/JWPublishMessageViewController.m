//
//  JWPublishMessageViewController.m
//  JW百思
//
//  Created by scjy on 16/4/1.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWPublishMessageViewController.h"
#import "JWPublishToolsBarView.h"
#import "JWMessageTextView.h"
#import "JWAddTagViewController.h"

@interface JWPublishMessageViewController ()<UITextViewDelegate>

@property (nonatomic,strong)JWPublishToolsBarView * sendToolBarView;

@property (nonatomic,strong)JWMessageTextView * messageTextView;

@end

@implementation JWPublishMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发段子";
    [self setPublishViewSubviews];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self addTextViewNotification];
    [self.messageTextView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.messageTextView resignFirstResponder];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardChangeFrame:(NSNotification *)notification{
    CGRect startRect = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.sendToolBarView.frame = CGRectMake(self.sendToolBarView.x, self.sendToolBarView.y - (startRect.origin.y - endRect.origin.y), self.sendToolBarView.width, self.sendToolBarView.height);
    } completion:nil];
    //    JWLog(@"%@",notification);
}

#pragma mark - ButtonAction
- (void)addTagButtonActin:(id)sender{
    JWAddTagViewController * addtagVC = [[JWAddTagViewController alloc]init];
    [self.navigationController pushViewController:addtagVC animated:YES];
}

- (void)backBarButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - AddSubViews
- (void)setPublishViewSubviews{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barItemWithImageName:nil withSelectImage:nil withHorizontalAlignment:UIControlContentHorizontalAlignmentLeft withTittle:@"取消" withTittleColor:[UIColor redColor] withTarget:self action:@selector(backBarButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self addPublishTextView];
    [self addToolBarView];
    
}
- (void)addPublishTextView{
    self.messageTextView = [[JWMessageTextView alloc]initWithFrame:CGRectMake(0.f, 64.f, self.view.width, 200.f)];
    self.messageTextView.placehoder = @"把好玩的图片，好笑的段子或糗事发到这里，接受千万网友膜拜吧！发布违反国家法律内容的，我们将依法提交给有关部门处理。";
    self.messageTextView.delegate = self;
    [self.view addSubview:self.messageTextView];
}
- (void)addToolBarView{
    self.sendToolBarView = [[[NSBundle mainBundle]loadNibNamed:@"JWPublishToolsBarView" owner:nil options:nil]lastObject];
    [self.sendToolBarView.addTagButton addTarget:self action:@selector(addTagButtonActin:) forControlEvents:UIControlEventTouchUpInside];
    self.sendToolBarView.frame = CGRectMake(0.f, self.view.height - self.sendToolBarView.height, self.view.width, self.sendToolBarView.height);
    [self.view addSubview:self.sendToolBarView];
}
- (void)addTextViewNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}


#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [self.messageTextView resignFirstResponder];
    }
    return YES;
}


@end
