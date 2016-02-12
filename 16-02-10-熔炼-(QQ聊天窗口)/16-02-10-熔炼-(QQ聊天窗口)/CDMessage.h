//
//  CDMessage.h
//  16-02-10-熔炼-(QQ聊天窗口)
//
//  Created by 陈栋 on 16/2/10.
//  Copyright © 2016年 man. All rights reserved.
//

#import <Foundation/Foundation.h>


//枚举：一组和数字相关的常量
//定义枚举:第一种方式
//enum CDMessageType
//{
//    CDMessageTypeSelf = 0,
//    CDMessageTypeOther = 1
//};
//typedef enum CDMessageType CDMessageType;

//定义枚举:第二种方式
typedef enum {
    CDMessageTypeSelf,
    CDMessageTypeOther
} CDMessageType;

@interface CDMessage : NSObject

@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,assign) CDMessageType type;
/**
 *  记录消息时间是否隐藏
 */
@property (nonatomic,assign,getter=isHiddenTime) BOOL hiddenTime;
- (instancetype) initWithDic:(NSDictionary *)dic;

+ (instancetype) messageWithDic:(NSDictionary *)dic;


+ (NSArray *) messagesList;

@end
