//
//  Pseron.m
//  006--方法懒加载
//
//  Created by H on 17/2/9.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "Pseron.h"
#import <objc/message.h>

@interface Pseron ()
/** 身高 */
@property(assign,nonatomic)int height;
@property(assign,nonatomic)int height1;

@end

@implementation Pseron

void eat(){
    NSLog(@"哥么吃了");
}


//当这个类别调用了一个没有实现的方法!就会来到这里!!
+(BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@"%@",NSStringFromSelector(sel));
    
    //动态添加方法
    if (sel == @selector(eat)) {
        /**
         1.class 类类型
         2.name 方法编号
         3.imp  方法实现,就是一个函数指针
         4.type 返回值类型
         */
        
        //添加eat方法
        class_addMethod([Pseron class],sel ,(IMP)eat, "V");
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
