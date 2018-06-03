//
//  ViewController.m
//  加载高清大图
//
//  Created by H on 17/1/12.
//  Copyright © 2017年 H. All rights reserved.

//  加载大图耗时!! 为什么会taobleview滚动卡顿呢?
//  因为 一次RunLoop循环需要加载所有的屏幕上的点
//  因为图片很大..所以这次RunLoop循环有点久...
//  RunLoop 循环有点久 就造成卡顿!!

//  说白了 一次RunLoop 加载了 18张图片  所以有点久
//  每次RunLoop循环  加载1 张!!

//   思路:  弄一个数组!! 装代码!!!
//         返回cell的数据源方法!不加载图片!!(加载图片的代码丢到数组里面!)
//         监听RunLoop循环 -- 一次循环就从数组中拿代码执行!!

//函数指针!!

#import "ViewController.h"


//定义block
typedef BOOL(^RunloopBlock)(void);

static NSString * IDENTIFIER = @"IDENTIFIER";
static CGFloat CELL_HEIGHT = 135.f;

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *exampleTableView;
/** 时钟事件  */
@property(nonatomic,strong)NSTimer * timer;

/** 数组  */
@property(nonatomic,strong)NSMutableArray * tasks;
/** 最大任务s */
@property(assign,nonatomic)NSUInteger maxQueueLength;

@end

@implementation ViewController
//因为消息发送机制!!那么我们可以优化!! 直接用底层代码!哥么发消息!不用OC调用方法!!
//Runtime 里面讲!!
-(void)timerMethod{
    //任何事情都不做!!!
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    
             //注册Cell
    [self.exampleTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:IDENTIFIER];
    //添加RunLoop的监听
    [self addRunloopObserver];
    
    _maxQueueLength = 18;
    _tasks = [NSMutableArray array];
    
}

//MARK: 内部实现方法

//添加文字
+(void)addlabel:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 300, 25)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%zd - Drawing index is top priority", indexPath.row];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.tag = 4;
    [cell.contentView addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 99, 300, 35)];
    label1.lineBreakMode = NSLineBreakByWordWrapping;
    label1.numberOfLines = 0;
    label1.backgroundColor = [UIColor clearColor];
    label1.textColor = [UIColor colorWithRed:0 green:100.f/255.f blue:0 alpha:1];
    label1.text = [NSString stringWithFormat:@"%zd - Drawing large image is low priority. Should be distributed into different run loop passes.", indexPath.row];
    label1.font = [UIFont boldSystemFontOfSize:13];
    label1.tag = 5;
    [cell.contentView addSubview:label1];

}


//加载第一张
+(void)addImage1With:(UITableViewCell *)cell{
    //第一张
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 85, 85)];
    imageView.tag = 1;
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path1];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView];
    } completion:nil];
}



//加载第二张
+(void)addImage2With:(UITableViewCell *)cell{
    //第二张
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(105, 20, 85, 85)];
    imageView1.tag = 2;
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"png"];
    UIImage *image1 = [UIImage imageWithContentsOfFile:path1];
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.image = image1;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView1];
    } completion:nil];
}
//加载第三张
+(void)addImage3With:(UITableViewCell *)cell{
    //第三张
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 20, 85, 85)];
    imageView2.tag = 3;
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"png"];
    UIImage *image2 = [UIImage imageWithContentsOfFile:path1];
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.image = image2;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView2];
    } completion:nil];
}

//MARK:  UI初始化方法
//设置tableview大小
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.exampleTableView.frame = self.view.bounds;
}

//Cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

//加载tableview
- (void)loadView {
    self.view = [UIView new];
    self.exampleTableView = [UITableView new];
    self.exampleTableView.delegate = self;
    self.exampleTableView.dataSource = self;
    [self.view addSubview:self.exampleTableView];
}

#pragma mark - <tableview>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 399;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    //干掉contentView上面的子控件!! 节约内存!!
    for (NSInteger i = 1; i <= 5; i++) {
        //干掉contentView 上面的所有子控件!!
        [[cell.contentView viewWithTag:i] removeFromSuperview];
    }
    //添加文字
    [ViewController addlabel:cell indexPath:indexPath];
    //添加图片  -- 耗时操作!!!  丢给每一次RunLoop循环!!!
    [self addTask:^BOOL{
        [ViewController addImage1With:cell];
        return YES;
    }];
    [self addTask:^BOOL{
        [ViewController addImage2With:cell];
        return YES;
    }];
    [self addTask:^BOOL{
        [ViewController addImage3With:cell];
        return YES;
    }];
    
    
//    [ViewController addImage2With:cell];
//    [ViewController addImage3With:cell];
    
    return cell;
}

#pragma mark - <关于RunLoop的方法>
//添加新的任务的方法!
-(void)addTask:(RunloopBlock)unit {
    
    [self.tasks addObject:unit];
    
    //判断一下 保证没有来得及显示的cell不会绘制图片!!
    if (self.tasks.count > self.maxQueueLength) {
        [self.tasks removeObjectAtIndex:0];
    }
    
    
}


//回调函数
static void Callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    //从数组里面取代码!! info 哥么就是 self
    ViewController * vc = (__bridge ViewController *)info;
    if (vc.tasks.count == 0) {
        return;
    }
    BOOL result = NO;
    while (result == NO && vc.tasks.count) {
        //取出任务
        RunloopBlock unit = vc.tasks.firstObject;
        //执行任务
        result = unit();
        //干掉第一个任务
        [vc.tasks removeObjectAtIndex:0];
    }
    
}

//这里面都是c语言的代码
-(void)addRunloopObserver{
    //获取当前RunLoop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    //定义一个上下文
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL,
    };
    //定义一个观察者
    static CFRunLoopObserverRef defaultModeObserver;
    //创建观察者
    defaultModeObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, NSIntegerMax - 999, &Callback, &context);
    //添加当前RunLoop的观察者
    CFRunLoopAddObserver(runloop, defaultModeObserver, kCFRunLoopDefaultMode);
    //C语言里面有Creat\new\copy 就需要 释放 ARC 管不了!!
    CFRelease(defaultModeObserver);
    
}



@end
