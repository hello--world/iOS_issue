//
//  ViewController.m
//  HidesBottomBarWhenPushed
//
//  Created by HeFengyang on 2017/3/24.
//  Copyright © 2017年 hihfy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 写了该代码，运行时正常。在tabBarController的子控制器有NavigationController时，点击切换，当第二次点击就会触发隐藏
    self.hidesBottomBarWhenPushed = YES;
    // tabbar 点击切换是一次入栈？
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    // 该代码测试tabbar消失是否与它有关
    self.tabBarController.viewControllers = self.tabBarController.viewControllers;
    // 显示
    if (self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = NO;
    }
    // 4个navigationController
    NSLog(@"self --> %@  viewControllers -->%@",self,self.tabBarController.viewControllers);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
