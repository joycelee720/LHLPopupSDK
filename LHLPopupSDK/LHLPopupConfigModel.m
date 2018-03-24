//
//  LHLPopupConfigModel.m
//  TestDemo
//
//  Created by lee on 2018/3/23.
//  Copyright © 2018年 lee. All rights reserved.
//

#import "LHLPopupConfigModel.h"

@implementation LHLPopupConfigModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.isSureBtnBelow = false;
        self.btnImage = nil;
        self.btnColor = [UIColor greenColor];
        self.btnTitleColor = _isSureBtnBelow?[UIColor whiteColor]:[UIColor greenColor];
        self.btnTitle = @"确认";
        
        self.title = nil;
        self.titleColor = [UIColor blackColor];
        self.backTitle = @"取消";
        self.backTitleColor = [UIColor grayColor];
        self.backImage = nil;
    }
    
    return self;
}

@end
