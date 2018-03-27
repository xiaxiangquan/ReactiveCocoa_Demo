//
//  ViewController.m
//  RAC_demo
//
//  Created by 夏祥全 on 2017/10/6.
//  Copyright © 2017年 qwe. All rights reserved.
//

#import "ViewController.h"
#import "VCViewModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (nonatomic, strong) VCViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    [self sequenceSwitch];
    [self combiningLatest];
    [self merge];
     */

    /*
     MVVM+ReactiveCocoa 简单应用 示例
    [self bindModel];
    // 按钮点击事件
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self.viewModel login];
    }];
     */
    
    [self.textField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
}

- (void)bindModel {
    self.viewModel = [[VCViewModel alloc] init];
    RAC(self.viewModel, userName) = self.textField.rac_textSignal;
    RAC(self.viewModel, pwd) = self.pwdTextField.rac_textSignal;
    RAC(self.loginBtn, enabled) = [self.viewModel buttodIsValid];
    
    @weakify(self);
    // 登陆成功要处理的方法
    [self.viewModel.successSubject subscribeNext:^(id x) {
        @strongify(self);
        NSLog(@"%@",self);
        NSLog(@"登陆成功啦~~~~~~~~");
    }];
    
    // 失败
    [self.viewModel.failureSubject subscribeNext:^(id x) {
        
    }];
    
    // 错误
    [self.viewModel.errorSubject subscribeNext:^(id x) {
        
    }];
    
}



/*
// Sequence 和 Map
- (void)uppercaseString {
    
    // 1. 把NSArray 通过rac_sequence 方法，生成 RAC 中的 sequence；
    RACSequence *sequence = [@[@"you", @"are", @"beautiful"] rac_sequence];
    // 2. 获取该 Sequence 对象的信号量；
    RACSignal *signal = sequence.signal;
    // 3. 调用 Signal 的 Map 方法，使每个元素的首字母大写 （capitalized 大写）；
    RACSignal *capitalizedSignal = [signal map:^id(id value) {
        return [value capitalizedString];
    }];
    // 4. 通过 subscribeNext 遍历输出；
    [signal subscribeNext:^(id x) {
        NSLog(@"signal = %@",x);
    }];
    [capitalizedSignal subscribeNext:^(id x) {
        NSLog(@"capitalizedSignal = %@", x);
    }];
    
    [[[@[@"you", @"are", @"beautiful"] rac_sequence].signal
      map:^id(NSString *value) {
        return [value capitalizedString];
        
      }] subscribeNext:^(id x) {
          NSLog(@"----  %@",x);
      }];
}

// 信号量开关
- (void)sequenceSwitch {
    // 创建三个自定义信号
    RACSubject *baidu = [RACSubject subject];
    RACSubject *google = [RACSubject subject];
    RACSubject *signalOfsignal = [RACSubject subject];
    // 获取开关信号
    RACSignal *switchSignal = [signalOfsignal switchToLatest];
    // 对通过的开关信号量 进行操作
    [[switchSignal map:^id(NSString *value) {
        return [NSString stringWithFormat:@"http://www.%@.com",value];
        
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    [signalOfsignal sendNext:google];
    [baidu sendNext:@"baidu"];
    [google sendNext:@"google"];
    
    [signalOfsignal sendNext:baidu];
    [google sendNext:@"google"];
    [baidu sendNext:@"baidu"];
}

// 信号量的合并
- (void)combiningLatest {
    // 信号量合并，把两个水管中的水合并成一个水管中的水，但这个合并有一个限制，就是必须两个水管中都要有水，才能进行合并；
    // 其中一方没水时，另一方则需要等到另一方有水后，才会进行合并；
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    
    [[RACSignal combineLatest:@[letters, numbers] reduce:^id(NSString *letter, NSString *number) {
        
        return [letter stringByAppendingString:number];
        
    }] subscribeNext:^(id x) {
        NSLog(@"----%@",x);
    }];
    
    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [numbers sendNext:@"1"];
    [letters sendNext:@"c"];
    [numbers sendNext:@"2"];
}

// 信号的合并
- (void)merge {
    RACSubject *A = [RACSubject subject];
    RACSubject *B = [RACSubject subject];
    RACSubject *C = [RACSubject subject];
    
    [[RACSignal merge:@[A, B, C]] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    [A sendNext:@"AAA"];
    [B sendNext:@"BBB"];
    [C sendNext:@"CCC"];
}
*/



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
