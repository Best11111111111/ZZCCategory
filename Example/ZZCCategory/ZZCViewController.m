//
//  ZZCViewController.m
//  ZZCCategory
//
//  Created by zzc on 06/10/2021.
//  Copyright (c) 2021 zhengzhicheng.com. All rights reserved.
//

#import "ZZCViewController.h"
#import "NSString+ZZCExtension.h"

@interface ZZCViewController ()

@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation ZZCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *a = @"https://t.bd.cn/td?title=测试&img=http://f.bd.cn/20_05(fn).png?w=3&h=4";
    
    NSString *bb = [a URLEncode];
    NSLog(@"%@", bb);
    NSString *aa = [bb URLDecode];
    NSLog(@"%@", aa);

    
    _queue = dispatch_queue_create("queue.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(_queue, ^{
        [self startTimer];
    });
}

- (void)startTimer{
    __block int timeout = 1000; //倒计时时间
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _queue);
    dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(timer, ^{
        if(timeout<=0){
            dispatch_source_cancel(timer);//销毁定时器
        }else{
            
        }
        NSLog(@"%d", timeout);
        timeout--;
    });
    
    dispatch_resume(timer);//恢复定时器
//    dispatch_suspend(timer);//挂起定时器
//    dispatch_source_cancel(timer);//销毁定时器
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self startTimer];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
