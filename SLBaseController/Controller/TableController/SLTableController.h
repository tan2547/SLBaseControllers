//
//  SLTableController.h
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/26.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLController.h"
#import "SLTableCell.h"
@protocol SLTableLiftCircle <NSObject>

@optional
- (NSArray<NSString*> *)sl_registerCell;
- (NSArray<NSString*> *)sl_registerNibCell;
- (UITableViewStyle)sl_styleOfTable;
- (UIView *)sl_headerView;
- (UIView *)sl_footerView;
- (NSString *)sl_reuseIdentiferAtIndexPath:(NSIndexPath *)indexPath;
- (void)sl_afterBindDataCell:(SLTableCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@interface SLTableController : UITableViewController<SLController,SLTableLiftCircle>

/**
 *  布局数组
 *  二维
 *  存放动态字典
 */
@property (nonatomic,strong) NSMutableArray <NSMutableArray<NSMutableDictionary *> *>*layoutArray;

/**
 * 连同header,footer一同刷新，子类可以通过重写并在 [super refreshController]后增加刷新子类特有控件的方法
 */
- (void)refreshController;

@end
