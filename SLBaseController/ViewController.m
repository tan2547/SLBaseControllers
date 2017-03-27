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

- (UIView *)sl_footerView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    view.backgroundColor = [UIColor blueColor];
    return view;
}

- (void)sl_prepareLayoutArray{
    
    NSMutableArray *section = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i<10; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:1];
        [dic setObject:@(i) forKey:@"value"];
        [section addObject:dic];
    }
    [self.layoutArray addObject:section];
    [self refreshController];
}
@end
