//
//  JWDetailTableView.m
//  JW百思
//
//  Created by scjy on 16/3/23.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWDetailTableView.h"

@implementation JWDetailTableView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"JWDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"detailTableViewCell"];
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JWDetailTableViewCell * detailCell = [tableView dequeueReusableCellWithIdentifier:@"detailTableViewCell" forIndexPath:indexPath];
    detailCell.textLabel.text = @"123";
    
    return detailCell;
}

#pragma mark - UITableViewDelegate

@end
