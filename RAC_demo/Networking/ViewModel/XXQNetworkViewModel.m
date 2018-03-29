//
//  XXQNetworkViewModel.m
//  RAC_demo
//
//  Created by xxq on 2018/3/29.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import "XXQNetworkViewModel.h"

@implementation XXQNetworkViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.successSubject = [RACSubject subject];
    self.failedSubject = [RACSubject subject];
    self.errorSubject = [RACSubject subject];
}

- (void)requestData {
    
//    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil];
        [manager GET:@"https://api.douban.com/v2/book/isbn/:9787559608383" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self.successSubject sendNext:responseObject];
            [self.successSubject sendCompleted];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self.errorSubject sendError:error];
            
        }];
//        return nil;
//
//    }];
    
}

@end
