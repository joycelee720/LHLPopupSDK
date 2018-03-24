//
//  LHLPopupSelectView.h
//  TestDemo
//
//  Created by lee on 2018/3/23.
//  Copyright © 2018年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LHLPopupConfigModel;

typedef void(^PopupDidSelect)(id mainView);

//选择内容在底部的
@interface LHLPopupSelectView : UIView

@property (nonatomic, copy) PopupDidSelect didSelect;

- (instancetype)initWithFrame:(CGRect)frame withConfigModel:(LHLPopupConfigModel *)configModel;

- (void)addMainView:(id)mainView;
- (void)showInView:(UIView *)view;

@end
