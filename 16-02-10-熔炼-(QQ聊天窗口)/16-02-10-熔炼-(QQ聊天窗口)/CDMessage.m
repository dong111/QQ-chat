//
//  CDMessage.m
//  16-02-10-熔炼-(QQ聊天窗口)
//
//  Created by 陈栋 on 16/2/10.
//  Copyright © 2016年 man. All rights reserved.
//

#import "CDMessage.h"

@implementation CDMessage

- (instancetype) initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) messageWithDic:(NSDictionary *)dic{
    return [[CDMessage alloc] initWithDic:dic];
}


+ (NSArray *) messagesList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
    
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tmpArray  = [NSMutableArray array];
    
    CDMessage *preMsg = nil;
    for (NSDictionary *dic in dicArray) {
        CDMessage *message = [[CDMessage alloc] initWithDic:dic];
        if (preMsg!=nil) {
            if ([preMsg.time isEqualToString:message.time]) {
                message.hiddenTime = YES;
            }
        }
        [tmpArray addObject:message];
        
        preMsg = message;
    }
    
    return tmpArray;
}


@end
