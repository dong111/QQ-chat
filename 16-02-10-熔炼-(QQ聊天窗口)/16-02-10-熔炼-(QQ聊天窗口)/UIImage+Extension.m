//
//  UIImage+Extension.m
//  16-02-10-熔炼-(QQ聊天窗口)
//
//  Created by 陈栋 on 16/2/12.
//  Copyright © 2016年 man. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)reSizeImageModeTile:(NSString *)imageName
{
    UIImage *orginImg = [UIImage imageNamed:imageName];
    return [orginImg stretchableImageWithLeftCapWidth:orginImg.size.width/2 topCapHeight:orginImg.size.height/2];
}

@end
