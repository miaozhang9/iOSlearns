//
//  ViewController.m
//  006--方法懒加载
//
//  Created by H on 17/2/9.
//  Copyright © 2017年 TZ. All rights reserved.
//  KVC 给我一个名称! 我修改一个值!!
//  cmd + /

#import "ViewController.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    //属性个数!!
    unsigned int count = 0;
    
    Ivar * ivars = class_copyIvarList(NSClassFromString(@"UIButton"), &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * OCName = [NSString stringWithUTF8String:name];
        NSLog(@"%@",OCName);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
