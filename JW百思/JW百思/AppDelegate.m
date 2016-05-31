//
//  AppDelegate.m
//  JW百思
//
//  Created by scjy on 16/3/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "AppDelegate.h"
#import "JWTabBarViewController.h"
#import "UIWindow+SettingWithVC.h"
#import "JWGuideView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    JWTabBarViewController * tabBarViewController = [[JWTabBarViewController alloc]init];

    self.window = [UIWindow windowInitWithRootViewController:tabBarViewController];
    
    
    NSString * key = @"CFBundleShortVersionString";
    
    NSString * versionStr = [[NSBundle mainBundle] objectForInfoDictionaryKey:key];
    
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    NSString * version = [userDefault objectForKey:key];
    
    if (![versionStr isEqualToString:version]) {
        JWGuideView * guideView = [[[NSBundle mainBundle] loadNibNamed:@"JWGuideView" owner:nil options:nil]lastObject];
        guideView.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.3f];
        [self.window.rootViewController.view addSubview:guideView];
        
        [userDefault setObject:versionStr forKey:key];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
