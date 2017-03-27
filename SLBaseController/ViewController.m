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

- (void)sl_prepareLayoutArray{
    
    NSMutableArray *section = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i<100; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:1];
        [dic setObject:@(i) forKey:@"value"];
        [section addObject:dic];
    }
    [self.layoutArray addObject:section];
    [self refreshController];
}

- (void)sl_afterBindCollectionCell:(SLCollectionCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
}
@end
