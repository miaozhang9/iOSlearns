//
//  HKPseron.m
//  003--runtime消息机制
//
//  Created by H on 17/2/7.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "HKPseron.h"

@implementation HKPseron
-(void)eatWithFood:(NSString *)food
{
    NSLog(@"哥么吃到了%@",food);
}
-(void)run
{
    NSLog(@"哥么对象方法跑起来了");
}
+(void)run
{
    NSLog(@"哥么类方法跑起来了");
}
@end
