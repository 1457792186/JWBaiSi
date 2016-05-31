//
//  JWHomeCellModel.h
//  JW百思
//
//  Created by scjy on 16/4/9.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWListModel.h"
#import "JWInfoModel.h"
#import <MJExtension.h>


@interface JWHomeCellModel : NSObject

@property (nonatomic,strong)JWInfoModel * info;

@property (nonatomic,strong)NSMutableArray * list;

@end
