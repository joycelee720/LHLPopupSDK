//
//  LHLPopupHeaderView.m
//  TestDemo
//
//  Created by lee on 2018/3/23.
//  Copyright © 2018年 lee. All rights reserved.
//

#import "LHLPopupHeaderView.h"
#import "LHLButton.h"

@implementation LHLPopupHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    
    return self;
}

- (void)initView{
    _backBtn = [LHLButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(15, 0, self.bounds.size.height, self.bounds.size.height);
    _backBtn.tag = 1;
    __weak typeof(self) weakSelf = self;
    weakSelf.backBtn.buttonClick = ^(NSInteger tag) {
        if (self.headerAction) {
            self.headerAction(tag);
        }
    };
    [self addSubview:_backBtn];
    
    _sureBtn = [LHLButton buttonWithType:UIButtonTypeCustom];
    _sureBtn.frame = CGRectMake(self.bounds.size.width - 15 - self.bounds.size.height, 0, self.bounds.size.height, self.bounds.size.height);
    _sureBtn.tag = 2;
    __weak typeof(self) weakSureSelf = self;
    weakSureSelf.sureBtn.buttonClick = ^(NSInteger tag) {
        if (self.headerAction) {
            self.headerAction(tag);
        }
    };
    [self addSubview:_sureBtn];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_backBtn.frame), 0, CGRectGetMinX(_sureBtn.frame) - CGRectGetMaxX(_backBtn.frame), self.bounds.size.height)];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
}


@end
