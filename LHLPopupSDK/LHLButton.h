//
//  LHLButton.h
//  TestDemo
//
//  Created by lee on 2018/3/23.
//  Copyright © 2018年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClick)(NSInteger tag);

@interface LHLButton : UIButton

@property (nonatomic, copy) ButtonClick buttonClick;

@end
