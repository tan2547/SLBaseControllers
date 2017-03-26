//
//  SLTableController.m
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/26.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import "SLTableController.h"

@interface SLTableController ()

@end

@implementation SLTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sl_prepareSubView{
    [self setupTableView];
}

- (void)setupTableView{
    UITableViewStyle style = UITableViewStyleGrouped;
    if ([self respondsToSelector:@selector(sl_styleOfTable)]) {
        style = [self sl_styleOfTable];
    }
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:style];
    tableView.delegate = self;
    tableView.dataSource = self;
}

@end
