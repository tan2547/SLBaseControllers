//
//  SLCollectionController.h
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/27.
//  Copyright © 2017年 Sylar. All rights reserved.
//
//  该视图控制器的实例化  initWithLayout 方法已经被重写。调用时传入的style被放弃
#import <UIKit/UIKit.h>
#import "SLControllerLifeCircle.h"
#import "SLCollectionCell.h"
@protocol SLCollectionLiftCircle <NSObject>

@optional
- (NSArray<NSString*> *)sl_registerCollectionCell;
- (NSArray<NSString*> *)sl_registerCollectionNibCell;
- (NSArray<NSString*> *)sl_registerHeaderReuseView;
- (NSArray<NSString*> *)sl_registerHeaderNibReuseView;
- (NSArray<NSString*> *)sl_registerFooterReuseView;
- (NSArray<NSString*> *)sl_registerFooterNibReuseView;

/**
 *  @return 流式布局的滑动方式。
 */
- (UICollectionViewScrollDirection)sl_collectionDirection;
/**
 *  如果不实现则使用默认的布局实例，默认为flowLayout,itemSize为80，80，具体大小，请使用UICollectionViewDelegateFlowLayout的回调方法
 *  @return 布局类
 */
- (UICollectionViewLayout *)sl_layoutOfCollection;
- (NSString *)sl_collectionCellReuseIdentiferAtIndexPath:(NSIndexPath *)indexPath;
- (void)sl_afterBindCollectionCell:(SLCollectionCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@interface SLCollectionController : UICollectionViewController <SLControllerLifeCircle,SLCollectionLiftCircle,UICollectionViewDelegateFlowLayout>

/**
 *  布局数组
 *  二维
 *  存放动态字典
 */
@property (nonatomic,strong) NSMutableArray <NSMutableArray<NSMutableDictionary *> *>*layoutArray;

- (void)refreshController;

@end
