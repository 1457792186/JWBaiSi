//
//  JWBasicViewController.m
//  JW百思
//
//  Created by scjy on 16/3/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWBasicViewController.h"
#import "JWFocusDetailViewController.h"
#import "UIBarButtonItem+SettingCustom.h"
@interface JWBasicViewController ()

@end

@implementation JWBasicViewController

#pragma mark - InitWithItemType
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemType = DEFAULT;
    }
    return self;
}

- (instancetype)initWith:(ViewControllerNavigationItemType)itemType
{
    self = [super init];
    if (self) {
        self.itemType = itemType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    switch (self.itemType) {
        case HOME:
            self.navigationItem.leftBarButtonItem = [UIBarButtonItem barItemWithImageName:@"MainTagSubIcon" withSelectImage:@"MainTagSubIconClick" withHorizontalAlignment:UIControlContentHorizontalAlignmentLeft withTarget:self action:@selector(homeVCClick:) forControlEvents:UIControlEventTouchUpInside];
            break;
        case NONE:
            self.navigationItem.leftBarButtonItem = nil;
            break;
        case FOCUS:
            self.navigationItem.leftBarButtonItem = [UIBarButtonItem barItemWithImageName:@"cellFollowIcon" withSelectImage:@"cellFollowClickIcon" withHorizontalAlignment:UIControlContentHorizontalAlignmentLeft withTarget:self action:@selector(focusVCClick:) forControlEvents:UIControlEventTouchUpInside];
            break;
        case MINESTYLE|MINESETTING:
            self.navigationItem.rightBarButtonItems = @[[UIBarButtonItem barItemWithImageName:@"mine-setting-icon" withSelectImage:@"mine-setting-icon-click" withHorizontalAlignment:UIControlContentHorizontalAlignmentRight withTarget:self action:@selector(settingVCClick:) forControlEvents:UIControlEventTouchUpInside],[UIBarButtonItem barItemWithImageName:@"mine-moon-icon" withSelectImage:@"mine-moon-icon-click" withHorizontalAlignment:UIControlContentHorizontalAlignmentRight withTarget:self action:@selector(moonVCClick:) forControlEvents:UIControlEventTouchUpInside]];
            break;
            
        default:
            break;
    }
    
}


- (BOOL)backBarButtonItemCustom{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barItemWithImageName:@"navigationButtonReturn" withSelectImage:@"navigationButtonReturnClick" withHorizontalAlignment:UIControlContentHorizontalAlignmentLeft withTittle:@"返回" withTittleColor:[UIColor blackColor] withTarget:self action:@selector(backBarButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    return YES;
}

#pragma mark - 取消第一响应
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - ButtonAction
- (void)backBarButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)homeVCClick:(id)sender{
    JWLog(@"%s,%@",__func__,self);
}

- (void)focusVCClick:(id)sender{
    JWLog(@"%s,%@",__func__,self);
    UIViewController * focusDetailVC = [UIStoryboard VCWithStoryBoardNmae:@"Main" withIdentifierNmae:@"JWFocusDetailViewController"];
    [self.navigationController pushViewController:focusDetailVC animated:YES];
}

- (void)moonVCClick:(id)sender{
    JWLog(@"%s,%@",__func__,self);
}

- (void)settingVCClick:(id)sender{
    JWLog(@"%s,%@",__func__,self);
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
