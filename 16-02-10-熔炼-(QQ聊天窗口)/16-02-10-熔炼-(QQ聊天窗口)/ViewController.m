//
//  ViewController.m
//  16-02-10-熔炼-(QQ聊天窗口)
//
//  Created by 陈栋 on 16/2/10.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"
#import "CDMessage.h"
#import "CDMessageFrame.h"
#import "CDMessageCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *messageFrames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end


@implementation ViewController

//懒加载
- (NSArray *)messageFrames
{
    if (_messageFrames==nil) {
        NSMutableArray *frames = [[NSMutableArray alloc] init];
        NSArray *messages = [CDMessage messagesList];
        for (CDMessage *message in messages) {
            CDMessageFrame *frame = [[CDMessageFrame alloc] init];
            frame.message = message;
            [frames addObject:frame];
        }
        _messageFrames = frames;
    }
    return _messageFrames;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //测试数据
//    NSLog(@"%ld",self.messages.count);
    //设置tableView数据源和TableView代理
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}


#pragma mark --实现UItable datasource 的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%ld",self.messageFrames.count);
    return self.messageFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建自定义cell对象
    CDMessageCell *cell = [CDMessageCell messageCellWithTabelView:tableView];
    //自定义cell数据赋值
    cell.messageFrame = self.messageFrames[indexPath.row];
    return cell;
}



#pragma mark --事项代理的方法
//d设置行高
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CDMessageFrame *frame = self.messageFrames[indexPath.row];
    return frame.rowHeight;
}








@end
