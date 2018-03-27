//
//  VCViewModel.h
//  RAC_demo
//
//  Created by xxq on 2018/3/27.
//  Copyright © 2018年 qwe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCViewModel : NSObject

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *pwd;
@property (nonatomic, strong) RACSubject *successSubject;
@property (nonatomic, strong) RACSubject *failureSubject;
@property (nonatomic, strong) RACSubject *errorSubject;

- (id)buttodIsValid;
- (void)login;

@end
