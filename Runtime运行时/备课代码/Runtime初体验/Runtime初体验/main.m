//
//  main.m
//  Runtime初体验
//
//  Created by H on 17/1/3.
//  Copyright © 2017年 H. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HKPerson.h"
#import <objc/message.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //OC
//        HKPerson * p = [HKPerson alloc];
        //C
//        HKPerson * p = objc_msgSend(objc_getClass("HKPerson"),sel_registerName("alloc"));
        
//        p = [p init];
        /*
          HKPerson * p = ((HKPerson *(*)(id, SEL))(void *)objc_msgSend)((id)((HKPerson *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("HKPerson"), sel_registerName("alloc")), sel_registerName("init"));
         */
        
    }
    return 0;
}
