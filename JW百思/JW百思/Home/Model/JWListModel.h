//
//  JWListModel.h
//  JW百思
//
//  Created by scjy on 16/4/9.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWListModel : NSObject

@property(nonatomic, copy)NSString *bimageuri;

@property(nonatomic, copy)NSString *name;

@property(nonatomic, copy)NSString *profile_image;

@property(nonatomic, copy)NSString *create_time;

@property(nonatomic, copy)NSString *text;

@property(nonatomic, strong)NSNumber *ding;

@property(nonatomic, strong)NSNumber *hate;

@property(nonatomic, strong)NSNumber *repost;

@property(nonatomic, strong)NSNumber *comment;

@end
