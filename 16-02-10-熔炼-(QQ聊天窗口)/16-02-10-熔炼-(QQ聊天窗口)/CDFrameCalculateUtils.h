//
//  CDFrameCalculateUtils.h
//  16-02-10-熔炼-(QQ聊天窗口)
//  计算text控件大小工具类
//  Created by 陈栋 on 16/2/11.
//  Copyright © 2016年 man. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CDFrameCalculateUtils : NSObject

//计算文本大小
+ (CGSize) sizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat) fontSize;

@end
