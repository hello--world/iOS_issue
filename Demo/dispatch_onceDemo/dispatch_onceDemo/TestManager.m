//
//  TestManager.m
//  dispatch_onceDemo
//
//  Created by HeFengyang on 2017/3/18.
//  Copyright © 2017年 hihfy. All rights reserved.
//

#import "TestManager.h"
#import "TestModel.h"

@interface TestManager ()

@property (nonatomic, assign, readwrite, getter=isIssue) BOOL issue;
@end

@implementation TestManager

static TestManager *_manager;

+ (instancetype)sharedManager {
    if (_manager == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
//            [self sharedManager]; // 出问题
            _manager = [[self alloc] init];
//            [self sharedManager]; // 上面加if判断，不出问题
        });
    }
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 调用了该方法，内部[TestManager sharedManager]，导致sharedManager 还没有执行完
        [TestModel fetchWith:^(BOOL issue) {
            NSLog(@"%@",@(issue));
        }];
    }
    return self;
}


@end
