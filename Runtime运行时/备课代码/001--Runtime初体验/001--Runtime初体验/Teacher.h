//
//  Teacher.h
//  001--Runtime初体验
//
//  Created by H on 17/1/3.
//  Copyright © 2017年 H. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject
/** 名字 */
@property(copy,nonatomic)NSString * name;
/** 年龄 */
@property(assign,nonatomic)int age;
@end
