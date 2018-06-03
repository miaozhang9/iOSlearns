//
//  NSURL+url.m
//  004--方法交换
//
//  Created by H on 17/2/7.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "NSURL+url.h"
#import <objc/message.h>

//class_getInstanceMethod:获取对象方法
//class_getClassMethod:获取类方法

@implementation NSURL (url)


+(void)load
{
    Method URLWithStr = class_getClassMethod([NSURL class], @selector(URLWithString:));
    Method HKURLWithStr = class_getClassMethod([NSURL class], @selector(HK_URLWithString:));
    //交换
    method_exchangeImplementations(URLWithStr, HKURLWithStr);
}


+(instancetype)HK_URLWithString:(NSString *)URLStirng
{
    NSURL * url = [NSURL HK_URLWithString:URLStirng];//调用了系统的方法了
    if (url == nil) {
        NSLog(@"哥么这个url是空");
    }
    return url;
}
@end
