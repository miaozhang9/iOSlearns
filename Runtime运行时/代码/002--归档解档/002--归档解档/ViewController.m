//
//  ViewController.m
//  002--归档解档
//
//  Created by H on 17/1/3.
//  Copyright © 2017年 H. All rights reserved.
//  模型!!!  

#import "ViewController.h"
#import "HKTeacher.h"
#import <objc/message.h>


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //Ivar : runtime里面 Ivar 代表成员变量
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([HKTeacher class], &count);
    Ivar ivar = ivars[0];
    const char * name = ivar_getName(ivar);
    NSLog(@"%s",name);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)save:(id)sender {
    //创建一个对象
    HKTeacher * t = [[HKTeacher alloc]init];
    t.name = @"hank";
    t.age = 18;
    //沙盒
    NSString * temp = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"t.hank"];
    //归档
    [NSKeyedArchiver archiveRootObject:t toFile:filePath];
}


- (IBAction)read:(id)sender {
    //路径
    NSString * temp = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"t.hank"];
    //解档
    HKTeacher * t =  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    
    NSLog(@"我们的老师是%@,哥么%d岁了",t.name,t.age);
}

@end
