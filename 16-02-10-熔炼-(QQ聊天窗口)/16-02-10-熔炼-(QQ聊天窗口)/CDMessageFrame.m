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
    //获取手机屏幕Size
    UIScreen *screen = [UIScreen mainScreen];
    CGSize screSize = screen.bounds.size;
    NSLog(@"%@",NSStringFromCGSize(screSize));
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeW = screSize.width;
    CGFloat timeH = 40;
    _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    
    //TODO 计算frame
    CGFloat iconX = 10;
    CGFloat iconY = CGRectGetMaxY(_timeFrame)+10;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    _rowHeight = 200;
    
    
}





@end
