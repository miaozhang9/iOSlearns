runtime
    是什么:这哥么是一套比较底层的C语言的API,包含了很多C语言的函数!
    平时所写的OC代码,在运行的过程中,其实转成了runtime的C语言代码!runtime算OC的幕后工作者
编译链接:$ clang -rewrite-objc main.m

有什么:
    runtime属于OC的底层实现,可以进行一些非常底层的操作(OC无法实现的)
    1.利用runtime在程序运行的过程中,动态的创建一个类!(KVO底层实现)!
    2.利用runtime在程序运行的过程中,动态的为某一个类添加修改 属性\方法!
    3.遍历出一个类的所有成员遍历和成员方法!

怎么用:
    相关的头文件
        <objc/message.h> <objc/runtime.h>
    两个常识:
        typedef struct objc_method *Method;  成员方法
        typedef struct objc_ivar *Ivar;      成员变量

应用场景
    归档!!




