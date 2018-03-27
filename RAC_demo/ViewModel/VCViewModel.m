//
//  VCViewModel.m
//  RAC_demo
//
//  Created by xxq on 2018/3/27.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import "VCViewModel.h"

@interface VCViewModel ()

@property (nonatomic, strong) RACSignal *userNameSignal;
@property (nonatomic, strong) RACSignal *pwdSignal;
@property (nonatomic, strong) NSArray *requestData;

@end


@implementation VCViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.userNameSignal = RACObserve(self, userName);
    self.pwdSignal = RACObserve(self, self.pwd);
    self.successSubject = [RACSubject subject];
    self.failureSubject = [RACSubject subject];
    self.errorSubject = [RACSubject subject];
}

- (id)buttodIsValid {
    // 合并两个输入框的信号，并返回一个按钮 bool 类型的值；
    RACSignal *isVaild = [RACSignal combineLatest:@[self.userNameSignal, self.pwdSignal]
                                           reduce:^id(NSString *userName, NSString *pwd) {
        return @(self.userName.length > 3 & self.pwd.length > 3);
    }];
    return isVaild;
}

- (void)login {
    // 模拟网络请求
    self.requestData = @[_userName, _pwd];
    
    // 发送成功信号
    [self.successSubject sendNext:self.requestData];
    /*
    // 失败信号
    [self.failureSubject sendNext:nil];
    // 错误信号
    [self.errorSubject sendNext:nil];
     */
    
    // 异步网络操作
    
}


@end















