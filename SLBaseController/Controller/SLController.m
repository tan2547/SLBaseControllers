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
    
    if ([self respondsToSelector:@selector(sl_prepareSubView)]) {
        [self sl_prepareSubView];
    }
    
    if ([self respondsToSelector:@selector(sl_prepareLayoutArray)]) {
        [self sl_prepareLayoutArray];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
