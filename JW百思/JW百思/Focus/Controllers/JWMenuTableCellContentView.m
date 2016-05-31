//
//  JWMenuTableCellContentView.m
//  JW百思
//
//  Created by scjy on 16/3/23.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWMenuTableCellContentView.h"

@implementation JWMenuTableCellContentView

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (_isSelected) {
        [self setNeedsDisplay];
    }
}


- (void)drawRect:(CGRect)rect {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(contextRef, 0.f, self.height - 1);
    CGContextAddLineToPoint(contextRef, self.width, self.height - 1);
    [[UIColor yellowColor] set];
    CGContextSetLineWidth(contextRef, 2.f);
    CGContextStrokePath(contextRef);
    
    if (self.isSelected) {
        
        CGContextRef contextRef = UIGraphicsGetCurrentContext();
        CGContextMoveToPoint(contextRef, 0.f, 2.f);
        CGContextAddLineToPoint(contextRef, 0.f, self.height - 2.f);
        [[UIColor redColor] set];
        CGContextSetLineWidth(contextRef, 20.f);
        CGContextStrokePath(contextRef);
    }
    
}


@end
