//
//  TestModel.h
//  dispatch_onceDemo
//
//  Created by HeFengyang on 2017/3/18.
//  Copyright © 2017年 hihfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestModel : NSObject

+ (void)fetchWith:(void(^)(BOOL issue))callBlock;

@end
