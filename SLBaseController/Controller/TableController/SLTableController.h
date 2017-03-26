//
//  SLTableController.h
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/26.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import "SLController.h"
#import "SLTableCell.h"
@interface SLTableController : SLController

#pragma mark - 属性

/**
 *  布局数组
 *  二维
 *  存放动态字典
 */
@property (nonatomic,strong) NSMutableArray <NSMutableArray<NSMutableDictionary *> *>*layoutArray;

@property (nonatomic ,strong) UITableView *tableView;

#pragma mark - 方法

- (NSArray<NSString*> *)sl_registerCell;
- (UITableViewStyle *)sl_styleOfTable;
- (UIView *)sl_headerView;
- (UIView *)sl_footerView;
- (NSString *)sl_reuseIdentiferAtIndexPath:(NSIndexPath *)indexPath;

@end
