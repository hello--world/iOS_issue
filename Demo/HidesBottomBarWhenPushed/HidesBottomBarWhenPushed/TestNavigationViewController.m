//
//  TestNavigationViewController.m
//  HidesBottomBarWhenPushed
//
//  Created by HeFengyang on 2017/3/24.
//  Copyright © 2017年 hihfy. All rights reserved.
//

#import "TestNavigationViewController.h"

@interface TestNavigationViewController ()

@end

@implementation TestNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    NSLog(@"self --> %@  viewControllers -->%@",self,self.viewControllers);
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
