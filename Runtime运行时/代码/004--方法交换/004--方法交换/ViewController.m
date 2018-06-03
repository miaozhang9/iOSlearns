//
//  ViewController.m
//  004--方法交换
//
//  Created by H on 17/2/7.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //现在我需要给URL做检测!!
    NSURL * url = [NSURL URLWithString:@"www.baidu.com/中文"];
    //
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    //发送了
    NSLog(@"%@",request);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
