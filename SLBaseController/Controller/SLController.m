//
//  SLController.m
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/26.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import "SLController.h"

@interface SLController ()

@end

@implementation SLController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"判断是否实现:sl_prepareSubView");
    if ([self respondsToSelector:@selector(sl_prepareSubView)]) {
        NSLog(@"执行：sl_prepareSubView");
        [self sl_prepareSubView];
    }
    
    NSLog(@"判断是否实现：sl_prepareLayoutArray");
    if ([self respondsToSelector:@selector(sl_prepareLayoutArray)]) {
        NSLog(@"执行：sl_prepareLayoutArray");
        [self sl_prepareLayoutArray];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
