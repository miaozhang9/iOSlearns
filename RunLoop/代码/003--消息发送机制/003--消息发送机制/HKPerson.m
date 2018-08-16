//
//  HKPerson.m
//  003--消息发送机制
//
//  Created by H on 17/2/9.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "HKPerson.h"

@implementation HKPerson
-(void)run
{
    NSLog(@"对象方法跑起来了 !");
}

-(void)runWithStr:(NSString *)str
{
    NSLog(@"哥么有参数的方法跑起来了!!%@",str);
}
@end
