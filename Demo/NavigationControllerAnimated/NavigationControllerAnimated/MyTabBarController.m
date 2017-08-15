//
//  MyTabBarController.m
//  NavigationControllerAnimated
//
//  Created by hfy on 2017/8/15.
//  Copyright © 2017年 hfy. All rights reserved.
//

#import "MyTabBarController.h"
#import "Masonry.h"

#define VFL(__supView, __subView , __viewsDic, __ConstraintsString_H, __ConstraintsString_V) \
__subView.translatesAutoresizingMaskIntoConstraints = NO;\
NSMutableArray * __viewConstraints = [NSMutableArray array];\
[__viewConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:__ConstraintsString_H options:0 metrics:nil views:__viewsDic]];\
[__viewConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:__ConstraintsString_V options:0  metrics:nil views:__viewsDic]];\
[__supView addConstraints:__viewConstraints];

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor brownColor];
    view.frame = self.tabBar.bounds;
    [self.tabBar addSubview:view];
  
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [view addSubview:button];
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.mas_equalTo(0);
//        make.width.height.mas_equalTo(view.mas_height);
//    }];
    VFL(view, button, NSDictionaryOfVariableBindings(button), @"|-0-[button]-0-|", @"V:[button(20)]-0-|");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
