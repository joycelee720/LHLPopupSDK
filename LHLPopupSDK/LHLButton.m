//
//  LHLButton.m
//  TestDemo
//
//  Created by lee on 2018/3/23.
//  Copyright © 2018年 lee. All rights reserved.
//

#import "LHLButton.h"

@implementation LHLButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void)touchAction:(UIButton *)sender{
    if (self.buttonClick) {
        self.buttonClick(self.tag);
    }
}

@end
