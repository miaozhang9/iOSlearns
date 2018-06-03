//
//  HKTeacher.m
//  002--归档解档
//
//  Created by H on 17/1/3.
//  Copyright © 2017年 H. All rights reserved.
//  存储自定义对象到沙盒中

#import "HKTeacher.h"
#import <objc/message.h>

@interface HKTeacher ()

@end

@implementation HKTeacher

//归档
- (void)encodeWithCoder:(NSCoder *)coder
{
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([HKTeacher class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * key = [NSString stringWithUTF8String:name];
        //归档
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
    
    free(ivars);
}


//解档
- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([HKTeacher class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString * key = [NSString stringWithUTF8String:name];
            //解档
            id value = [coder decodeObjectForKey:key];
            //设置到成员变量身上
            [self setValue:value forKey:key];
        }
        
        free(ivars);
    }
    return self;
}


@end
