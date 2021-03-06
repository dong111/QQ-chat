//
//  CDMessageFrame.h
//  16-02-10-熔炼-(QQ聊天窗口)
//
//  Created by 陈栋 on 16/2/10.
//  该类用来计算行高
//  Copyright © 2016年 man. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import "CDFrameCalculateUtils.h"
#import "CDMessage.h"
#import "NSString+Extension.h"


#define CDTEXTFONT 14

@interface CDMessageFrame : NSObject

@property (nonatomic,strong) CDMessage *message;

//mesage控件frame计算  属性
//需要计算子控件的frame
@property (nonatomic,assign,readonly) CGRect timeFrame;
@property (nonatomic,assign,readonly) CGRect iconFrame;
@property (nonatomic,assign,readonly) CGRect textFrame;

//cell行高属性
@property (nonatomic,assign,readonly) CGFloat rowHeight;

@end
