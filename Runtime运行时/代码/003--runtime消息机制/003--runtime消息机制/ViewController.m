//
//  ViewController.m
//  003--runtime消息机制
//
//  Created by H on 17/2/7.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "ViewController.h"
#import "HKPseron.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HKPseron * p = [HKPseron new];
    Class personClass = [HKPseron class];
    
    [personClass performSelector:@selector(run)];
    
    //Xcode5 之后,苹果不建议使用底层方法
    
    
//    objc_msgSend(p, @selector(run));
//    objc_msgSend(personClass, @selector(run));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
