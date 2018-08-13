//
//  ViewController.m
//  001--RunLoop初体验
//
//  Created by H on 17/2/9.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTimer * timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updataTimer) userInfo:nil repeats:YES];
    
    //加入到RunLoop
    /*
     NSDefaultRunLoopMode  -- 时钟,网络事件
     NSRunLoopCommonModes  -- 用户交互模式:UI处理!
     */
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updataTimer) userInfo:nil repeats:YES];
    
}

//千万不要做耗时操作!!
//如果哥么是更新UI的方法 ?
- (void)updataTimer {
    static int num = 0;
    [NSThread sleepForTimeInterval:1.0];
    NSLog(@"%@  %d",[NSThread currentThread],num++);
    
}


@end
