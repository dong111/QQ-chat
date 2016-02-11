//
//  CDMessageFrame.m
//  16-02-10-熔炼-(QQ聊天窗口)
//
//  Created by 陈栋 on 16/2/10.
//  Copyright © 2016年 man. All rights reserved.
//

#import "CDMessageFrame.h"

@implementation CDMessageFrame

- (void)setMessage:(CDMessage *)message
{
    _message = message;
    [self framesCaculate];
}

- (void) framesCaculate
{
    CGFloat iconX = 10;
    CGFloat iconY = 10;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    _rowHeight = 200;
}


@end
