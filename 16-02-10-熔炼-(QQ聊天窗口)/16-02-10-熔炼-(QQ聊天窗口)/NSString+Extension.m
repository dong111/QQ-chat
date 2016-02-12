//
//  NSString+Extension.m
//  16-02-10-熔炼-(QQ聊天窗口)
//
//  Created by 陈栋 on 16/2/12.
//  Copyright © 2016年 man. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (CGSize)sizeWithMaxSize:(CGSize)maxSize andFontSize:(CGFloat)fontSize
{
    CGSize textSize = [self boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:fontSize]} context:nil].size;
    
    return textSize;
}
@end
