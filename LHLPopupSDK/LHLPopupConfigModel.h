//
//  LHLPopupConfigModel.h
//  TestDemo
//
//  Created by lee on 2018/3/23.
//  Copyright © 2018年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LHLPopupConfigModel : NSObject

@property (nonatomic, assign) BOOL isSureBtnBelow;
//isSureBtnBelow为yes时是底部按钮的样式，no时是右边按钮的样式
@property (nonatomic, strong) UIImage *btnImage;
@property (nonatomic, strong) UIColor *btnColor;
@property (nonatomic, strong) UIColor *btnTitleColor;
@property (nonatomic, copy) NSString *btnTitle;

//headView里面的title,返回按钮文字或图片
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, copy) NSString *backTitle;
@property (nonatomic, strong) UIColor *backTitleColor;
@property (nonatomic, strong) UIImage *backImage; //40*40的图片

@end
