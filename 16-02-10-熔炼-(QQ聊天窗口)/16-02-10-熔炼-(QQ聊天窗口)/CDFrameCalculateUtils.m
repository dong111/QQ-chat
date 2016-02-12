//
//  CDFrameCalculateUtils.m
//  16-02-10-熔炼-(QQ聊天窗口)
//
//  Created by 陈栋 on 16/2/11.
//  Copyright © 2016年 man. All rights reserved.
//

#import "CDFrameCalculateUtils.h"

@implementation CDFrameCalculateUtils

+ (CGSize) sizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize
{
    CGSize textSize = [text boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:fontSize]} context:nil].size;
    
    return textSize;
}

@end
