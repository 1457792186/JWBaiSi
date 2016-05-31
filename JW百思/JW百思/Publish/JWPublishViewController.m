//
//  JWPublishViewController.m
//  JW百思
//
//  Created by scjy on 16/3/30.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWPublishViewController.h"
#import "JWPublishItem.h"
#import <POP.h>
#import "JWNavigationViewController.h"
#import "JWPublishMessageViewController.h"


#define itemWidth 80.f
#define itemHeight 110.f

@interface JWPublishViewController ()

@end

@implementation JWPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSArray *itemImageNames = @[@"publish-audio",@"publish-offline",@"publish-picture",@"publish-review",@"publish-text",@"publish-video"];
    
    NSArray *itemTexts = @[@"发声音",@"离线下载",@"发图片",@"审帖",@"发段子",@"发视频"];
    
    CGFloat itemEndge = (self.view.width - itemWidth * 3)/4;
    
    for (int i = 0; i < itemImageNames.count; i++) {
        JWPublishItem * item = [[[NSBundle mainBundle]loadNibNamed:@"JWPublishItem" owner:nil options:nil] lastObject];
        [item.itemButton setBackgroundImage:[UIImage imageNamed:itemImageNames[i]] forState:UIControlStateNormal];
        item.itemLabel.text = itemTexts[i];
        
        item.itemButton.tag = i + 2333;
        [item.itemButton addTarget:self action:@selector(itemButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        item.frame = CGRectMake(i % 3 * (itemWidth + itemEndge) + itemEndge, - item.height * 2, item.width, item.height);
        [self.view addSubview:item];
        
        [item pop_addAnimation:[self addPOPAnimationWithFromValue:[NSValue valueWithCGRect:CGRectMake(item.x, item.y, item.width, item.height)] ToValue:[NSValue valueWithCGRect:CGRectMake(i % 3 * (itemWidth + itemEndge) + itemEndge, i/3 * (itemHeight + 5.f) + self.view.height/2, item.width, item.height)] WithSpringBounciness:10.0f WithSpringSpeed:5.0f WithBeginTime:(i * 0.1f)] forKey:nil];
    }
    
    
    UIImageView * imageVC = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.width - 200.f)/2, -100.f, 200.f, 100.f)];
    imageVC.image = [UIImage imageNamed:@"app_slogan"];
    [self.view addSubview:imageVC];
    
    [imageVC pop_addAnimation:[self addPOPAnimationWithFromValue:[NSValue valueWithCGRect:imageVC.frame] ToValue:[NSValue valueWithCGRect:CGRectMake(imageVC.x, -imageVC.y, imageVC.width, imageVC.height)] WithSpringBounciness:10.f WithSpringSpeed:5.f WithBeginTime:itemImageNames.count * 0.1] forKey:nil];
    
    
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(20.f, self.view.height - 60.f, self.view.width - 20.f * 2, 50.f);
    cancelBtn.layer.cornerRadius = 16.f;
    [cancelBtn setBackgroundColor:[UIColor greenColor]];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(backBarButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    
}

- (POPAnimation *)addPOPAnimationWithFromValue:(id)fromValue ToValue:(id)toValue WithSpringBounciness:(CGFloat)springBounciness WithSpringSpeed:(CGFloat)springSpeed WithBeginTime:(CFTimeInterval)beginTime{
    POPSpringAnimation * popAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    popAnimation.fromValue = fromValue;
    popAnimation.toValue = toValue;
    
    popAnimation.springBounciness = springBounciness;
    popAnimation.springSpeed = springSpeed;
    popAnimation.beginTime = CACurrentMediaTime() + beginTime;
    
    return popAnimation;
}

- (void)backBarButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)itemButtonAction:(id)sender{
    UIButton * btn = (UIButton *)sender;
    NSInteger senderTag = btn.tag - 2333;
    switch (senderTag) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:{
            [self itemPresentVC:[JWPublishMessageViewController class]];
        }
            break;
        case 5:
            
            break;
            
        default:
            break;
    }
}

/**
 *  实现界面跳转
 *
 *  @param vcClass 要跳转的VC类型
 */
- (void)itemPresentVC:(Class)vcClass{
    JWNavigationViewController * navigationVC = [[JWNavigationViewController alloc]initWithRootViewController:[[vcClass alloc]init]];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //界面退出后进行跳转需要用window加载
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navigationVC animated:YES completion:nil];
}

@end
