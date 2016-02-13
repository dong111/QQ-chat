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

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

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
    //设置不需要分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置不能选中
    self.tableView.allowsSelection = NO;
    //设置背景颜色
    self.tableView.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    
    //订阅键盘变动通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}


#pragma mark --监听并且处理系统通知方法
- (void) keyboardWillChangeFrame:(NSNotification *)notif
{
    NSLog(@"键盘发生了改变");
    NSLog(@"%@",notif.userInfo);
    //键盘弹出
//    {
//        UIKeyboardAnimationCurveUserInfoKey = 7;
//        UIKeyboardAnimationDurationUserInfoKey = "0.25";
//        UIKeyboardBoundsUserInfoKey = "NSRect: {{0, 0}, {375, 258}}";
//        UIKeyboardCenterBeginUserInfoKey = "NSPoint: {187.5, 796}";
//        UIKeyboardCenterEndUserInfoKey = "NSPoint: {187.5, 538}";
//        UIKeyboardFrameBeginUserInfoKey = "NSRect: {{0, 667}, {375, 258}}";
//        UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 409}, {375, 258}}";
//        UIKeyboardIsLocalUserInfoKey = 1;
//    }
    
    CGFloat duration = [[notif.userInfo valueForKey:@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    CGRect keyboardFrame = [notif.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    
    CGFloat offsetY = keyboardFrame.origin.y - self.view.frame.size.height;
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, offsetY);
    }];
    
}


#pragma mark --实现UItable datasource 的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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



#pragma mark --tableview代理的方法
//设置行高
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CDMessageFrame *frame = self.messageFrames[indexPath.row];
    return frame.rowHeight;
}


#pragma mark --滚动代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //滚动table隐藏键盘
    [self.view endEditing:YES];
}







@end
