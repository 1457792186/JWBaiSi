//
//  JWTabBarViewController.m
//  JW百思
//
//  Created by scjy on 16/3/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWTabBarViewController.h"
#import "JWHomeViewController.h"
#import "JWNewPostViewController.h"
#import "JWFocusViewController.h"
#import "JWMineViewController.h"
#import "JWNavigationViewController.h"
#import "JWTabBar.h"
#import "JWClass.h"

@interface JWTabBarViewController ()

@end

@implementation JWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBarItem = [UITabBarItem tabBarItemWithAttributes:[NSDictionary dicOfTextAttributeWithFont:[UIFont systemFontOfSize:13.f] withTextColor:[UIColor blackColor]] withState:UIControlStateNormal];
    
    [self addchildViewControllerWithVC:[[JWHomeViewController alloc] initWith:HOME] withTittle:@"精华" withImageName:@"tabBar_essence_icon" withSelectesImageName:@"tabBar_essence_click_icon"];
    
    [self addchildViewControllerWithVC:[[JWNewPostViewController alloc] initWith:HOME] withTittle:@"新帖" withImageName:@"tabBar_new_icon" withSelectesImageName:@"tabBar_new_click_icon"];
    
    [self addchildViewControllerWithVC:[[JWFocusViewController alloc] initWith:FOCUS] withTittle:@"关注" withImageName:@"tabBar_friendTrends_icon" withSelectesImageName:@"tabBar_friendTrends_click_icon"];
    
    [self addchildViewControllerWithVC:[[JWMineViewController alloc] initWith:(MINESETTING | MINESTYLE)] withTittle:@"我的" withImageName:@"tabBar_me_icon" withSelectesImageName:@"tabBar_me_click_icon"];
    
//    绑定JWTabBar給自身的tabBar
    [self setValue:[[JWTabBar alloc] init] forKey:@"tabBar"];
    
}


- (void)addchildViewControllerWithVC:(UIViewController *)vc withTittle:(NSString *)tittleStr withImageName:(NSString *)imageName withSelectesImageName:(NSString *)selectedImageName{
    
    vc.tabBarItem.title = tittleStr;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    JWNavigationViewController * navigationVC = [[JWNavigationViewController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:navigationVC];
    
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
