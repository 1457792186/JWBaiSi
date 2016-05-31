//
//  JWMineDetilViewController.h
//  JW百思
//
//  Created by scjy on 16/4/11.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWBasicViewController.h"

@interface JWMineDetilViewController : JWBasicViewController
@property (weak, nonatomic) IBOutlet UIWebView *webLoadView;
@property (weak, nonatomic) IBOutlet UIButton *goFormartButton;

@property (nonatomic,copy)NSString * loadURL;
@property (nonatomic,copy)NSString * name;

@end
