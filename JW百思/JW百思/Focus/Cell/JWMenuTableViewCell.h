//
//  JWMenuTableViewCell.h
//  JW百思
//
//  Created by scjy on 16/3/23.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWMenuTableCellContentView.h"

@interface JWMenuTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet JWMenuTableCellContentView *showView;


@property (weak, nonatomic) IBOutlet UILabel *tittleLabel;

@end
