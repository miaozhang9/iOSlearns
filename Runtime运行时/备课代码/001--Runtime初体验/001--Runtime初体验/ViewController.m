//
//  ViewController.m
//  001--Runtime初体验
//
//  Created by H on 17/1/3.
//  Copyright © 2017年 H. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import <objc/runtime.h>
//如何让一个函数有多个返回值!!!!

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //count 就是我们对应的属性的个数!!!
    unsigned int count = 0;
    Ivar * ivars =  class_copyIvarList(NSClassFromString(@"Teacher"), &count);
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
