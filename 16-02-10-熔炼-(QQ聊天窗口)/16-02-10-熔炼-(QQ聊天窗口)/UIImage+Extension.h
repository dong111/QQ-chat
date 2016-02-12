//
//  UIImage+Extension.h
//  16-02-10-熔炼-(QQ聊天窗口)
//
//  Created by 陈栋 on 16/2/12.
//  Copyright © 2016年 man. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  延生图片大小采用平铺方式
 *
 *  @param imageName 图片名称
 *
 *  @return 重置大小后的图片
 */
+ (UIImage *) reSizeImageModeTile:(NSString *)imageName;
@end
