//
//  JWMineCollectionHeader.m
//  JW百思
//
//  Created by scjy on 16/4/10.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWMineCollectionHeader.h"

@implementation JWMineCollectionHeader

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"登陆/注册";
            break;
        case 1:
            cell.textLabel.text = @"离线下载";
            break;
            
        default:
            break;
    }
    
    return cell;
}

@end
