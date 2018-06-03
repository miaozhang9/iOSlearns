//
//  ViewController.m
//  003--KVO 底层实现原理
//
//  Created by H on 17/1/3.
//  Copyright © 2017年 H. All rights reserved.
//

/*
 
 
 
 */

#import "ViewController.h"
#import "HKPerson.h"
#import "HKDog.h"

@interface ViewController ()
/**   */
@property(nonatomic,strong)HKPerson * p;
/**   */
@property(nonatomic,strong)HKDog * d;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.p = [[HKPerson alloc]init];
    self.d = [[HKDog alloc]init];
    
    //注册监听  KVO
    [self.d addObserver:self.p forKeyPath:@"age" options:0 context:nil];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.d.age = 99;
    
    NSLog(@"%@",self.d);
}


@end
