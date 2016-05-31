//
//  JWMineModel.m
//  JW百思
//
//  Created by scjy on 16/4/11.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWMineModel.h"

@implementation JWMineModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"tagList":[JWMineTagList class],@"squareList":[JWMineSquareList class]};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"tagList":@"tag_list",@"squareList":@"square_list"};
}

@end
