//
//  ViewController.m
//  002--归档解档
//
//  Created by H on 17/1/3.
//  Copyright © 2017年 H. All rights reserved.
//  模型!!!  

#import "ViewController.h"
#import "HKTeacher.h"
#import <objc/runtime.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
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
    t.age5 = 19;
    t.age2 = 18;
    //沙盒
    NSString * temp = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"t.hank"];
    NSString * filePath1 = [temp stringByAppendingPathComponent:@"t1.hank"];
    //归档
    [NSKeyedArchiver archiveRootObject:t toFile:filePath];
    [NSKeyedArchiver archiveRootObject:t toFile:filePath1];
}


- (IBAction)read:(id)sender {
    //路径
    NSString * temp = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"t.hank"];
    //解档
    HKTeacher * t =  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"我们的老师是%@,哥么成立%d%d%d年啦!!!",t.name,t.age,t.age2,t.age5);
}

@end
