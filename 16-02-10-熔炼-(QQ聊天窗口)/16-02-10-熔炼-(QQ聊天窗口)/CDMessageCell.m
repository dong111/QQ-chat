//
//  CDMessageCell.m
//  16-02-10-熔炼-(QQ聊天窗口)
//
//  Created by 陈栋 on 16/2/10.
//  Copyright © 2016年 man. All rights reserved.
//

#import "CDMessageCell.h"

@implementation CDMessageCell

 //返回可重用的自定义cell
+ (instancetype) messageCellWithTabelView:(UITableView *)tableView
{
   
    NSString *quenId = @"message";
    CDMessageCell *cell =  [tableView dequeueReusableCellWithIdentifier:quenId];
    if (cell==nil) {
        cell = [[CDMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:quenId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //TODO:加载自定义子控件
        //时间显示
        UILabel *timeView = [[UILabel alloc] init];
        [self.contentView addSubview:timeView];
        _timeView = timeView;
        timeView.textAlignment = NSTextAlignmentCenter;
        //图像显示
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        _iconView = iconView;
        //聊天内容显示
        UIButton *textView =  [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:textView];
        _textView = textView;
        
    }
    return self;
}




//TODO:重写frame setter  设置子控件frame
- (void)setMessageFrame:(CDMessageFrame *)messageFrame
{
    _messageFrame = messageFrame;
    [self setContentViews];//设置子控件内容
    [self setContentViewFrams];//设置子控件frame

    
}

- (void)setContentViews
{
    CDMessage *message = self.messageFrame.message;
    
//    if (message.type == CDMessageTypeSelf) {
//        self.iconView.image = [UIImage imageNamed:@"me"];
//    }else{
//        self.iconView.image = [UIImage imageNamed:@"other"];
//    }
    //时间
    self.timeView.text = message.time;
    //图像
    NSString *imageName = message.type == CDMessageTypeSelf?@"me":@"other";
    self.iconView.image = [UIImage imageNamed:imageName];
    //聊天内容
    [self.textView setTitle:message.text forState:UIControlStateNormal];
}

- (void)setContentViewFrams
{
    _timeView.frame = self.messageFrame.timeFrame;
    _iconView.frame = self.messageFrame.iconFrame;
    _textView.frame = self.messageFrame.textFrame;
}






















@end
