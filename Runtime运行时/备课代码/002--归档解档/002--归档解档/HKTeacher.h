//
//  HKTeacher.h
//  002--归档解档
//
//  Created by H on 17/1/3.
//  Copyright © 2017年 H. All rights reserved.
//  40个属性

#import <Foundation/Foundation.h>

@interface HKTeacher : NSObject<NSCoding>
/** 名字 */
@property(copy,nonatomic)NSString * name;
/** 年龄 */
@property(assign,nonatomic)int age;
@property(assign,nonatomic)int age1;
@property(assign,nonatomic)int age2;
@property(assign,nonatomic)int age3;
@property(assign,nonatomic)int age4;
@property(assign,nonatomic)int age5;
@end
