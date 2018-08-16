//
//  ViewController.m
//  003--消息发送机制
//
//  Created by H on 17/2/9.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "ViewController.h"
#import "HKPerson.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HKPerson * p = [[HKPerson alloc]init];
    //掉用
//    [p performSelector:@selector(run)];
    //消息机制
    //xcode5.0之后,苹果不建议大家用底层的方法.建议使用运行时!
//    objc_msgSend(p,@selector(run));
    //可扩展参数!!  让你给方法传递参数的!!
    objc_msgSend(p, @selector(runWithStr:),@"hah");
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
