//
//  LHLPopupHeaderView.h
//  TestDemo
//
//  Created by lee on 2018/3/23.
//  Copyright © 2018年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LHLButton;

typedef void(^HeaderAction)(NSInteger tag);

@interface LHLPopupHeaderView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) LHLButton *backBtn;
@property (nonatomic, strong) LHLButton *sureBtn;

@property (nonatomic, copy) HeaderAction headerAction;

@end
