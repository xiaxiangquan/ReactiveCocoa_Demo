//
//  XXQBasicViewController.m
//  RAC_demo
//
//  Created by 夏祥全 on 2018/3/29.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import "XXQBasicViewController.h"

@interface XXQBasicViewController ()

@end

@implementation XXQBasicViewController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setBackBtn];
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable*(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"aaa"];
        [subscriber sendNext:@"bbb"];
        
        [RACDisposable disposableWithBlock:^{
            NSLog(@"disposableWithBlock ");
        }];
        return subscriber;
    }];
    RACDisposable *disposable = [signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
        
    } error:^(NSError *error) {
        
    } completed:^{
        
    }];
    [disposable dispose];
    
}

- (void)setBackBtn {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = CGRectMake(100, self.view.bounds.size.height - 60, 40, 40);
    [self.view addSubview:btn];
    
//    @weakify(self);
//    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *btn) {
//        @strongify(self);
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }];;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
