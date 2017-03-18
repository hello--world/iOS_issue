//
//  TestManager.h
//  dispatch_onceDemo
//
//  Created by HeFengyang on 2017/3/18.
//  Copyright © 2017年 hihfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestManager : NSObject
@property (nonatomic, assign, readonly, getter=isIssue) BOOL issue;
+ (instancetype)sharedManager;
@end
