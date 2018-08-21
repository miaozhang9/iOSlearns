//
//  ViewController.m
//  001--RunLoop初体验
//
//  Created by H on 17/2/5.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     NSDefaultRunLoopMode -- 时钟,网络事件
     NSRunLoopCommonModes -- 用户交互(UI事件处理)
     */
    NSTimer * timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updataTimer) userInfo:nil repeats:YES];
    // 加入到运行循环 -- RunLoop
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updataTimer) userInfo:nil repeats:YES];
}


//千万不要做耗时操作!! 否则 卡住UI!!!
-(void)updataTimer{
    static int num = 0;
    //如果出现了耗时操作
    NSLog(@"睡一会");
    [NSThread sleepForTimeInterval:1.0];
    
    
    NSLog(@"%@  %d",[NSThread currentThread],num++);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
