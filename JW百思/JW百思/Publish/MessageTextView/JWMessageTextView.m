//
//  JWMessageTextView.m
//  JW百思
//
//  Created by scjy on 16/4/4.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import "JWMessageTextView.h"
#import "UIView+JWFrame.h"

@implementation JWMessageTextView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.isPlacehoder = YES;
        self.backgroundColor = [UIColor yellowColor];
        self.placehoderColor = [UIColor redColor];
        self.font = [UIFont systemFontOfSize:20.f];
        self.returnKeyType = UIReturnKeySend;
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewTextDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textViewTextDidChange:(NSNotification *)notification{
    self.isPlacehoder = NO;
    if ([self.text isEqualToString:@""]) {
        self.isPlacehoder = YES;
    }
    [self setNeedsDisplay];
}

- (void)setPlacehoder:(NSString *)placehoder{
    _placehoder = placehoder;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (_isPlacehoder == NO) {
        return;
    }
    
    NSDictionary * attribute = @{NSFontAttributeName:self.font,NSForegroundColorAttributeName:self.placehoderColor};
    [self.placehoder drawInRect:CGRectMake(6.f, 8.f, self.width, self.height) withAttributes:attribute];
}



- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}


@end
