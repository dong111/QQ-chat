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
    CGFloat margin = 10;
    //获取手机屏幕Size
    UIScreen *screen = [UIScreen mainScreen];
    CGSize screSize = screen.bounds.size;
    CGFloat timeX = margin;
    CGFloat timeY = margin;
    CGFloat timeW = screSize.width;
    CGFloat timeH = 40;
    if (!self.message.isHiddenTime) {
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    
    //图像设置
    CGFloat iconX = margin;
    CGFloat iconY = CGRectGetMaxY(_timeFrame)+margin;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    if (self.message.type ==CDMessageTypeSelf) {//如果是自己聊天记录
        iconX = screSize.width - margin-iconW;
    }
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
   
    

    //聊天内容frame设置
    CGFloat textX = CGRectGetMaxX(_iconFrame)+margin;
    CGFloat textY = iconY+margin;
    CGSize textSize = [CDFrameCalculateUtils sizeWithText:self.message.text maxSize:CGSizeMake(250, MAXFLOAT) fontSize:CDTEXTFONT];;
    CGSize buttonSize = CGSizeMake(textSize.width+20*2, textSize.height*2);
    if (self.message.type ==CDMessageTypeSelf) {//如果是自己聊天记录
        textX =iconX-margin-buttonSize.width;
    }
    _textFrame = CGRectMake(textX, textY, buttonSize.width, buttonSize.height);

    
    //设置行高
    _rowHeight = CGRectGetMaxY(_textFrame)>CGRectGetMaxY(_iconFrame)?CGRectGetMaxY(_textFrame):CGRectGetMaxY(_iconFrame);
     _rowHeight +=margin;
}





@end
