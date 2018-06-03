//
//  HKPerson.m
//  003--KVO 底层实现原理
//
//  Created by H on 17/1/3.
//  Copyright © 2017年 H. All rights reserved.
//

#import "HKPerson.h"

@implementation HKPerson


//监听到了object的keyPath属性变化为了change
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"监听到了%@的%@属性变化为了%@",object,keyPath,change);
}

@end
