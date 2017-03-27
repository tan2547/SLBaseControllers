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

- (instancetype)initWithStyle:(UITableViewStyle)style{
    UITableViewStyle newstyle = UITableViewStyleGrouped;
    if ([self respondsToSelector:@selector(sl_styleOfTable)]) {
        newstyle = [self sl_styleOfTable];
    }
    self = [super initWithStyle:newstyle];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.layoutArray = [NSMutableArray arrayWithCapacity:1];
    
    [self registerCells];
    [self setupHeaderAndFooter];
    
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

- (void)registerCells{
    Class class = [SLTableCell class];
    [self.tableView registerClass:class forCellReuseIdentifier:NSStringFromClass(class)];
    
    NSArray *array = nil;
    if ([self respondsToSelector:@selector(sl_registerCell)]) {
        array = [self sl_registerCell];
        for (NSString *name in array) {
            [self.tableView registerClass:NSClassFromString(name) forCellReuseIdentifier:name];
        }
    }
    if ([self respondsToSelector:@selector(sl_registerNibCell)]) {
        array = [self sl_registerNibCell];
        for (NSString *name in array) {
            [self.tableView registerNib:[UINib nibWithNibName:name bundle:nil] forCellReuseIdentifier:name];
        }
    }
}

- (void)setupHeaderAndFooter{
    if ([self respondsToSelector:@selector(sl_headerView)]) {
        self.tableView.tableHeaderView = [self sl_headerView];
    }
    if ([self respondsToSelector:@selector(sl_footerView)]) {
        self.tableView.tableFooterView = [self sl_footerView];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.layoutArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.layoutArray objectAtIndex:section]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifer = @"SLTableCell";
    if ([self respondsToSelector:@selector(sl_reuseIdentiferAtIndexPath:)]) {
        reuseIdentifer = [self sl_reuseIdentiferAtIndexPath:indexPath];
    }
    NSMutableArray *sectionArray = [self.layoutArray objectAtIndex:indexPath.section];
    NSMutableDictionary *dic = [sectionArray objectAtIndex:indexPath.row];
    SLTableCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifer];
    if (cell == nil) {
        NSLog(@"cell空了");
    }
    [cell bindData:dic];
    if ([self respondsToSelector:@selector(sl_afterBindDataCell:atIndexPath:)]) {
        [self sl_afterBindDataCell:cell atIndexPath:indexPath];
    }
    return cell;
}

#pragma mark - 刷新控制器
- (void)refreshController{
    [self setupHeaderAndFooter];
    [self.tableView reloadData];
}

@end
