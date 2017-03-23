//
//  ViewController.m
//  TextView
//
//  Created by HeFengyang on 2017/3/23.
//  Copyright © 2017年 hihfy. All rights reserved.
//

// 处理事件学习
// 什么情况下可能会出现，在使用约束时，约束错误。

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView1;
@property (weak, nonatomic) IBOutlet UITextView *textView2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textView2LayoutContstraintHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // textView superView 高度不够时，虽然能能显示，但却不能处理响应事件
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"\ntextView1 -->%@\ntextView1 superView%@\n",self.textView1, self.textView1.superview);
    NSLog(@"\ntextView2 --> %@\ntextView2 superView -->%@\n",self.textView2, self.textView2.superview);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    self.textView2LayoutContstraintHeight.constant ++;
    // 最后结论：当高度为点击点时就可以响应事件
    NSLog(@"\ntextView2 高度--> %@\n",@(self.textView2LayoutContstraintHeight.constant));
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.self.textView2];
    
    NSLog(@"\n点击位置 --> %@\n", NSStringFromCGPoint(point));
    
    NSString *test = @"1哈哈";
    // 判断是否与文字显示高度有关
    CGSize size = [test sizeWithAttributes:@{
                                             NSFontAttributeName : self.textView2.font
                                             }];
    NSLog(@"size --> %@",NSStringFromCGSize(size));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
