//
//  JWMessageTextView.h
//  JW百思
//
//  Created by scjy on 16/4/4.
//  Copyright © 2016年 蒋威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWMessageTextView : UITextView

@property (nonatomic,copy)NSString * placehoder;
@property (nonatomic,assign)BOOL isPlacehoder;
@property (nonatomic,strong)UIColor * placehoderColor;

@end
