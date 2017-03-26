//
//  ViewController.m
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/26.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)sl_headerView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    view.backgroundColor = [UIColor yellowColor];
    return view;
}
@end
