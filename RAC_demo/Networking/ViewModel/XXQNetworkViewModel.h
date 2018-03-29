//
//  XXQNetworkViewModel.h
//  RAC_demo
//
//  Created by xxq on 2018/3/29.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXQNetworkViewModel : NSObject

@property (nonatomic, strong) RACSubject *successSubject;
@property (nonatomic, strong) RACSubject *failedSubject;
@property (nonatomic, strong) RACSubject *errorSubject;

- (void)requestData;

@end
