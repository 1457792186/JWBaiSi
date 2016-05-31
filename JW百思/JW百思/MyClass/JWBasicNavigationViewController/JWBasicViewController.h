//
//  JWBasicViewController.h
//  JW百思
//
//  Created by scjy on 16/3/19.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 00001 : 1                                      1
 00010 : 1<<1(1即00001向高位移1位，即00010)        2
 00100 : 1<<2(1即00001向高位移2位，即00100)        4
 01000 : 1<<3                                   8
 
 
 00001|00010 : 00011(|：或：有1即为1)
 00001^00011 : 00010(^：亦或：相同为0（假），不同为1（真）)
 
 
 */

typedef enum itemType{
    DEFAULT = 0,
    NONE = 1,
    HOME = NONE << 1,
    FOCUS = NONE << 2,
    MINESTYLE = NONE << 3,
    MINESETTING = NONE << 4
}ViewControllerNavigationItemType;

@interface JWBasicViewController : UIViewController

@property (nonatomic,assign)ViewControllerNavigationItemType itemType;

- (instancetype)initWith:(ViewControllerNavigationItemType)itemType;

- (BOOL)backBarButtonItemCustom;

- (void)backBarButtonAction;


@end
