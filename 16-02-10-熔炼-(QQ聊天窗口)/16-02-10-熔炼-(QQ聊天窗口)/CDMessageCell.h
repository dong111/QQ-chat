//
//  CDMessageCell.h
//  16-02-10-熔炼-(QQ聊天窗口)
//
//  Created by 陈栋 on 16/2/10.
//  Copyright © 2016年 man. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDMessage.h"
#import "CDMessageFrame.h"

@interface CDMessageCell : UITableViewCell

//子控件
@property (nonatomic,weak,readonly) UILabel *timeView;//时间
@property (nonatomic,weak,readonly) UIImageView *iconView;//聊天图标
@property (nonatomic,weak,readonly) UIButton *textView;//聊天记录

@property (nonatomic,strong) CDMessageFrame *messageFrame;


+ (instancetype)messageCellWithTabelView:(UITableView *)tableView;

@end
