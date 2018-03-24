//
//  LHLTransparentMask.m
//  TestDemo
//
//  Created by lee on 2018/3/23.
//  Copyright © 2018年 lee. All rights reserved.
//

#import "LHLTransparentMask.h"

@implementation LHLTransparentMask

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.2;
    }
    
    return self;
}

@end
