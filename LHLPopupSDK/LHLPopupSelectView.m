//
//  LHLPopupSelectView.m
//  TestDemo
//
//  Created by lee on 2018/3/23.
//  Copyright © 2018年 lee. All rights reserved.
//

#import "LHLPopupSelectView.h"
#import "LHLTransparentMask.h"
#import "LHLPopupContentView.h"
#import "LHLPopupConfigModel.h"
#import "LHLButton.h"
#import "LHLPopupHeaderView.h"

#define PSVIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define PSVBottomSafeHeight (PSVIsiPhoneX?34:0)

@interface LHLPopupSelectView ()

@property (nonatomic, strong) LHLTransparentMask *maskView;
@property (nonatomic, strong) LHLPopupContentView *contentView;
@property (nonatomic, strong) LHLPopupConfigModel *configModel;
@property (nonatomic, strong) LHLButton *belowSureBtn;
@property (nonatomic, strong) LHLPopupHeaderView *headerView;
@property (nonatomic, strong) id mainView;
@property (nonatomic, assign) CGFloat totalHeight;

@end

@implementation LHLPopupSelectView

- (instancetype)initWithFrame:(CGRect)frame withConfigModel:(LHLPopupConfigModel *)configModel{
    self = [super initWithFrame:frame];
    if (self) {
        self.configModel = configModel;
        [self initView];
    }
    
    return self;
}

- (void)initView{
    _maskView = [[LHLTransparentMask alloc] initWithFrame:self.bounds];
    [self addSubview:_maskView];
    _contentView = [[LHLPopupContentView alloc] init];
    [self addSubview:_contentView];
    
    _headerView = [[LHLPopupHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 40)];
    _headerView.backgroundColor = [UIColor whiteColor];
    [_contentView addSubview:_headerView];
    if (_configModel.title) {
        _headerView.titleLabel.text = _configModel.title;
        _headerView.titleLabel.textColor = _configModel.titleColor;
    }
    if (_configModel.backImage) {
        [_headerView.backBtn setImage:_configModel.backImage forState:UIControlStateNormal];
    } else {
        [_headerView.backBtn setTitle:_configModel.backTitle forState:UIControlStateNormal];
        [_headerView.backBtn setTitleColor:_configModel.backTitleColor forState:UIControlStateNormal];
    }
    
    if (_configModel.isSureBtnBelow) {
        //底部有按钮的样式
        _headerView.sureBtn.hidden = true;
        [_contentView addSubview:self.belowSureBtn];
        __weak typeof(self) weakSelf = self;
        weakSelf.belowSureBtn.buttonClick = ^(NSInteger tag) {
            [self popupAction:tag];
        };
    } else {
        [_headerView.sureBtn setTitle:_configModel.btnTitle forState:UIControlStateNormal];
        [_headerView.sureBtn setTitleColor:_configModel.btnTitleColor forState:UIControlStateNormal];
    }
    
    __weak typeof(self) weakSelf = self;
    weakSelf.headerView.headerAction = ^(NSInteger tag) {
        [self popupAction:tag];
    };
}

- (void)addMainView:(id)mainView{
    self.mainView = mainView;
    [_contentView addSubview:_mainView];
    
    UIView *mView = (UIView *)_mainView;
    _totalHeight = 40+mView.frame.size.height+PSVBottomSafeHeight;
    if (_belowSureBtn) {
        _totalHeight += 49;
    }
    _contentView.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, _totalHeight);
    mView.frame = CGRectMake(0, 40, self.bounds.size.width, mView.frame.size.height);
    if (_belowSureBtn) {
        _belowSureBtn.frame = CGRectMake(0, _totalHeight-PSVBottomSafeHeight-49, self.bounds.size.width, 49);
    }
}

- (void)showInView:(UIView *)view{
    [view addSubview:self];
    //动画出现
    [UIView animateWithDuration:0.3 animations:^{
        _contentView.frame = CGRectMake(0, self.bounds.size.height-_totalHeight, self.bounds.size.width, _totalHeight);
    }];
}

- (void)hideView{
    [UIView animateWithDuration:0.3 animations:^{
        _contentView.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, _totalHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)popupAction:(NSInteger)tag{
    //2“确定”操作事件，1“取消”操作事件
    if (tag == 2) {
        if (self.didSelect) {
            self.didSelect(self.mainView);
        }
    }
    
    [self hideView];
}



- (LHLButton *)belowSureBtn{
    if (!_belowSureBtn) {
        _belowSureBtn = [LHLButton buttonWithType:UIButtonTypeCustom];
        _belowSureBtn.tag = 2;
        if (_configModel.btnImage) {
            [_belowSureBtn setBackgroundImage:_configModel.btnImage forState:UIControlStateNormal];
        } else {
            _belowSureBtn.backgroundColor = _configModel.btnColor;
        }
        [_belowSureBtn setTitle:_configModel.btnTitle forState:UIControlStateNormal];
    }
    
    return _belowSureBtn;
}

@end
