//
//  JWFocusDetailViewController.m
//  JW百思
//
//  Created by scjy on 16/3/23.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWFocusDetailViewController.h"

@interface JWFocusDetailViewController ()

@end

@implementation JWFocusDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self backBarButtonItemCustom];
    
    [self.menuTableView registerNib:[UINib nibWithNibName:@"JWMenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"menuTableViewCell"];
    self.menuArray = @[@"网红",@"精品",@"搞笑",@"创意",@"视频",@"趣图",@"生活",@"原创"];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.menuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JWMenuTableViewCell * menuCell = [tableView dequeueReusableCellWithIdentifier:@"menuTableViewCell" forIndexPath:indexPath];
    menuCell.tittleLabel.text = self.menuArray[indexPath.row];
    
    return menuCell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.detailTableView reloadData];
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
