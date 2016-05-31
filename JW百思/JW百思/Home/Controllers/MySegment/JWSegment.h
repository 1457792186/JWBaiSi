//
//  JWSegment.h
//  JW百思
//
//  Created by scjy on 16/3/24.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const CGFloat segmentEndge;

typedef enum segementDirection{
    JWSegmentDirectionLeft,
    JWSegmentDirectionRight
}JWSegmentDirection;


typedef void(^JWSelectItemBlock)(JWSegmentDirection direction);

@interface JWSegment : UIView

@property (nonatomic,strong)NSArray * segmentItems;
@property (nonatomic,strong)UIColor * segementBackGroundColor;

@property (nonatomic,assign)CGFloat itemWidth;
@property (nonatomic,strong)UIColor * itemTextColor;
@property (nonatomic,strong)UIColor * itemSelectedTextColor;
@property (nonatomic,strong)UIFont * itemTextFont;

@property (nonatomic,strong)CALayer * itemLayer;
@property (nonatomic,strong)UIColor * itemLayerColor;

@property (nonatomic,assign)NSInteger currentIndex;
@property (nonatomic,assign)NSInteger lastIndex;

@property (nonatomic,copy)JWSelectItemBlock selectDirection;

- (instancetype)initWithFrame:(CGRect)frame withItems:(NSArray *)items;

@end
