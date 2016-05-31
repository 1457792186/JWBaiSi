//
//  JWMineModel.h
//  JW百思
//
//  Created by scjy on 16/4/11.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWMineSquareList.h"
#import "JWMineTagList.h"
#import <MJExtension.h>

@interface JWMineModel : NSObject

@property (nonatomic,strong)NSMutableArray * tagList;
@property (nonatomic,strong)NSMutableArray * squareList;

@end
