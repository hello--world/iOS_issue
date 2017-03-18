//
//  ViewController.m
//  StaticTableView
//
//  Created by hfy on 2017/2/26.
//  Copyright © 2017年 hihfy. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"%@",cell.label.text);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
