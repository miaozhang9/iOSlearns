//
//  HKTeacher.m
//  002--归档解档
//
//  Created by H on 17/1/3.
//  Copyright © 2017年 H. All rights reserved.
//  存储自定义对象到沙盒中

#import "HKTeacher.h"
#import <objc/runtime.h>

@implementation HKTeacher

//归档
- (void)encodeWithCoder:(NSCoder *)coder
{
    //属性的个数
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([HKTeacher class], &count);
    for (int i = 0; i < count; i++) {
       //取出对应的Ivar
        Ivar ivar = ivars[i];
        //拿到名称
        const char * name = ivar_getName(ivar);
        //OC 字符串
        NSString * key = [NSString stringWithUTF8String:name];
        //归档
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
}


//解档
- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super init]) {
        //属性的个数
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([HKTeacher class], &count);
        for (int i = 0; i < count; i++) {
            //取出对应的Ivar
            Ivar ivar = ivars[i];
            //拿到名称
            const char * name = ivar_getName(ivar);
            //OC 字符串
            NSString * key = [NSString stringWithUTF8String:name];
            //解档
            id value = [coder decodeObjectForKey:key];
            //KVC--设置值到属性上面!!!
            [self setValue:value forKey:key];
        }
    }
    return self;
}


@end
