//
//  JWSegment.m
//  JW百思
//
//  Created by scjy on 16/3/24.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWSegment.h"

const CGFloat segmentEndge = 5.f;

@implementation JWSegment

- (instancetype)initWithFrame:(CGRect)frame withItems:(NSArray *)items
{
    self = [super initWithFrame:frame];
    if (self) {
        self.segementBackGroundColor = [UIColor whiteColor];
        self.segmentItems = items;
        self.itemWidth = self.width/items.count;
        self.itemTextColor = [UIColor blackColor];
        self.itemSelectedTextColor = [UIColor redColor];
        self.itemTextFont = [UIFont systemFontOfSize:14.f];
        self.itemLayerColor = [UIColor yellowColor];
        self.currentIndex = 0;
    }
    return self;
}

- (CALayer *)itemLayer{
    if (!_itemLayer) {
        _itemLayer = [CALayer layer];
        _itemLayer.backgroundColor = self.itemLayerColor.CGColor;
        [self.layer addSublayer:_itemLayer];
    }
    return _itemLayer;
}

- (void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    
    self.itemLayer.frame = CGRectMake(currentIndex * _itemWidth, self.height - segmentEndge, _itemWidth, segmentEndge / 2);
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    self.currentIndex = point.x / self.itemWidth;
    if (self.currentIndex < self.lastIndex) {
        self.selectDirection(JWSegmentDirectionLeft);
    }else if (self.currentIndex > self.lastIndex) {
        self.selectDirection(JWSegmentDirectionRight);
    }
    self.lastIndex = self.currentIndex;

}


- (void)drawRect:(CGRect)rect {
    [self.segementBackGroundColor set];
    
    UIRectFill(rect);
    
    NSMutableParagraphStyle * textStyle = [[NSMutableParagraphStyle alloc]init];
    textStyle.alignment = NSTextAlignmentCenter;
    
    __weak typeof(self)mySelf = self;
    [self.segmentItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect rect = CGRectMake(mySelf.itemWidth * idx, segmentEndge, mySelf.itemWidth, mySelf.height - segmentEndge * 2);
        
        NSDictionary * attributes = @{NSFontAttributeName:self.itemTextFont,NSForegroundColorAttributeName:idx == mySelf.currentIndex ?self.itemSelectedTextColor:self.itemTextColor,NSParagraphStyleAttributeName:textStyle};
        [obj drawInRect:rect withAttributes:attributes];
    }];
    
    
}


@end
