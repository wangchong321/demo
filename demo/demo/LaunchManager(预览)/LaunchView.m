
//
//  LaunchView.m
//  demo
//
//  Created by 王充 on 2018/4/13.
//  Copyright © 2018年 王充. All rights reserved.
//

#import "LaunchView.h"
@implementation LaunchView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self removeFromSuperview];
        });
        
        UILabel *titLabel = [UILabel new];
        titLabel.font = [UIFont systemFontOfSize:17];
        titLabel.text = @"当你成功的时候，你说的所有话都是真理。";
        titLabel.textAlignment = NSTextAlignmentCenter;
        titLabel.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.width, titLabel.font.lineHeight);
        [self addSubview:titLabel];
        
    }
    return self;
}

@end
