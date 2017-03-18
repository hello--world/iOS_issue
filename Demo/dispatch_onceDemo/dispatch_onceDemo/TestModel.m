//
//  TestModel.m
//  dispatch_onceDemo
//
//  Created by HeFengyang on 2017/3/18.
//  Copyright © 2017年 hihfy. All rights reserved.
//

#import "TestModel.h"
#import "TestManager.h"

@implementation TestModel

+ (void)fetchWith:(void(^)(BOOL issue))callBlock {
    BOOL issue = [TestManager sharedManager].isIssue;
    if (callBlock) {
        callBlock(issue);
    }
}


@end
